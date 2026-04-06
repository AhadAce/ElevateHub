import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';
import 'package:elvateHub/features/community/domain/entities/post_entity.dart';

class PostModel {
  final String? id;
  final String title, desc, categoryId, userId;
  final Timestamp createdAt;
  final List<CommentsModel> comments;
  final List<String> likes;
  final UserModel? userModel;
  final String? resource;

  PostModel({
    required this.categoryId,
    required this.comments,
    required this.userId,
    this.userModel,
    this.resource,
    required this.createdAt,
    required this.desc,
    this.id,
    required this.likes,
    required this.title,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    List<CommentsModel> data = [];
    if (json['comments'] != null) {
      List list = json['comments'];
      for (final element in list) {
        data.add(CommentsModel.fromJson(element));
      }
    }
    return PostModel(
      categoryId: json['categoryId'] ?? '',
      resource: json['resource'] ?? '',
      comments: data,
      createdAt: json['createdAt'] ?? Timestamp.now(),
      desc: json['desc'] ?? '',
      likes: List<String>.from(json['likes'] ?? []),
      title: json['title'] ?? '',
      userId: json['userId'] ?? '',
      id: json['id'],
      userModel: json['userModel'] != null
          ? UserModel.fromJson(json['userModel'])
          : null,
    );
  }

  factory PostModel.emptyOne() => PostModel(
        categoryId: '',
        comments: [],
        resource: '',
        userId: '',
        createdAt: Timestamp.now(),
        desc: '',
        likes: [],
        title: '',
        userModel: UserModel.emptyOne(),
      );

  PostModel copyWith({
    String? id,
    String? categoryId,
    String? title,
    String? userId,
    String? desc,
    Timestamp? createdAt,
    UserModel? userModel,
    List<CommentsModel>? comments,
    List<String>? likes,
    String? resource,
  }) =>
      PostModel(
        resource: resource ?? this.resource,
        categoryId: categoryId ?? this.categoryId,
        comments: comments ?? this.comments,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
        desc: desc ?? this.desc,
        likes: likes ?? this.likes,
        title: title ?? this.title,
        id: id ?? this.id,
        userModel: userModel ?? this.userModel,
      );

  Map<String, dynamic> toJson() => {
        'categoryId': categoryId,
        'title': title,
        'userId': userId,
        'desc': desc,
        'createdAt': createdAt,
        'likes': likes,
        'resource': resource,
        'comments': comments.map((comment) => comment.toJson()).toList(),
      };
  PostEntity toEntity() {
    bool isLike = false;
    for (int i = 0; i < likes.length; i++) {
      if (likes[i] == (AppController.instance.getUserModel().id ?? '')) {
        isLike = true;
        break;
      }
    }
    return PostEntity(
      categoryId: categoryId,
      resource: resource ?? '',
      comments: comments.map((element) => element.toEntity()).toList(),
      createdAt: createdAt,
      desc: desc,
      isLike: isLike,
      id: id ?? '',
      likes: likes,
      title: title,
      userEntity: userModel?.toEntity() ?? UserModel.emptyOne().toEntity(),
      userId: userId,
    );
  }
}

class CommentsModel {
  final String comment, userId, name, image;
  final UserModel? userModel;
  CommentsModel({
    required this.comment,
    required this.userId,
    required this.image,
    required this.name,
    this.userModel,
  });
  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        comment: json['comment'] ?? '',
        userId: json['userId'] ?? '',
        image: json['image'] ?? '',
        name: json['name'] ?? '',
      );
  factory CommentsModel.emptyOne() => CommentsModel(
        comment: '',
        userId: '',
        userModel: UserModel.emptyOne(),
        image: '',
        name: '',
      );
  CommentsModel copyWith({
    String? comment,
    String? userId,
    String? name,
    String? image,
    UserModel? userModel,
  }) =>
      CommentsModel(
        comment: comment ?? this.comment,
        userId: userId ?? this.userId,
        userModel: userModel ?? this.userModel,
        name: name ?? this.name,
        image: image ?? this.image,
      );
  Map<String, dynamic> toJson() => {
        'comment': comment,
        'userId': userId,
        'name': name,
        'image': image,
        'userModel': userModel?.toJson(),
      };
  CommentsEntity toEntity() => CommentsEntity(
        comment: comment,
        userId: userId,
        name: name,
        image: image,
        userEntity: userModel?.toEntity() ?? UserModel.emptyOne().toEntity(),
      );
}
