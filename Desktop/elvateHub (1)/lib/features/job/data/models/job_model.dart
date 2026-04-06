import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';
import 'package:elvateHub/features/job/domain/entities/job_entity.dart';

class JobModel {
  final String? id;
  final String title,
      desc,
      categoryId,
      userId,
      jobRequirment,
      companyName,
      imageUrl;
  final bool forWomen;
  final Timestamp createdAt;
  factory JobModel.emptyOne() => JobModel(
        imageUrl: '',
        forWomen: false,
        categoryId: '',
        userId: '',
        createdAt: Timestamp.now(),
        desc: '',
        title: '',
        companyName: '',
        jobRequirment: '',
      );
  JobModel({
    required this.imageUrl,
    required this.categoryId,
    required this.userId,
    required this.createdAt,
    required this.desc,
    this.id,
    required this.title,
    required this.companyName,
    required this.jobRequirment,
    required this.forWomen,
  });

  JobEntity toEntity() => JobEntity(
        imageUrl: imageUrl,
        categoryId: categoryId,
        userId: userId,
        createdAt: createdAt,
        desc: desc,
        id: id ?? '',
        title: title,
        forWomen: forWomen,
        companyName: companyName,
        jobRequirment: jobRequirment,
      );

  // Factory constructor to create a JobModel from JSON
  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json['id'],
        title: json['title'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        desc: json['desc'] ?? '',
        forWomen: bool.tryParse(json['forWomen'].toString()) ?? false,
        categoryId: json['categoryId'] ?? '',
        userId: json['userId'] ?? '',
        jobRequirment: json['jobRequirment'] ?? '',
        companyName: json['companyName'] ?? '',
        createdAt: json['createdAt'] ?? Timestamp.now(),
      );

  // Convert a JobModel instance to a Map
  Map<String, dynamic> toMap() => {
        'title': title,
        'forWomen': forWomen,
        'imageUrl': imageUrl,
        'desc': desc,
        'categoryId': categoryId,
        'userId': userId,
        'jobRequirment': jobRequirment,
        'companyName': companyName,
        'createdAt': createdAt,
      };

  // CopyWith method to create a modified instance of JobModel
  JobModel copyWith({
    String? id,
    String? imageUrl,
    String? title,
    String? desc,
    String? categoryId,
    String? userId,
    String? jobRequirment,
    String? companyName,
    bool? forWomen,
    Timestamp? createdAt,
  }) =>
      JobModel(
        imageUrl: imageUrl ?? this.imageUrl,
        forWomen: forWomen ?? this.forWomen,
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        categoryId: categoryId ?? this.categoryId,
        userId: userId ?? this.userId,
        jobRequirment: jobRequirment ?? this.jobRequirment,
        companyName: companyName ?? this.companyName,
        createdAt: createdAt ?? this.createdAt,
      );
}

class Application {
  final String userId, message, cv, additional, jobId, jobUserId;
  final UserModel? userModel;
  final ApplicationStatus status;
  final JobModel? jobModel;
  final String? id;

  Application({
    required this.jobUserId,
    required this.additional,
    required this.jobId,
    required this.cv,
    required this.status,
    required this.message,
    required this.userId,
    this.userModel,
    this.jobModel,
    this.id,
  });

  factory Application.fromJson(Map<String, dynamic> json) => Application(
        additional: json['additional'] ?? '',
        jobUserId: json['jobUserId'] ?? '',
        cv: json['cv'] ?? '',
        id: json['id'] ?? '',
        message: json['message'] ?? '',
        userId: json['userId'] ?? '',
        jobId: json['jobId'] ?? '',
        status: applicationStatus[json['status'] ?? ''] ??
            ApplicationStatus.pending,
      );
  Map<String, dynamic> toMap() => {
        'additional': additional,
        'jobUserId': jobUserId,
        'cv': cv,
        'message': message,
        'userId': userId,
        'jobId': jobId,
        'status': status.name,
      };
  factory Application.emptyOne() => Application(
        additional: '',
        cv: '',
        id: '',
        jobUserId: '',
        message: '',
        userId: '',
        jobId: '',
        status: ApplicationStatus.pending,
      );
  Application copyWith({
    String? additional,
    String? cv,
    String? id,
    String? message,
    String? jobUserId,
    String? jobId,
    String? userId,
    ApplicationStatus? status,
    UserModel? userModel,
    JobModel? jobModel,
  }) =>
      Application(
        id: id ?? this.id,
        jobUserId: jobUserId ?? this.jobUserId,
        additional: additional ?? this.additional,
        status: status ?? this.status,
        cv: cv ?? this.cv,
        message: message ?? this.message,
        userId: userId ?? this.userId,
        userModel: userModel ?? this.userModel,
        jobId: jobId ?? this.jobId,
        jobModel: jobModel ?? this.jobModel,
      );
  ApplicationEntity toEntity() => ApplicationEntity(
        additional: additional,
        cv: cv,
        id: id ?? '',
        jobUserId: jobUserId,
        message: message,
        jobId: jobId,
        userId: userId,
        status: status,
        jobEntity: jobModel?.toEntity() ?? JobModel.emptyOne().toEntity(),
        userEntity: userModel?.toEntity() ?? UserModel.emptyOne().toEntity(),
      );
}

enum ApplicationStatus { pending, approve, reject }

extension ApplicationStatusExtension on ApplicationStatus {
  String toName() {
    switch (this) {
      case ApplicationStatus.pending:
        return 'pending';
      case ApplicationStatus.approve:
        return 'approved';
      case ApplicationStatus.reject:
        return 'rejected';
    }
  }
}

Map<String, ApplicationStatus> applicationStatus = {
  'pending': ApplicationStatus.pending,
  'approve': ApplicationStatus.approve,
  'reject': ApplicationStatus.reject,
};
