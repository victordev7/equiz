class UserParams {
  late final String name;
  late final String email;
  late final String password;

  UserParams({required this.name, required this.email, required this.password});

  bool _validator(String toBeValidated, String rules) {
    var matcher = RegExp(rules);
    return matcher.hasMatch(toBeValidated);
  }

  bool get isPasswordValid => _validator(
      password, r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');

  bool get isEmailValid =>
      _validator(email, r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  bool get isNameValid => name.length >= 4;
}
