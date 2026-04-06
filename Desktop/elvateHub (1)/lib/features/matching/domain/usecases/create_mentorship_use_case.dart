import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/mentorship_model.dart';
import '../repositories/matching_repo.dart';

@injectable
class CreateMentorshipUseCase {
  final MatchingRepo _repo;
  const CreateMentorshipUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({
    required MentorshipModel data,
  }) async {
    return await _repo.createMentorship(
      data: data,
    );
  }
}
