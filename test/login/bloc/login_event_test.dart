// ignore_for_file: prefer_const_constructors
import 'package:flutter_login/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const username = 'mock-username';
  const password = 'mock-password';
  group('LoginEvent', () {
    group('UsernameChanged', () {
      test('supports value comparisons', () {
        expect(UsernameChanged(username), UsernameChanged(username));
      });
    });

    group('PasswordChanged', () {
      test('supports value comparisons', () {
        expect(PasswordChanged(password), PasswordChanged(password));
      });
    });

    group('Submitted', () {
      test('supports value comparisons', () {
        expect(Submitted(), Submitted());
      });
    });
  });
}
