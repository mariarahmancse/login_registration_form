/// Simple in-memory auth (demo only).
/// Data app restart korle muchhe jabe. Real backend (Firebase / API)
/// lagale shudhu ei file ta replace korlei hobe.
class AppUser {
  final String name;
  final String email;
  final String password;

  const AppUser({
    required this.name,
    required this.email,
    required this.password,
  });
}

class AuthService {
  AuthService._();

  static final Map<String, AppUser> _users = {};

  /// Returns null on success, or an error message.
  static String? register({
    required String name,
    required String email,
    required String password,
  }) {
    final key = email.trim().toLowerCase();
    if (_users.containsKey(key)) {
      return 'This email is already registered';
    }
    _users[key] = AppUser(
      name: name.trim(),
      email: key,
      password: password,
    );
    return null;
  }

  /// Returns the user on success, or null if credentials are wrong.
  static AppUser? login({required String email, required String password}) {
    final user = _users[email.trim().toLowerCase()];
    if (user != null && user.password == password) return user;
    return null;
  }
}
