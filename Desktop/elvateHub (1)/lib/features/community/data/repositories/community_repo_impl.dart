import 'package:dartz/dartz.dart';
import 'package:elvateHub/features/community/domain/entities/post_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../domain/repositories/community_repo.dart';
import '../datasources/ommunity_remote_data_source.dart';
import '../models/post_model.dart';
import '../models/report_model.dart';

@Injectable(as: CommunityRepo)
class CommunityRepoImpl implements CommunityRepo {
  final OmmunityRemoteDataSource _remoteDataSource;

  const CommunityRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts({
    String? categoryId,
    required bool isWomen,
  }) async {
    try {
      final response = await _remoteDataSource.getPosts(
        categoryId: categoryId,
        isWomen: isWomen,
      );
      return Right(response.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> createNewPost({
    required PostModel postModel,
    required bool isWomen,
  }) async {
    try {
      final response = await _remoteDataSource.createNewPost(
        postModel: postModel,
        isWomen: isWomen,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> reportPost({
    required ReportModel reportModel,
  }) async {
    try {
      final response = await _remoteDataSource.reportPost(
        reportModel: reportModel,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> createNewComment({
    required String postId,
    required String comment,
    required String userId,
    required String name,
    required String image,
    required bool isWomen,
  }) async {
    try {
      final response = await _remoteDataSource.createNewComment(
        postId: postId,
        comment: comment,
        userId: userId,
        name: name,
        image: image,
        isWomen: isWomen,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> likePost({
    required String postId,
    required bool like,
    required bool isWomen,
  }) async {
    try {
      final response = await _remoteDataSource.likePost(
        postId: postId,
        like: like,
        isWomen: isWomen,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
