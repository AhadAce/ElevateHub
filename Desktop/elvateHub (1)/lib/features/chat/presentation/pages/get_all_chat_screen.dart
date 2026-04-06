import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_avatar_widget.dart';
import 'package:elvateHub/core/widgets/custom_loading_widget.dart';
import 'package:elvateHub/core/widgets/error_state_widget.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/chat/presentation/manager/get_all_chat_cubit.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/custom_back_button.dart';

class GetAllChatScreen extends StatefulWidget {
  const GetAllChatScreen({super.key});

  @override
  State<GetAllChatScreen> createState() => _GetAllChatScreenState();
}

class _GetAllChatScreenState extends State<GetAllChatScreen> {
  @override
  void initState() {
    super.initState();
    GetAllChatCubit.get(context).getAllChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(),
                const Spacer(),
                Text(
                  S.of(context).allChat,
                  style: context.mainTitle,
                ),
                const Spacer(),
              ],
            ),
            const VerticalSizedBox(20),
            Expanded(
              child: BlocBuilder<GetAllChatCubit, GetAllChatState>(
                builder: (context, state) {
                  if (state is GetAllChatSuccessState) {
                    return ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRouter.chat,
                            arguments: state.chats[index],
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.lightPrimaryColor,
                            border: Border.all(
                              color: AppColors.grey,
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              CustomAvatarWidget(
                                avatar: isCustomer()
                                    ? state.chats[index].contributorEntity.image
                                    : state.chats[index].userEntity.image,
                                radius: 20,
                              ),
                              const HorizontalSizedBox(5),
                              Text(
                                isCustomer()
                                    ? state.chats[index].contributorEntity.name
                                    : state.chats[index].userEntity.name,
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const VerticalSizedBox(10),
                      itemCount: state.chats.length,
                    );
                  } else if (state is GetAllChatErrorState) {
                    return ErrorStateWidget(
                      error: state.errorMessage,
                      function: () => GetAllChatCubit.get(context).getAllChat(),
                    );
                  } else {
                    return const CustomLoadingWidget();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
