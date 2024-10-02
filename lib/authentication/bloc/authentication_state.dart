part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(AuthenticationStatus.unknow) AuthenticationStatus status,
    @Default(User.empty) User user,
  }) = _AuthenticationState;

  factory AuthenticationState.unknow() => const AuthenticationState();

  factory AuthenticationState.authenticated(User user) => AuthenticationState(
        status: AuthenticationStatus.authenticated,
        user: user,
      );

  factory AuthenticationState.unauthenticated() => const AuthenticationState(
        status: AuthenticationStatus.unauthenticated,
      );
}
