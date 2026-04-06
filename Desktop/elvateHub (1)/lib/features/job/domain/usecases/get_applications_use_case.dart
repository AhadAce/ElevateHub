import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../entities/job_entity.dart';
import '../repositories/job_repo.dart';

@injectable
class GetApplicationsUseCase {
  final JobRepo _repo;
  const GetApplicationsUseCase(
    this._repo,
  );

  Future<Either<Failure, List<ApplicationEntity>>> call({
    required bool needUserJob,
  }) async {
    return await _repo.getApplications(
      needUserJob: needUserJob,
    );
  }
}
