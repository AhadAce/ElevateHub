import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/failure.dart';
import '../../../matching/domain/entities/mentorship_entity.dart';
import '../repo/chat_repo.dart';

@injectable
class GetAllChatUseCase {
  final ChatRepository repository;

  GetAllChatUseCase(this.repository);

  Future<Either<ServerFailure, List<MentorshipEntity>>> call() {
    return repository.getAllChat();
  }
}
