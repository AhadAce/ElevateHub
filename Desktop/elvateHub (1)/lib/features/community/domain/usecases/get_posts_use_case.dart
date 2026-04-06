import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../entities/post_entity.dart';
import '../repositories/community_repo.dart';

@injectable
class GetPostsUseCase {
  final CommunityRepo _repo;
  const GetPostsUseCase(
    this._repo,
  );

  Future<Either<Failure, List<PostEntity>>> call({
    String? categoryId,
    required bool isWomen,
  }) async {
    return await _repo.getPosts(
      categoryId: categoryId,
      isWomen: isWomen,
    );
  }
}
