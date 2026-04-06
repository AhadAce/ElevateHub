import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../domain/entities/job_entity.dart';
import '../../domain/repositories/job_repo.dart';
import '../datasources/job_remote_data_source.dart';
import '../models/job_model.dart';

@Injectable(as: JobRepo)
class JobRepoImpl implements JobRepo {
  final JobRemoteDataSource _remoteDataSource;

  const JobRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ApplicationEntity>>> getApplications({
    required bool needUserJob,
  }) async {
    try {
      final response = await _remoteDataSource.getApplications(
        needUserJob: needUserJob,
      );
      return Right(response.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<JobEntity>>> getJobs({
    String? categoryId,
    String? userId,
    String? search,
  }) async {
    try {
      final response = await _remoteDataSource.getJobs(
        categoryId: categoryId,
        userId: userId,
        search: search,
      );
      return Right(response.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> createNewJob({
    required JobModel jobModel,
    required bool isUpdate,
  }) async {
    try {
      final response = await _remoteDataSource.createNewJob(
        jobModel: jobModel,
        isUpdate: isUpdate,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> applyJob({
    required Application application,
    required String jobId,
  }) async {
    try {
      final response = await _remoteDataSource.applyJob(
        application: application,
        jobId: jobId,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> approveUser({
    required String applicationId,
    required bool approve,
  }) async {
    try {
      final response = await _remoteDataSource.approveUser(
        applicationId: applicationId,
        approve: approve,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
