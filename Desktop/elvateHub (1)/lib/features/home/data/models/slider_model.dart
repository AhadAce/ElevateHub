// import 'package:clean_architecture_template_flutter/core/global_model/media_model.dart';
// import 'package:clean_architecture_template_flutter/features/home/domain/entities/slider_entity.dart';

// class SliderModel extends SliderEntity {
//   SliderModel({
//     List<SliderDataModel>? dataList,
//   }) : super(
//           dataList: dataList ?? [],
//         );

//   factory SliderModel.fromMap(Map<String, dynamic> data) {
//     List<SliderDataModel> dataL = [];
//     data['data'].forEach(
//       (v) => dataL.add(SliderDataModel.fromMap(v)),
//     );
//     return SliderModel(
//       dataList: dataL,
//     );
//   }

//   Map<String, dynamic> toMap() => {
//         'data': dataList,
//       };
// }

// class SliderDataModel extends SliderDataEntity {
//   SliderDataModel({
//     int? id,
//     int? userId,
//     int? pageId,
//     String? link,
//     MediaModel? media,
//   }) : super(
//           id: id ?? 0,
//           link: link ?? '',
//           pageId: pageId ?? -1,
//           userId: userId ?? -1,
//           media: media ?? MediaModel(id: 0, preview: '', url: ''),
//         );

//   factory SliderDataModel.fromMap(Map<String, dynamic> data) => SliderDataModel(
//         id: data['id'],
//         link: data['link'],
//         userId: data['user_id'],
//         pageId: data['page_id'],
//         media: MediaModel.fromMap(
//           data['media'] as Map<String, dynamic>,
//         ),
//       );

//   Map<String, dynamic> toMap() => {
//         'id': id,
//         'user_id': userId,
//         'page_id': pageId,
//         'link': link,
//         'media': media,
//       };
// }
