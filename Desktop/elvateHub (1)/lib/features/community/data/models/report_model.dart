class ReportModel {
  final String userId, postId, reason;
  ReportModel({
    required this.postId,
    required this.reason,
    required this.userId,
  });
  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        postId: json['postId'] ?? '',
        reason: json['reason'] ?? '',
        userId: json['userId'] ?? '',
      );
  Map<String, dynamic> toMap() => {
        'postId': postId,
        'reason': reason,
        'userId': userId,
      };
}
