import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/job_model.dart';
import '../repositories/job_repo.dart';

@injectable
class CreateNewJobUseCase {
  final JobRepo _repo;
  const CreateNewJobUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({
    required JobModel jobModel,
    required bool isUpdate,
  }) async {
    return await _repo.createNewJob(
      jobModel: jobModel,
      isUpdate: isUpdate,
    );
  }
}
