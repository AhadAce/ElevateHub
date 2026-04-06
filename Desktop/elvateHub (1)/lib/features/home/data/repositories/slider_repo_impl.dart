// import 'package:clean_architecture_template_flutter/core/network/failure.dart';
// import 'package:clean_architecture_template_flutter/features/home/domain/entities/slider_entity.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// import '../../domain/repositories/slider_repo.dart';
// import '../datasources/slider_remote_data_source.dart';

// @Injectable(as: SliderRepo)
// class SliderRepoImpl implements SliderRepo {
//   final SliderRemoteDataSource _sliderRemoteDataSource;

//   const SliderRepoImpl(this._sliderRemoteDataSource);

//   @override
//   Future<Either<Failure, SliderEntity>> getSlider() async {
//     try {
//       final response = await _sliderRemoteDataSource.getSlider();
//       return Right(response);
//     } on DioException catch (e) {
//       return Left(ServerFailure.fromDiorError(e));
//     }
//   }
// }
