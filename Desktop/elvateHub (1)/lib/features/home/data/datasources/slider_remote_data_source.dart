// import 'package:clean_architecture_template_flutter/core/network/failure.dart';
// import 'package:clean_architecture_template_flutter/features/home/domain/entities/slider_entity.dart';
// import 'package:injectable/injectable.dart';
// import 'package:logger/logger.dart';

// import '../../../../core/helpers/dio_helper.dart';
// import '../models/slider_model.dart';

// abstract class SliderRemoteDataSource {
//   Future<SliderEntity> getSlider();
// }

// @Injectable(as: SliderRemoteDataSource)
// class SliderRemoteDataSourceImpl implements SliderRemoteDataSource {
//   @override
//   Future<SliderModel> getSlider() async {
//     final response = await DioHelper.getData(
//       url: 'slides',
//     );
//     try {
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return SliderModel.fromMap(response.data);
//       } else {
//         Logger().d(
//             'status code not 200 or 201, status code ${response.statusCode!}, and response data ${response.data}');
//         throw ServerFailure.fromResponse(response.statusCode!, response.data);
//       }
//     } on ServerFailure catch (e) {
//       throw ServerFailure(e.message);
//     }
//   }
// }
