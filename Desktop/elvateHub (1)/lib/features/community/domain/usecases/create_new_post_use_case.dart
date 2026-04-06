import 'package:dartz/dartz.dart';
import 'package:elvateHub/features/community/data/models/post_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/failure.dart';
import '../repositories/community_repo.dart';

@injectable
class CreateNewPostUseCase {
  final CommunityRepo _repo;
  const CreateNewPostUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({
    required PostModel postModel,
    required bool isWomen,
  }) async {
    return await _repo.createNewPost(
      postModel: postModel,
      isWomen: isWomen,
    );
  }
}
