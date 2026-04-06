import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../repositories/community_repo.dart';

@injectable
class CommentPostUseCase {
  final CommunityRepo _repo;
  const CommentPostUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({
    required String comment,
    required String postId,
    required String userId,
    required String name,
    required String image,
    required bool isWomen,
  }) async {
    return await _repo.createNewComment(
      comment: comment,
      postId: postId,
      userId: userId,
      name: name,
      image: image,
      isWomen: isWomen,
    );
  }
}
