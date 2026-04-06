import 'package:elvateHub/core/gloabal_entitiy/name_entity.dart';

class NameModel {
  final String ar, en;
  NameModel({
    required this.ar,
    required this.en,
  });
  factory NameModel.fromJson({required Map<String, dynamic> json}) => NameModel(
        ar: json['ar'] ?? '',
        en: json['en'] ?? '',
      );
  factory NameModel.emptyOne() => NameModel(
        ar: '',
        en: '',
      );

  Map<String, dynamic> toJson() => {
        'ar': ar,
        "en": en,
      };
  NameEntity toEntity() => NameEntity(
        ar: ar,
        en: en,
      );
}
