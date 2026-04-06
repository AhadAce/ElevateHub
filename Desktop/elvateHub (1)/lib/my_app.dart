import 'package:elvateHub/core/global_bloc/file/file_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/global_bloc/drop_list/drop_list_cubit.dart';
import 'core/global_bloc/image/image_cubit.dart';
import 'core/global_bloc/language/language_cubit.dart';
import 'core/global_bloc/language/language_state.dart';
import 'core/helpers/string_constant.dart';
import 'core/routes/app_router.dart';
import 'core/routes/common_import.dart';
import 'core/themes/app_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter _appRouter;
  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  void dispose() {
    super.dispose();
    _appRouter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DropListCubit(),
          ),
          BlocProvider(
            create: (context) => ImageCubit(),
          ),
          BlocProvider(
            create: (context) => FileCubit(),
          ),
          BlocProvider(
            create: (context) => LanguageCubit(),
          ),
        ],
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) => MaterialApp(
            navigatorKey: navigatorKey,
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supportedLocales) =>
                    supportedLocales.contains(locale)
                        ? locale
                        : const Locale(englishCode),
            locale: const Locale(englishCode),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: AppTheme.lightTheme,
            initialRoute: AppRouter.launch,
            highContrastTheme: AppTheme.lightTheme,
            themeMode: ThemeMode.light,
            onGenerateRoute: _appRouter.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
