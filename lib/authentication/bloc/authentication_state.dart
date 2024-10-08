part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(AuthenticationStatus.unknown) AuthenticationStatus status,
    @Default(User.empty) User user,
  }) = _AuthenticationState;

  factory AuthenticationState.unknown() => const AuthenticationState();

  factory AuthenticationState.authenticated(User user) => AuthenticationState(
        status: AuthenticationStatus.authenticated,
        user: user,
      );

  factory AuthenticationState.unauthenticated() => const AuthenticationState(
        status: AuthenticationStatus.unauthenticated,
      );
}
