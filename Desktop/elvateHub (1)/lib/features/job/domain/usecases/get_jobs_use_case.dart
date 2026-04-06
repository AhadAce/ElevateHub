import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../entities/job_entity.dart';
import '../repositories/job_repo.dart';

@injectable
class GetJobsUseCase {
  final JobRepo _repo;
  const GetJobsUseCase(
    this._repo,
  );

  Future<Either<Failure, List<JobEntity>>> call({
    String? categoryId,
    String? userId,
    String? search,
  }) async {
    return await _repo.getJobs(
      categoryId: categoryId,
      userId: userId,
      search: search,
    );
  }
}
