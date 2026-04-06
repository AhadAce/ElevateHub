import 'package:dartz/dartz.dart';
import 'package:elvateHub/features/matching/domain/entities/mentorship_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/mentorship_model.dart';
import '../repositories/matching_repo.dart';

@injectable
class GetMentorshipUseCase {
  final MatchingRepo _repo;
  const GetMentorshipUseCase(
    this._repo,
  );

  Future<Either<Failure, List<MentorshipEntity>>> call({
    required MentorshipStatus? status,
  }) async {
    return await _repo.getMentorship(status: status);
  }
}
