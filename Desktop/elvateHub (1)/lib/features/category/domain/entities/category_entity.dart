import '../../../../core/global_model/drop_down_model.dart';

class CategoryEntity extends DropDownModel {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? flag;
  @override
  final bool? needUploadFile;

  CategoryEntity({
    required this.id,
    required this.flag,
    required this.name,
    required this.needUploadFile,
  });
}
