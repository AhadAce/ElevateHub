import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../repositories/job_repo.dart';

@injectable
class ApproveUserUseCase {
  final JobRepo _repo;
  const ApproveUserUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({
    required String applicationId,
    required bool approve,
  }) async {
    return await _repo.approveUser(
      applicationId: applicationId,
      approve: approve,
    );
  }
}
