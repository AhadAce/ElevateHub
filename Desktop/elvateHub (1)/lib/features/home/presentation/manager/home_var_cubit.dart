import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_var_state.dart';

class HomeVarCubit extends Cubit<HomeVarState> {
  HomeVarCubit() : super(HomeVarInitState());

  static HomeVarCubit get(BuildContext context) => BlocProvider.of(context);

  String categoryId = '';
  void changeCategory(String value) {
    categoryId = value;
    emit(HomeVarChangeTabState());
  }
}
