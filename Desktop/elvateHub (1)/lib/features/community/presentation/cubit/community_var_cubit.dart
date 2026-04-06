import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'community_var_state.dart';

class CommunityVarCubit extends Cubit<CommunityVarState> {
  CommunityVarCubit() : super(CommunityVarInitState());

  static CommunityVarCubit get(BuildContext context) =>
      BlocProvider.of(context);

  String categoryId = '';
  void changeCategory(String value) {
    categoryId = value;
    emit(CommunityVarChangeTabState());
  }
}
