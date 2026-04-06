import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../matching/domain/entities/mentorship_entity.dart';
import '../entities/chat_message_entity.dart';

abstract class ChatRepository {
  Stream<List<ChatMessageEntity>> getMessages(String? chatId);
  Future<void> sendMessage(String? chatId, ChatMessageEntity message);
  Future<Either<ServerFailure, List<MentorshipEntity>>> getAllChat();
}
