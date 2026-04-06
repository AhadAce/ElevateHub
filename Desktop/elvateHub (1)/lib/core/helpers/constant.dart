import 'package:elvateHub/core/generated/l10n.dart';
import 'package:elvateHub/core/global_model/drop_down_model.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/my_app.dart';

const int timerInSecond = 10 * 60; // 10 min * 60 sec = 600 sec in 10 min
const double passQuizScore = 0.70;

Map<String, UserType> stringToUserType = {
  UserType.user.id: UserType.user,
  UserType.admin.id: UserType.admin,
};
Map<String, Gender> stringToGender = {
  Gender.male.name: Gender.male,
  Gender.female.name: Gender.female,
};

List<DropDownModel> userTypes = [
  DropDownModel(
    id: UserType.user.id,
    name: UserType.user.nameText,
  ),
  DropDownModel(
    id: UserType.contributor.id,
    name: UserType.contributor.nameText,
  ),
];

List<DropDownModel> reportReason = [
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).inappropriateContent,
    name: S.of(navigatorKey.currentContext!).inappropriateContent,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).spam,
    name: S.of(navigatorKey.currentContext!).spam,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).falseInformation,
    name: S.of(navigatorKey.currentContext!).falseInformation,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).copyrightViolation,
    name: S.of(navigatorKey.currentContext!).copyrightViolation,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).privacyViolation,
    name: S.of(navigatorKey.currentContext!).privacyViolation,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).promotionalContent,
    name: S.of(navigatorKey.currentContext!).promotionalContent,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).other,
    name: S.of(navigatorKey.currentContext!).other,
  ),
];
List<DropDownModel> duration = [
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).weeks2,
    name: S.of(navigatorKey.currentContext!).weeks2,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).weeks4,
    name: S.of(navigatorKey.currentContext!).weeks4,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).weeks6,
    name: S.of(navigatorKey.currentContext!).weeks6,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).months2,
    name: S.of(navigatorKey.currentContext!).months2,
  ),
];
List<DropDownModel> purpose = [
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).skillDevelopment,
    name: S.of(navigatorKey.currentContext!).skillDevelopment,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).careerGrowth,
    name: S.of(navigatorKey.currentContext!).careerGrowth,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).problemSolvingAndGuidance,
    name: S.of(navigatorKey.currentContext!).problemSolvingAndGuidance,
  ),
  DropDownModel(
    id: S.of(navigatorKey.currentContext!).personalizedLearningPath,
    name: S.of(navigatorKey.currentContext!).personalizedLearningPath,
  ),
];

List<DropDownModel> genderList = [
  DropDownModel(
    id: Gender.male.name,
    name: Gender.male.nameText,
  ),
  DropDownModel(
    id: Gender.female.name,
    name: Gender.female.nameText,
  ),
];
