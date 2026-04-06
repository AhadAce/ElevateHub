import 'package:injectable/injectable.dart';

import '../entities/chat_message_entity.dart';
import '../repo/chat_repo.dart';

@injectable
class GetMessagesUseCase {
  final ChatRepository repository;

  GetMessagesUseCase(this.repository);

  Stream<List<ChatMessageEntity>> call(String? chatId) {
    return repository.getMessages(chatId);
  }
}
