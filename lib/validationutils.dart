class ValidationUtils {
  static bool isValidEmail(String? email) {
    if (email == null) return false;
    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
        "");
    return regex.hasMatch(email);
  }
}
