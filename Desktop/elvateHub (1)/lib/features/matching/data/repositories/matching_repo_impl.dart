import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/mentorship_entity.dart';
import '../../domain/repositories/matching_repo.dart';
import '../datasources/matching_remote_data_source.dart';
import '../models/mentorship_model.dart';

@Injectable(as: MatchingRepo)
class MatchingRepoImpl implements MatchingRepo {
  final MatchingRemoteDataSource _remoteDataSource;

  const MatchingRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getContributor() async {
    try {
      final response = await _remoteDataSource.getContributor();
      return Right(response.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MentorshipEntity>>> getMentorship({
    required MentorshipStatus? status,
  }) async {
    try {
      final response = await _remoteDataSource.getMentorship(
        status: status,
      );
      return Right(response.map((element) => element.toEntity()).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> createMentorship({
    required MentorshipModel data,
  }) async {
    try {
      final response = await _remoteDataSource.createMentorship(
        data: data,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> changeMentorshipStatus({
    required MentorshipStatus status,
    required String mentorshipId,
  }) async {
    try {
      final response = await _remoteDataSource.changeMentorshipStatus(
        status: status,
        mentorshipId: mentorshipId,
      );
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
