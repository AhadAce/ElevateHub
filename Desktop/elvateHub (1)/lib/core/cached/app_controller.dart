import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/models/user_model.dart';
import '../helpers/string_constant.dart';

class AppController {
  AppController._() {
    init();
  }

  static final AppController _instance = AppController._();

  static AppController get instance => _instance;

  late SharedPreferences _sharedPreferences;

  Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool isLoggedIn() {
    return _sharedPreferences.getBool(loggedInText) ?? false;
  }

  Future setLoggedIn(bool loggedIn) async {
    await _sharedPreferences.setBool(loggedInText, loggedIn);
  }

  Future<void> saveUser(UserModel user) async {
    await _sharedPreferences.setString(userText, jsonEncode(user.toJson()));
  }

  UserModel getUserModel() {
    String userString = _sharedPreferences.getString(userText) ?? '';
    if (userString.isNotEmpty) {
      UserModel userModel = UserModel.fromJson(jsonDecode(userString));
      return userModel;
    }
    return UserModel.emptyOne();
  }

  String getLanguageCode() {
    return _sharedPreferences.getString(languageCodeText) ?? englishCode;
  }

  Future<bool> setLanguageCode({required String code}) {
    return _sharedPreferences.setString(languageCodeText, code);
  }

  Future<void> logout() async {
    await setLoggedIn(false);
    await saveUser(UserModel.emptyOne());
    await _sharedPreferences.setBool(onBoardingDoneText, true);
  }
}
