enum AuthResult {
  successfulRegistration(message: 'Registration successful', ok: true),
  successfulLogin(message: 'Login successful', ok: true),
  registrationFailed(message: 'Registration failed'),
  wrongPassword(message: 'Wrong password'),
  userNotFound(message: 'User not found');

  const AuthResult({required this.message, this.ok = false});

  final String message;
  final bool ok;
}
