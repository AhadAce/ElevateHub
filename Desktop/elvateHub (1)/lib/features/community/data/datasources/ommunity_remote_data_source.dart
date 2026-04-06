import 'dart:io';

import 'package:elvateHub/core/global_model/filter_model.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:injectable/injectable.dart';
import 'package:elvateHub/features/community/data/models/post_model.dart';
import 'package:elvateHub/core/helpers/firebase_helper.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';

import '../../../../core/helpers/string_constant.dart';
import '../../../../core/network/failure.dart';
import '../models/report_model.dart';

abstract class OmmunityRemoteDataSource {
  Future<List<PostModel>> getPosts({
    String? categoryId,
    required bool isWomen,
  });
  Future<bool> createNewPost({
    required PostModel postModel,
    required bool isWomen,
  });
  Future<bool> reportPost({
    required ReportModel reportModel,
  });
  Future<bool> createNewComment({
    required String postId,
    required String comment,
    required String userId,
    required String name,
    required String image,
    required bool isWomen,
  });
  Future<bool> likePost({
    required String postId,
    required bool like,
    required bool isWomen,
  });
}

@Injectable(as: OmmunityRemoteDataSource)
class CommunityRemoteDataSourceImpl implements OmmunityRemoteDataSource {
  @override
  Future<List<PostModel>> getPosts({
    String? categoryId,
    required bool isWomen,
  }) async {
    try {
      String finalPostCollection =
          isWomen ? womenPostCollection : postCollection;

      final response = await FirebaseHelper.getData(
        collection: finalPostCollection,
        filters: [
          FilterModel(
            field: 'categoryId',
            value: categoryId,
            type: FilterType.equals,
          ),
        ],
      );
      List<PostModel> initPost = [];
      for (var element in response.docs) {
        initPost.add(
          PostModel.fromJson(
            element.data(),
          ),
        );
      }
      List<PostModel> finalPost = [];
      for (final element in initPost) {
        final userResponse = await FirebaseHelper.getData(
          collection: userCollection,
          filters: [
            FilterModel(
              field: 'id',
              value: element.userId,
              type: FilterType.equals,
            ),
          ],
        );
        UserModel userModel = UserModel.emptyOne();
        if (userResponse.docs.isNotEmpty) {
          userModel = UserModel.fromJson(userResponse.docs.first.data());
        }
        PostModel finalPostModel = element.copyWith(userModel: userModel);
        finalPost.add(finalPostModel);
      }
      return finalPost;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<bool> createNewPost({
    required PostModel postModel,
    required bool isWomen,
  }) async {
    try {
      String finalPostCollection =
          isWomen ? womenPostCollection : postCollection;
      if (postModel.resource != null) {
        String resourceUrl = await FirebaseHelper.uploadFile(
          file: File(postModel.resource ?? ''),
          userId: AppController.instance.getUserModel().id ?? '',
          folderName: 'posts',
        );
        postModel = postModel.copyWith(resource: resourceUrl);
      }
      await FirebaseHelper.postData(
        collection: finalPostCollection,
        data: postModel.toJson(),
      );
      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<bool> reportPost({
    required ReportModel reportModel,
  }) async {
    try {
      await FirebaseHelper.postData(
        collection: reportCollection,
        data: reportModel.toMap(),
      );

      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<bool> createNewComment({
    required String postId,
    required String comment,
    required String userId,
    required String name,
    required String image,
    required bool isWomen,
  }) async {
    try {
      String finalPostCollection =
          isWomen ? womenPostCollection : postCollection;
      final response = await FirebaseHelper.getData(
        collection: finalPostCollection,
        filters: [
          FilterModel(
            field: 'id',
            value: postId,
            type: FilterType.equals,
          ),
        ],
      );
      if (response.docs.isNotEmpty) {
        PostModel post = PostModel.fromJson(response.docs.first.data());
        List<CommentsModel> comments = post.comments;
        comments.add(
          CommentsModel(
            comment: comment,
            userId: userId,
            image: image,
            name: name,
          ),
        );
        await FirebaseHelper.putData(
          collection: finalPostCollection,
          documentId: postId,
          data: {
            'comments': comments.map((comment) => comment.toJson()).toList(),
          },
        );
      }

      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<bool> likePost({
    required String postId,
    required bool like,
    required bool isWomen,
  }) async {
    try {
      String finalPostCollection =
          isWomen ? womenPostCollection : postCollection;
      final response = await FirebaseHelper.getData(
        collection: finalPostCollection,
        filters: [
          FilterModel(
            field: 'id',
            value: postId,
            type: FilterType.equals,
          ),
        ],
      );
      if (response.docs.isNotEmpty) {
        PostModel post = PostModel.fromJson(response.docs.first.data());
        List<String> likes = post.likes;
        likes.add(AppController.instance.getUserModel().id ?? '');
        await FirebaseHelper.putData(
          collection: finalPostCollection,
          documentId: postId,
          data: {
            'likes': likes,
          },
        );
      }

      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
