import 'package:elvateHub/core/assets/assets.gen.dart';
import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/widgets/custom_avatar_widget.dart';
import 'package:elvateHub/core/widgets/error_state_widget.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/matching/domain/entities/mentorship_entity.dart';

import '../../../../core/routes/common_import.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../manager/chat_cubit.dart';
import '../manager/chat_state.dart';

class ChatScreen extends StatefulWidget {
  final MentorshipEntity mentorshipEntity;
  const ChatScreen({
    super.key,
    required this.mentorshipEntity,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ChatCubit>().loadMessages(widget.mentorshipEntity.id);
    UserEntity data = isCustomer()
        ? widget.mentorshipEntity.contributorEntity
        : widget.mentorshipEntity.userEntity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.primaryColor,
        centerTitle: true,
        title: Row(
          children: [
            CustomAvatarWidget(
              radius: 20,
              avatar: data.image,
            ),
            const HorizontalSizedBox(10),
            Text(
              data.name,
              style: context.subBody,
            ),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                AppRouter.scehdule,
              ),
              child: Assets.images.calendar.svg(),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatLoaded) {
                  return ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      return ListTile(
                        title: Text(
                          widget.mentorshipEntity.contributorEntity.id !=
                                  message.senderId
                              ? widget.mentorshipEntity.contributorEntity.name
                              : widget.mentorshipEntity.userEntity.name,
                        ),
                        subtitle: Text(message.message),
                      );
                    },
                  );
                } else if (state is ChatError) {
                  return ErrorStateWidget(
                    error: state.message,
                    function: () => context.read<ChatCubit>().loadMessages(
                          widget.mentorshipEntity.id,
                        ),
                  );
                }
                return Center(
                  child: Text(
                    S.of(context).startChat,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TitleTextFieldWidget(
                    hint: S.of(context).send,
                    controller: _messageController,
                    suffix: GestureDetector(
                        onTap: () {
                          final message = ChatMessageEntity(
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            senderId:
                                data.id ?? '', // Replace with dynamic user ID
                            message: _messageController.text,
                            timestamp: DateTime.now(),
                          );
                          context
                              .read<ChatCubit>()
                              .sendMessage(widget.mentorshipEntity.id, message);
                          _messageController.text = '';
                        },
                        child: const Icon(Icons.send)),
                    onSubmit: (val) {
                      final message = ChatMessageEntity(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        senderId: data.id ?? '',
                        message: val ?? '',
                        timestamp: DateTime.now(),
                      );
                      context
                          .read<ChatCubit>()
                          .sendMessage(widget.mentorshipEntity.id, message);
                      _messageController.text = '';
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
