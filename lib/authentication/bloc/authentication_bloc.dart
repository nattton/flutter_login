import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(AuthenticationState.unknown()) {
    on<SubscriptionRequested>(_onSubscriptionRequested);
    on<LogoutPressed>(_onLogoutPressed);
  }

  FutureOr<void> _onSubscriptionRequested(
      SubscriptionRequested event, Emitter<AuthenticationState> emit) {
    return emit.onEach(_authenticationRepository.status,
        onData: (status) async {
      switch (status) {
        case AuthenticationStatus.unauthenticated:
          return emit(AuthenticationState.unauthenticated());
        case AuthenticationStatus.authenticated:
          final user = await _tryGetUser();
          return emit(user != null
              ? AuthenticationState.authenticated(user)
              : AuthenticationState.unauthenticated());
        case AuthenticationStatus.unknown:
          return emit(AuthenticationState.unknown());
      }
    }, onError: addError);
  }

  FutureOr<void> _onLogoutPressed(
      LogoutPressed event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
