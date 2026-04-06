import 'package:dartz/dartz.dart';
import 'package:elvateHub/features/community/data/models/post_model.dart';
import '../../../../core/network/failure.dart';
import '../../data/models/report_model.dart';
import '../entities/post_entity.dart';

abstract class CommunityRepo {
  Future<Either<Failure, List<PostEntity>>> getPosts({
    String? categoryId,
    required bool isWomen,
  });
  Future<Either<Failure, bool>> createNewPost({
    required PostModel postModel,
    required bool isWomen,
  });
  Future<Either<Failure, bool>> reportPost({
    required ReportModel reportModel,
  });
  Future<Either<Failure, bool>> createNewComment({
    required String postId,
    required String comment,
    required String userId,
    required String name,
    required String image,
    required bool isWomen,
  });
  Future<Either<Failure, bool>> likePost({
    required String postId,
    required bool like,
    required bool isWomen,
  });
}
