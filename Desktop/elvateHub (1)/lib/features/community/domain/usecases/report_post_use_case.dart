import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../data/models/report_model.dart';
import '../repositories/community_repo.dart';

@injectable
class ReportPostUseCase {
  final CommunityRepo _repo;
  const ReportPostUseCase(
    this._repo,
  );

  Future<Either<Failure, bool>> call({
    required ReportModel reportModel,
  }) async {
    return await _repo.reportPost(
      reportModel: reportModel,
    );
  }
}
