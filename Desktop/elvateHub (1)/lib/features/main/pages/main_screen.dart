import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import '../../../../core/helpers/helper_function.dart';
import '../manager/main_var_cubit.dart';
import '../manager/main_var_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.index});
  final int? index;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool closeApp = false;
  @override
  void initState() {
    super.initState();
    MainVarCubit.currentIndex = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: closeApp,
      onPopInvoked: (val) async {
        if (!Navigator.canPop(context)) {
          await showExitPopup(context);
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainVarCubit(),
          ),
        ],
        child: BlocBuilder<MainVarCubit, MainVarState>(
          builder: (context, state) => Scaffold(
            appBar: const CustomAppBar(),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryDarkColor,
              unselectedItemColor: AppColors.blackColor,
              selectedLabelStyle: context.subBody,
              unselectedLabelStyle: context.subBody,
              elevation: 8,
              backgroundColor: context.scaffoldColor,
              currentIndex: MainVarCubit.currentIndex,
              onTap: (index) =>
                  MainVarCubit.get(context).changeCurrentIndex(index: index),
              items: [
                BottomNavigationBarItem(
                  activeIcon: const Icon(Icons.home_filled),
                  icon: Icon(
                    Icons.home_filled,
                    color: context.primaryColor,
                  ),
                  label: S.of(context).home,
                ),
                // BottomNavigationBarItem(
                //   activeIcon: const Icon(
                //     Icons.category,
                //   ),
                //   icon: Icon(
                //     Icons.category,
                //     color: context.primaryColor,
                //   ),
                //   label: S.of(context).categories,
                // ),
                // BottomNavigationBarItem(
                //   activeIcon: const Icon(
                //     Icons.notifications,
                //   ),
                //   icon: Icon(
                //     Icons.notifications,
                //     color: context.primaryColor,
                //   ),
                //   label: S.of(context).notification,
                // ),
                BottomNavigationBarItem(
                  activeIcon: const Icon(
                    Icons.person,
                  ),
                  icon: Icon(
                    Icons.person,
                    color: context.primaryColor,
                  ),
                  label: S.of(context).profile,
                ),
              ],
            ),
            body: SafeArea(
                child: MainVarCubit.get(context)
                    .screen()[MainVarCubit.currentIndex]),
          ),
        ),
      ),
    );
  }
}
