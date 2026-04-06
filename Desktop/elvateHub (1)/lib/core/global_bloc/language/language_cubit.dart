import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elvateHub/core/routes/common_import.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitState());

  static LanguageCubit get(context) => BlocProvider.of(context);

  static String languageCode = AppController.instance.getLanguageCode();

  Future<void> change({required String code}) async {
    languageCode = code;
    await AppController.instance.setLanguageCode(code: code);
    await S.load(Locale(code));
    emit(LanguageChangeState());
  }
}
