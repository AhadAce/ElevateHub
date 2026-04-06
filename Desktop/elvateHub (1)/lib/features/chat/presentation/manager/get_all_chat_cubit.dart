import 'package:injectable/injectable.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import '../../../matching/domain/entities/mentorship_entity.dart';
import '../../domain/use_cases/get_all_chat_use_case.dart';

part 'get_all_chat_state.dart';

@injectable
class GetAllChatCubit extends Cubit<GetAllChatState> {
  GetAllChatCubit(
    this._authUseCase,
  ) : super(GetAllChatInitial());

  final GetAllChatUseCase _authUseCase;
  static GetAllChatCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllChat() async {
    emit(GetAllChatLoadingState());
    (await _authUseCase())
        .fold((l) => emit(GetAllChatErrorState(errorMessage: l.message)), (r) {
      emit(GetAllChatSuccessState(chats: r));
    });
  }
}
