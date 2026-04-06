import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../repositories/community_repo.dart';

@injectable
class LikePostUseCase {
  final CommunityRepo _repo;
  const LikePostUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({
    required bool like,
    required String postId,
    required bool isWomen,
  }) async {
    return await _repo.likePost(
      like: like,
      postId: postId,
      isWomen: isWomen,
    );
  }
}
