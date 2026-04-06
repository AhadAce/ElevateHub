import 'dart:io';

import 'package:elvateHub/core/cached/app_controller.dart';
import 'package:elvateHub/core/global_model/filter_model.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/job/data/models/job_model.dart';
import 'package:injectable/injectable.dart';
import 'package:elvateHub/core/helpers/firebase_helper.dart';

import '../../../../core/helpers/string_constant.dart';
import '../../../../core/network/failure.dart';

abstract class JobRemoteDataSource {
  Future<List<JobModel>> getJobs({
    String? categoryId,
    String? userId,
    String? search,
  });
  Future<List<Application>> getApplications({
    required bool needUserJob,
  });
  Future<bool> createNewJob({
    required JobModel jobModel,
    required bool isUpdate,
  });
  Future<bool> applyJob({
    required Application application,
    required String jobId,
  });
  Future<bool> approveUser({
    required String applicationId,
    required bool approve,
  });
}

@Injectable(as: JobRemoteDataSource)
class JobRemoteDataSourceImpl implements JobRemoteDataSource {
  @override
  Future<List<Application>> getApplications({
    required bool needUserJob,
  }) async {
    try {
      final response = await FirebaseHelper.getData(
        collection: applicationCollection,
        filters: [
          FilterModel(
            field: needUserJob ? 'jobUserId' : 'userId',
            value: AppController.instance.getUserModel().id ?? '',
            type: FilterType.equals,
          ),
        ],
      );
      List<Application> initApplication = [];
      for (var element in response.docs) {
        Application application = Application.fromJson(
          element.data(),
        );
        initApplication.add(
          application,
        );
      }
      List<Application> finalApplication = [];

      for (final element in initApplication) {
        final jobResponsse = await FirebaseHelper.getData(
          collection: jobCollection,
          filters: [
            FilterModel(
              field: 'id',
              value: 'element.jobId',
              type: FilterType.equals,
            ),
          ],
        );
        final userResponsse = await FirebaseHelper.getData(
          collection: userCollection,
          filters: [
            FilterModel(
              field: 'id',
              value: element.userId,
              type: FilterType.equals,
            ),
          ],
        );
        JobModel jobModel = JobModel.emptyOne();
        UserModel userModel = UserModel.emptyOne();
        if (jobResponsse.docs.isNotEmpty) {
          jobModel = JobModel.fromJson(jobResponsse.docs.first.data());
        }
        if (userResponsse.docs.isNotEmpty) {
          userModel = UserModel.fromJson(userResponsse.docs.first.data());
        }
        finalApplication.add(element.copyWith(
          userModel: userModel,
          jobModel: jobModel,
        ));
      }

      return finalApplication;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<JobModel>> getJobs({
    String? categoryId,
    String? userId,
    String? search,
  }) async {
    try {
      final response = await FirebaseHelper.getData(
        collection: jobCollection,
        filters: [
          FilterModel(
            field: userId != null ? 'userId' : 'categoryId',
            value: userId ?? categoryId,
            type: FilterType.equals,
          ),
          FilterModel(
            field: 'title',
            value: search,
            type: FilterType.greaterThanOrEquals,
          ),
          FilterModel(
            field: 'title',
            value: '$search\uF7FF',
            type: FilterType.lessThanOrEquals,
          ),
          if (AppController.instance.getUserModel().gender == Gender.male)
            FilterModel(
              field: 'forWomen',
              value: false,
              type: FilterType.equals,
            ),
        ],
      );
      List<JobModel> initPost = [];
      for (var element in response.docs) {
        initPost.add(
          JobModel.fromJson(
            element.data(),
          ),
        );
      }

      return initPost;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<bool> createNewJob({
    required JobModel jobModel,
    required bool isUpdate,
  }) async {
    try {
      if (isUpdate) {
        await FirebaseHelper.putData(
          collection: jobCollection,
          data: jobModel.toMap(),
          documentId: jobModel.id ?? '',
        );
      } else {
        await FirebaseHelper.postData(
          collection: jobCollection,
          data: jobModel.toMap(),
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
  Future<bool> applyJob({
    required Application application,
    required String jobId,
  }) async {
    try {
      String cvUrl = await FirebaseHelper.uploadFile(
        file: File(application.cv),
        userId: application.userId,
        folderName: 'jobs',
      );
      String additionalUrl = await FirebaseHelper.uploadFile(
        file: File(application.additional),
        userId: application.userId,
        folderName: 'jobs',
      );
      application = application.copyWith(
        cv: cvUrl,
        additional: additionalUrl,
      );
      await FirebaseHelper.postData(
        collection: applicationCollection,
        data: application.toMap(),
      );
      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<bool> approveUser({
    required String applicationId,
    required bool approve,
  }) async {
    try {
      await FirebaseHelper.putData(
        collection: applicationCollection,
        data: {
          'status': approve
              ? ApplicationStatus.approve.name
              : ApplicationStatus.reject.name,
        },
        documentId: applicationId,
      );

      return true;
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
