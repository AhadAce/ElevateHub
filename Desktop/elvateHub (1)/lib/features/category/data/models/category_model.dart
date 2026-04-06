import '../../domain/entities/category_entity.dart';

class CategoryModel {
  final String? id;
  final String? name;
  final String? flag;
  final bool? needUploadFile;

  CategoryModel({
    required this.id,
    required this.flag,
    required this.name,
    required this.needUploadFile,
  });
  factory CategoryModel.fromJson({required Map<String, dynamic> json}) =>
      CategoryModel(
        id: json['id'] ?? '',
        needUploadFile:
            bool.tryParse(json['needUploadFile'].toString()) ?? false,
        flag: json['image'] ?? '',
        name: json['name'] ?? '',
      );

  factory CategoryModel.emptyOne() => CategoryModel(
        id: '',
        flag: '',
        name: '',
        needUploadFile: false,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': flag,
        'needUploadFile': needUploadFile,
        if (id?.isNotEmpty ?? false) 'id': id,
      };
  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        flag: flag,
        name: name,
        needUploadFile: needUploadFile,
      );
}
