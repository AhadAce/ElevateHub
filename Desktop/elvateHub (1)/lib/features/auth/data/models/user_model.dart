import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String? id;
  final String name;
  final String? image;
  final String email;
  final UserType type; // admin, user
  final String mobileNumber;
  final Gender gender; // male, female
  final bool isActive;
  final DateTime birthDate;
  final String categoryId;
  final String? attachment;
  final double rate;
  final List<RateModel> rateList;

  UserModel({
    this.id,
    this.image,
    this.attachment,
    required this.email,
    required this.type,
    required this.mobileNumber,
    required this.gender,
    required this.name,
    required this.birthDate,
    required this.isActive,
    required this.categoryId,
    required this.rate,
    required this.rateList,
  });

  // Convert UserModel to Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      if (id?.isNotEmpty ?? false) 'id': id,
      'name': name,
      'isActive': isActive,
      'birthDate': birthDate.toIso8601String(),
      'image': image,
      'email': email,
      'type': type.name,
      'attachment': attachment,
      'mobileNumber': mobileNumber,
      'categoryId': categoryId,
      'rate': rate,
      'rateList': rateList.map((element) => element.toMap()).toList(),
      'gender': gender.name,
    };
  }

  UserModel copyWith({
    String? name,
    String? id,
    String? image,
    String? email,
    UserType? type,
    String? mobileNumber,
    Gender? gender,
    bool? isActive,
    DateTime? birthDate,
    String? attachment,
    String? categoryId,
    double? rate,
    List<RateModel>? rateList,
  }) {
    return UserModel(
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      attachment: attachment ?? this.attachment,
      birthDate: birthDate ?? this.birthDate,
      isActive: isActive ?? this.isActive,
      id: id ?? this.id,
      image: image ?? this.image,
      email: email ?? this.email,
      type: type ?? this.type,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      gender: gender ?? this.gender,
      rate: rate ?? this.rate,
      rateList: rateList ?? this.rateList,
    );
  }

  factory UserModel.emptyOne() => UserModel(
        birthDate: DateTime.now(),
        isActive: false,
        name: '',
        email: '',
        id: '',
        type: UserType.user,
        mobileNumber: '',
        gender: Gender.male,
        image: '',
        attachment: '',
        categoryId: '',
        rate: 0,
        rateList: [],
      );

  // Create UserModel from Map (JSON)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserType type = getUserType(json['type'].toString());
    Gender gender = Gender.male;

    if (json['gender'] != null) {
      String genderString = json['gender'].toString();
      switch (genderString) {
        case 'male':
          gender = Gender.male;
          break;
        case 'female':
          gender = Gender.female;
          break;
        default:
          gender = Gender.male;
      }
    }
    List<RateModel> list = [];
    if (json['rateList'] != null && json['rateList'] is List) {
      List jsonList = json['rateList'];
      for (final element in jsonList) {
        list.add(RateModel.fromJson(element));
      }
    }
    return UserModel(
      isActive: json['isActive'] ?? false,
      name: json['name'] ?? '',
      categoryId: json['categoryId'] ?? '',
      birthDate:
          DateTime.tryParse(json['birthDate'].toString()) ?? DateTime.now(),
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      email: json['email'] ?? '',
      type: type,
      mobileNumber: json['mobileNumber'] ?? '',
      gender: gender,
      attachment: json['attachment'] ?? '',
      rate: json['rate'] ?? 0,
      rateList: list,
    );
  }
  UserEntity toEntity() => UserEntity(
        email: email,
        type: type,
        mobileNumber: mobileNumber,
        gender: gender,
        birthDate: birthDate,
        isActive: isActive,
        name: name,
        image: image,
        id: id,
        categoryId: categoryId,
        attachment: attachment,
        rate: rate,
        rateList: rateList.map((element) => element.toEntity()).toList(),
      );
}

class RateModel {
  final double rate;
  final String comment;

  RateModel({
    required this.comment,
    required this.rate,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
        comment: json['comment'] ?? '',
        rate: double.tryParse(json['rate'].toString()) ?? 0,
      );
  RateEntity toEntity() => RateEntity(
        comment: comment,
        rate: rate,
      );

  Map<String, dynamic> toMap() => {
        'comment': comment,
        'rate': rate,
      };
}
