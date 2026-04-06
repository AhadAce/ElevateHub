import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'job_var_state.dart';

class JobVarCubit extends Cubit<JobVarState> {
  JobVarCubit() : super(JobVarInitState());

  static JobVarCubit get(BuildContext context) => BlocProvider.of(context);

  String categoryId = '';
  void changeCategory(String value) {
    categoryId = value;
    emit(JobVarChangeTabState());
  }
}
