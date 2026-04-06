import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvateHub/features/job/data/models/job_model.dart';

import '../../../auth/domain/entities/user_entity.dart';

class JobEntity {
  final String id;
  final String title,
      desc,
      categoryId,
      userId,
      jobRequirment,
      companyName,
      imageUrl;
  final Timestamp createdAt;
  final bool forWomen;
  JobEntity({
    required this.imageUrl,
    required this.forWomen,
    required this.categoryId,
    required this.userId,
    required this.createdAt,
    required this.desc,
    required this.id,
    required this.title,
    required this.companyName,
    required this.jobRequirment,
  });
}

class ApplicationEntity {
  final String userId, message, cv, additional, jobId, jobUserId, id;
  final UserEntity userEntity;
  final ApplicationStatus status;
  final JobEntity jobEntity;
  ApplicationEntity({
    required this.id,
    required this.jobUserId,
    required this.additional,
    required this.jobId,
    required this.cv,
    required this.message,
    required this.userId,
    required this.userEntity,
    required this.jobEntity,
    required this.status,
  });
}
