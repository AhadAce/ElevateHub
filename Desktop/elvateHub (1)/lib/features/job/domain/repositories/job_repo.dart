import 'package:dartz/dartz.dart';
import '../../../../core/network/failure.dart';
import '../../data/models/job_model.dart';
import '../entities/job_entity.dart';

abstract class JobRepo {
  Future<Either<Failure, List<JobEntity>>> getJobs({
    String? categoryId,
    String? userId,
    String? search,
  });
  Future<Either<Failure, List<ApplicationEntity>>> getApplications({
    required bool needUserJob,
  });
  Future<Either<Failure, bool>> createNewJob({
    required JobModel jobModel,
    required bool isUpdate,
  });
  Future<Either<Failure, bool>> applyJob({
    required Application application,
    required String jobId,
  });
  Future<Either<Failure, bool>> approveUser({
    required String applicationId,
    required bool approve,
  });
}
