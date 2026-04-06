import 'package:injectable/injectable.dart';

import '../entities/chat_message_entity.dart';
import '../repo/chat_repo.dart';

@injectable
class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<void> call(String? chatId, ChatMessageEntity message) {
    return repository.sendMessage(chatId, message);
  }
}
