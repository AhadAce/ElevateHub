import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/presentation/pages/home_screen.dart';
import '../../profile/profile_screen.dart';
import 'main_var_state.dart';

class MainVarCubit extends Cubit<MainVarState> {
  MainVarCubit() : super(MainVarInitState());

  static MainVarCubit get(BuildContext context) => BlocProvider.of(context);

  static int currentIndex = 0;

  List<Widget> screen() => [
        const HomeScreen(),
        // const CategoryScreen(),
        // ChatScreen(
        //   mentorshipEntity: MentorshipModel.emptyOne().toEntity(),
        // ),
        const ProfileScreen(),
      ];
  void changeCurrentIndex({required int index}) {
    currentIndex = index;
    emit(MainVarChangeCurrentIndexState());
  }
}
