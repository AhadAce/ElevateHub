import 'package:elvateHub/core/helpers/custom_validation.dart';
import 'package:elvateHub/core/helpers/helper_function.dart';
import 'package:elvateHub/core/routes/app_router.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/title%20_text_field_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/auth/presentation/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSizedBox(20),
              Text(
                S.of(context).login,
                style: context.mainTitle,
              ),
              const VerticalSizedBox(5),
              Text(
                S.of(context).loginDesc,
                style: context.greyText,
              ),
              const VerticalSizedBox(20),
              TitleTextFieldWidget(
                hint: S.of(context).email,
                title: S.of(context).email,
                controller: _emailController,
                keyboard: TextInputType.emailAddress,
              ),
              const VerticalSizedBox(10),
              TitleTextFieldWidget(
                hint: S.of(context).password,
                title: S.of(context).password,
                controller: _passwordController,
                isPassword: true,
              ),
              const VerticalSizedBox(20),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) async {
                  if (state is LoginErrorState) {
                    customErrorToast(context, errorText: state.errorMessage);
                  }
                  if (state is LoginSuccessState) {
                    if (state.userModel.isActive) {
                      await AppController.instance.setLoggedIn(true);
                      await AppController.instance.saveUser(state.userModel);
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRouter.main, (_) => false);
                    } else {
                      customErrorToast(
                        context,
                        errorText: S.of(context).waitToActiveAccount,
                        isSuccess: true,
                      );
                      Navigator.pop(context);
                    }
                  }
                },
                builder: (context, state) => AppBtn(
                  title: S.of(context).login,
                  function: () {
                    bool validation = CustomValidator.validateTextFields(
                      context: context,
                      controllers: [_emailController, _passwordController],
                      errorMessages: [
                        S.of(context).emailError,
                        S.of(context).passwordError,
                      ],
                    );
                    if (validation) {
                      context.read<AuthCubit>().login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                    }
                  },
                  isLoading: state is LoginLoadingState,
                ),
              ),
              const VerticalSizedBox(30),
              Row(
                children: [
                  Text(
                    S.of(context).dontHaveAnAccount,
                    style: context.greyText,
                  ),
                  const HorizontalSizedBox(5),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, AppRouter.registerOrUpdate),
                    child: Text(
                      S.of(context).registerNow,
                      style: context.greyText!.copyWith(
                        color: context.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
