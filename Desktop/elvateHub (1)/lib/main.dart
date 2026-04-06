import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elvateHub/core/helpers/firebase_helper.dart';
import 'package:elvateHub/firebase_options.dart';
import 'core/cached/app_controller.dart';
import 'core/di/injector.dart';
import 'core/helpers/bloc_observer.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppController.instance.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseHelper.init();
  runApp(const MyApp());
}
