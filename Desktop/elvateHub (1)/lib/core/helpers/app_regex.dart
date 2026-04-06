class AppRegex {
  static RegExp phoneNumberRegex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
  static RegExp emailRegex =
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  static RegExp passwordRegex = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
  static RegExp lowerCaseRegex = RegExp(r'^(?=.*[a-z])');
  static RegExp upperCaseRegex = RegExp(r'^(?=.*[A-Z])');
  static RegExp hasNumberRegex = RegExp(r'^(?=.*?[0-9])');
  static RegExp hasSpecialCharacterRegex = RegExp(r'^(?=.*?[#?!@$%^&*-])');
  static RegExp hasMinLengthRegex = RegExp(r'^(?=.{8,})');

  static bool isEmailValid(String email) {
    return emailRegex.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return passwordRegex.hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return phoneNumberRegex.hasMatch(phoneNumber);
  }

  static bool hasLowerCase(String password) {
    return lowerCaseRegex.hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return upperCaseRegex.hasMatch(password);
  }

  static bool hasNumber(String password) {
    return hasNumberRegex.hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return hasSpecialCharacterRegex.hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return hasMinLengthRegex.hasMatch(password);
  }
}
