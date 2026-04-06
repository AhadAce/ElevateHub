import 'package:dartz/dartz.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/matching/domain/entities/mentorship_entity.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/mentorship_model.dart';

abstract class MatchingRepo {
  Future<Either<Failure, List<UserEntity>>> getContributor();
  Future<Either<Failure, List<MentorshipEntity>>> getMentorship({
    required MentorshipStatus? status,
  });
  Future<Either<Failure, bool>> createMentorship({
    required MentorshipModel data,
  });
  Future<Either<Failure, bool>> changeMentorshipStatus({
    required MentorshipStatus status,
    required String mentorshipId,
  });
}
