import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/job_model.dart';
import '../repositories/job_repo.dart';

@injectable
class ApplyJobUseCase {
  final JobRepo _repo;
  const ApplyJobUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({
    required Application application,
    required String jobId,
  }) async {
    return await _repo.applyJob(
      application: application,
      jobId: jobId,
    );
  }
}
