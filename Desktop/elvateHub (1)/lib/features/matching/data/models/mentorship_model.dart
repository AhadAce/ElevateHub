import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';
import 'package:elvateHub/features/matching/domain/entities/mentorship_entity.dart';

class MentorshipModel {
  String? id;
  final String contributorId;
  final String? duration, purpose, note, goal, userId;
  final UserModel? contributorModel, userModel;

  final MentorshipStatus status;
  MentorshipModel({
    required this.contributorId,
    required this.status,
    this.duration,
    this.goal,
    this.userId,
    this.note,
    this.purpose,
    this.contributorModel,
    this.userModel,
    this.id,
  });

  factory MentorshipModel.emptyOne() => MentorshipModel(
        contributorId: '',
        status: MentorshipStatus.pending,
      );

  MentorshipModel copyWith({
    String? contributorId,
    String? duration,
    String? goal,
    String? note,
    String? purpose,
    MentorshipStatus? status,
    String? id,
    UserModel? contributorModel,
    UserModel? userModel,
  }) =>
      MentorshipModel(
        id: id ?? this.id,
        contributorId: contributorId ?? this.contributorId,
        duration: duration ?? this.duration,
        goal: goal ?? this.goal,
        note: note ?? this.note,
        purpose: purpose ?? this.purpose,
        status: status ?? this.status,
        contributorModel: contributorModel ?? this.contributorModel,
        userModel: userModel ?? this.userModel,
      );

  Map<String, dynamic> toMap() => {
        'contributorId': contributorId,
        'duration': duration,
        'goal': goal,
        'note': note,
        'purpose': purpose,
        'status': status.name,
        'userId': AppController.instance.getUserModel().id,
      };

  factory MentorshipModel.fromJson(Map<String, dynamic> json) =>
      MentorshipModel(
        contributorId: json['contributorId'] ?? '',
        id: json['id'] ?? '',
        status: getMentorship[json['status']] ?? MentorshipStatus.pending,
        duration: json['duration'] ?? '',
        goal: json['goal'] ?? '',
        note: json['note'] ?? '',
        userId: json['userId'] ?? '',
        purpose: json['purpose'] ?? '',
      );
  MentorshipEntity toEntity() => MentorshipEntity(
        contributorId: contributorId,
        userId: userId ?? '',
        status: status,
        id: id ?? '',
        duration: duration ?? '',
        goal: goal ?? '',
        note: note ?? '',
        purpose: purpose ?? '',
        contributorEntity:
            contributorModel?.toEntity() ?? UserModel.emptyOne().toEntity(),
        userEntity: userModel?.toEntity() ?? UserModel.emptyOne().toEntity(),
      );
}

enum MentorshipStatus { pending, approve, reject, cancel }

extension MentorshipStatusExtension on MentorshipStatus {
  String toName() {
    switch (this) {
      case MentorshipStatus.pending:
        return 'pending';
      case MentorshipStatus.approve:
        return 'approved';
      case MentorshipStatus.reject:
        return 'rejected';
      case MentorshipStatus.cancel:
        return 'canceled';
    }
  }
}

Map<String, MentorshipStatus> getMentorship = {
  'pending': MentorshipStatus.pending,
  'approve': MentorshipStatus.approve,
  'reject': MentorshipStatus.reject,
  'cancel': MentorshipStatus.cancel,
};
