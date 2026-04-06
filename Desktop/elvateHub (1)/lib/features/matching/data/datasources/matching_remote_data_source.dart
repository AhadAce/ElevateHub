import 'dart:developer';

import 'package:elvateHub/core/cached/app_controller.dart';
import 'package:elvateHub/core/global_model/filter_model.dart';
import 'package:elvateHub/core/helpers/string_constant.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/firebase_helper.dart';
import '../../../../core/network/failure.dart';
import '../models/mentorship_model.dart';

abstract class MatchingRemoteDataSource {
  Future<List<UserModel>> getContributor();
  Future<List<MentorshipModel>> getMentorship({
    required MentorshipStatus? status,
  });
  Future<bool> createMentorship({
    required MentorshipModel data,
  });
  Future<bool> changeMentorshipStatus({
    required MentorshipStatus status,
    required String mentorshipId,
  });
}

@Injectable(as: MatchingRemoteDataSource)
class MatchingRemoteDataSourceImpl implements MatchingRemoteDataSource {
  @override
  Future<List<UserModel>> getContributor() async {
    try {
      final response = await FirebaseHelper.getData(
        collection: userCollection,
        filters: [
          FilterModel(
            field: 'isActive',
            value: true,
            type: FilterType.equals,
          ),
          FilterModel(
            field: 'type',
            value: UserType.contributor.name,
            type: FilterType.equals,
          ),
          FilterModel(
            field: 'categoryId',
            value: AppController.instance.getUserModel().categoryId,
            type: FilterType.equals,
          ),
        ],
      );
      List<UserModel> list = [];
      for (var e in response.docs) {
        list.add(UserModel.fromJson(e.data()));
      }
      return list;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  createMentorship({
    required MentorshipModel data,
  }) async {
    try {
      await FirebaseHelper.postData(
        collection: mentorshipCollection,
        data: data.toMap(),
      );

      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  changeMentorshipStatus({
    required MentorshipStatus status,
    required String mentorshipId,
  }) async {
    try {
      await FirebaseHelper.putData(
        collection: mentorshipCollection,
        documentId: mentorshipId,
        data: {
          'status': status.name,
        },
      );

      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<MentorshipModel>> getMentorship({
    required MentorshipStatus? status,
  }) async {
    try {
      final response = await FirebaseHelper.getData(
        collection: mentorshipCollection,
        filters: [
          FilterModel(
            field: AppController.instance.getUserModel().type ==
                    UserType.contributor
                ? 'contributorId'
                : 'userId',
            value: AppController.instance.getUserModel().id,
            type: FilterType.equals,
          ),
          if (status != null)
            FilterModel(
              field: 'status',
              value: status.name,
              type: FilterType.equals,
            )
        ],
      );
      List<MentorshipModel> list = [];
      for (var e in response.docs) {
        list.add(MentorshipModel.fromJson(e.data()));
      }
      List<MentorshipModel> finalList = [];
      for (final element in list) {
        final contributorResponse = await FirebaseHelper.getData(
          collection: userCollection,
          filters: [
            FilterModel(
              field: 'id',
              value: element.contributorId,
              type: FilterType.equals,
            ),
          ],
        );
        log('element.userIdelement.userId ${element.userId}');
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
        MentorshipModel finalMentorshipModel = element;
        if (contributorResponse.docs.isNotEmpty) {
          UserModel contributor = UserModel.fromJson(
            contributorResponse.docs.first.data(),
          );
          finalMentorshipModel =
              finalMentorshipModel.copyWith(contributorModel: contributor);
        }
        if (userResponse.docs.isNotEmpty) {
          UserModel user = UserModel.fromJson(
            userResponse.docs.first.data(),
          );
          finalMentorshipModel = finalMentorshipModel.copyWith(userModel: user);
        }
        finalList.add(finalMentorshipModel);
      }
      return finalList;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
