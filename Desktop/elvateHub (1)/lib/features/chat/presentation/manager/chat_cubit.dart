import 'package:injectable/injectable.dart';

import '../../../../core/routes/common_import.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/use_cases/get_message_use_case.dart';
import '../../domain/use_cases/send_message_use_case.dart';
import 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final GetMessagesUseCase getMessagesUseCase;
  final SendMessageUseCase sendMessageUseCase;

  ChatCubit(this.getMessagesUseCase, this.sendMessageUseCase)
      : super(ChatInitial());

  void loadMessages(String? chatId) {
    emit(ChatLoading());
    getMessagesUseCase(chatId).listen((messages) {
      emit(ChatLoaded(messages));
    }).onError((error) {
      emit(ChatError(error.toString()));
    });
  }

  Future<void> sendMessage(String? chatId, ChatMessageEntity message) async {
    try {
      await sendMessageUseCase(chatId, message);
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
