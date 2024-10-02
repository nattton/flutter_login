part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.subscriptionRequested() =
      SubscriptionRequested;
  const factory AuthenticationEvent.logoutPressed() = LogoutPressed;
}
