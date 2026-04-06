import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';

class PostEntity {
  final String id;
  final String title, desc, categoryId, resource;
  final Timestamp createdAt;
  final List<CommentsEntity> comments;
  final List<String> likes;
  final String userId;
  final UserEntity userEntity;
  final bool isLike;
  PostEntity({
    required this.categoryId,
    required this.resource,
    required this.comments,
    required this.createdAt,
    required this.desc,
    required this.id,
    required this.likes,
    required this.title,
    required this.userEntity,
    required this.userId,
    required this.isLike,
  });
  PostEntity copyWith({
    bool? isLike,
    List<CommentsEntity>? comments,
  }) =>
      PostEntity(
        categoryId: categoryId,
        resource: resource,
        comments: comments ?? this.comments,
        createdAt: createdAt,
        desc: desc,
        id: id,
        likes: likes,
        title: title,
        userEntity: userEntity,
        userId: userId,
        isLike: isLike ?? this.isLike,
      );
}

class CommentsEntity {
  final String comment, userId, name, image;
  final UserEntity userEntity;
  CommentsEntity({
    required this.comment,
    required this.userId,
    required this.image,
    required this.name,
    required this.userEntity,
  });
}
