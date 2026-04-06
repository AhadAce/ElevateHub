import 'package:elvateHub/core/helpers/string_constant.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';

extension ContextExt on BuildContext {
  Size? get sizePage => MediaQuery.of(this).size;
  TextStyle? get mainTitle => Theme.of(this).textTheme.titleLarge;

  TextStyle? get subTitle => Theme.of(this).textTheme.titleMedium;

  TextStyle? get smallTitle => Theme.of(this).textTheme.titleSmall;

  TextStyle? get mainBody => Theme.of(this).textTheme.labelLarge;

  TextStyle? get subBody => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get smallBody => Theme.of(this).textTheme.labelMedium;

  TextStyle? get greyText => Theme.of(this).textTheme.bodyLarge;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get similarityScaffoldColor =>
      isDark ? AppColors.blackColor : AppColors.whiteColor;

  Color get scaffoldColor => Theme.of(this).scaffoldBackgroundColor;

  Color get backgroundColor => Theme.of(this).colorScheme.background;

  Color get lightMedium => Theme.of(this).highlightColor;

  Color get cardColor => Theme.of(this).cardColor;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  bool get isArabic => AppController.instance.getLanguageCode() == arabicCode;

  Color get whiteColor => const Color(0xffffffff);

  UserModel get user => AppController.instance.getUserModel();
}
