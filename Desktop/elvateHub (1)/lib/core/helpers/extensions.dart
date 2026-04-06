extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullNum on num? {
  num orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return 0.0;
    } else {
      return this!;
    }
  }
}

extension NonNullBoolean on bool? {
  bool orFalse() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension NonNullBooleanTrue on bool? {
  bool orTrue() {
    if (this == null) {
      return true;
    } else {
      return this!;
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PhoneNumberValidation on String {
  bool isMobileNumberValid() {
    String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    RegExp regExp = RegExp(regexPattern);

    if (length == 0) {
      return false;
    } else if (regExp.hasMatch(this)) {
      return true;
    }
    return false;
  }
}
