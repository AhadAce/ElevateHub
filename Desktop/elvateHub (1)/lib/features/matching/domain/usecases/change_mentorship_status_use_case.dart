import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/mentorship_model.dart';
import '../repositories/matching_repo.dart';

@injectable
class ChangeMentorshipStatusUseCase {
  final MatchingRepo _repo;
  const ChangeMentorshipStatusUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({
    required String mentorshipId,
    required MentorshipStatus status,
  }) async {
    return await _repo.changeMentorshipStatus(
      mentorshipId: mentorshipId,
      status: status,
    );
  }
}
