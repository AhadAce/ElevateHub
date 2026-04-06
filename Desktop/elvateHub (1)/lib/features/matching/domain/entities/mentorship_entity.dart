import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';

import '../../data/models/mentorship_model.dart';

class MentorshipEntity {
  final String contributorId, id, userId;
  final String duration, purpose, note, goal;
  final UserEntity contributorEntity, userEntity;
  final MentorshipStatus status;
  MentorshipEntity({
    required this.contributorId,
    required this.userEntity,
    required this.userId,
    required this.id,
    required this.status,
    required this.duration,
    required this.goal,
    required this.note,
    required this.contributorEntity,
    required this.purpose,
  });
}
