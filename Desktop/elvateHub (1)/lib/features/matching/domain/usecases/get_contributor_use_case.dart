import 'package:dartz/dartz.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../repositories/matching_repo.dart';

@injectable
class GetContributorUseCase {
  final MatchingRepo _repo;
  const GetContributorUseCase(
    this._repo,
  );

  Future<Either<Failure, List<UserEntity>>> call() async {
    return await _repo.getContributor();
  }
}
