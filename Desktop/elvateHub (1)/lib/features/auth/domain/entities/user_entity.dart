import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/my_app.dart';

class UserEntity {
  final String? id;
  final String name;
  final String? image;
  final String email;
  final UserType type; // admin, user
  final String mobileNumber;
  final Gender gender; // male, female
  final bool isActive;
  final DateTime birthDate;
  final String? attachment;
  final String categoryId;
  final double rate;
  final List<RateEntity> rateList;

  UserEntity({
    this.id,
    this.image,
    this.attachment,
    required this.email,
    required this.categoryId,
    required this.type,
    required this.mobileNumber,
    required this.gender,
    required this.birthDate,
    required this.isActive,
    required this.name,
    required this.rate,
    required this.rateList,
  });
}

class RateEntity {
  final double rate;
  final String comment;

  RateEntity({
    required this.comment,
    required this.rate,
  });
}

enum UserType {
  user,
  contributor,
  admin,
}

extension UserTypeName on UserType {
  String get nameText {
    switch (this) {
      case UserType.user:
        return S.of(navigatorKey.currentContext!).user;
      case UserType.contributor:
        return S.of(navigatorKey.currentContext!).contributor;
      case UserType.admin:
        return S.of(navigatorKey.currentContext!).admin;
    }
  }
}

extension UserTypeId on UserType {
  String get id {
    switch (this) {
      case UserType.user:
        return 'user';
      case UserType.admin:
        return 'admin';
      case UserType.contributor:
        return 'contributor';
    }
  }
}

enum Gender {
  male,
  female,
}

extension GenderName on Gender {
  String get nameText {
    switch (this) {
      case Gender.male:
        return S.of(navigatorKey.currentContext!).male;
      case Gender.female:
        return S.of(navigatorKey.currentContext!).female;
    }
  }
}

enum UserStatus {
  active,
  inactive,
}
