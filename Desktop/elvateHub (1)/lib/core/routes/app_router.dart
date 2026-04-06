import 'package:elvateHub/core/di/injector.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';
import 'package:elvateHub/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:elvateHub/features/category/presentation/manager/get_category_cubit.dart';
import 'package:elvateHub/features/auth/presentation/pages/login_screen.dart';
import 'package:elvateHub/features/auth/presentation/pages/register_or_update_screen.dart';
import 'package:elvateHub/features/chat/presentation/manager/get_all_chat_cubit.dart';
import 'package:elvateHub/features/chat/presentation/pages/chat_screen.dart';
import 'package:elvateHub/features/chat/presentation/pages/get_all_chat_screen.dart';
import 'package:elvateHub/features/community/data/models/post_model.dart';
import 'package:elvateHub/features/community/presentation/cubit/comment_post_cubit.dart';
import 'package:elvateHub/features/community/presentation/cubit/community_var_cubit.dart';
import 'package:elvateHub/features/community/presentation/cubit/get_posts_cubit.dart';
import 'package:elvateHub/features/community/presentation/cubit/like_post_cubit.dart';
import 'package:elvateHub/features/community/presentation/cubit/report_post_cubit.dart';
import 'package:elvateHub/features/community/presentation/pages/create_new_post_screen.dart';
import 'package:elvateHub/features/community/presentation/pages/post_screen.dart';
import 'package:elvateHub/features/community/presentation/pages/public_community_screen.dart';
import 'package:elvateHub/features/community/presentation/pages/select_community_screen.dart';
import 'package:elvateHub/features/job/domain/entities/job_entity.dart';
import 'package:elvateHub/features/job/presentation/cubit/apply_job_cubit.dart';
import 'package:elvateHub/features/job/presentation/cubit/approve_user_cubit.dart';
import 'package:elvateHub/features/job/presentation/cubit/create_new_job_cubit.dart';
import 'package:elvateHub/features/job/presentation/cubit/get_applications_cubit.dart';
import 'package:elvateHub/features/job/presentation/cubit/get_jobs_cubit.dart';
import 'package:elvateHub/features/job/presentation/cubit/job_var_cubit.dart';
import 'package:elvateHub/features/job/presentation/pages/application_details_screen.dart';
import 'package:elvateHub/features/job/presentation/pages/application_screen.dart';
import 'package:elvateHub/features/job/presentation/pages/create_new_job_screen.dart';
import 'package:elvateHub/features/job/presentation/pages/job_details_screen.dart';
import 'package:elvateHub/features/job/presentation/pages/job_screen.dart';
import 'package:elvateHub/features/job/presentation/pages/search_job_screen.dart';
import 'package:elvateHub/features/job/presentation/pages/search_result_screen.dart';
import 'package:elvateHub/features/main/manager/main_var_cubit.dart';
import 'package:elvateHub/features/main/pages/main_screen.dart';
import 'package:elvateHub/features/matching/data/models/mentorship_model.dart';
import 'package:elvateHub/features/matching/domain/entities/mentorship_entity.dart';
import 'package:elvateHub/features/matching/presentation/cubit/change_mentorship_status_cubit.dart';
import 'package:elvateHub/features/matching/presentation/cubit/create_mentorship_cubit.dart';
import 'package:elvateHub/features/matching/presentation/cubit/get_contributor_cubit.dart';
import 'package:elvateHub/features/matching/presentation/cubit/get_mentorship_cubit.dart';
import 'package:elvateHub/features/matching/presentation/pages/main_matching_screen.dart';
import 'package:elvateHub/features/matching/presentation/pages/matching_screen.dart';
import 'package:elvateHub/features/matching/presentation/pages/mentorship_agreement_screen.dart';
import 'package:elvateHub/features/matching/presentation/pages/mentorship_card_details_screen.dart';
import 'package:elvateHub/features/matching/presentation/pages/mentorship_details_screen.dart';
import 'package:elvateHub/features/matching/presentation/pages/mentorship_history_screen.dart';
import 'package:elvateHub/features/matching/presentation/pages/scehdule_upcoming_session_screen.dart';
import 'package:elvateHub/features/matching/presentation/pages/upcoming_session_screen.dart';
import 'package:elvateHub/features/splash/presentation/screen/splash_screen.dart';
import 'package:elvateHub/features/splash/presentation/screen/started_app.dart';
import '../../features/chat/presentation/manager/chat_cubit.dart';
import '../../features/community/presentation/cubit/create_new_post_cubit.dart';
import '../../features/home/presentation/manager/home_var_cubit.dart';
import '../../features/job/presentation/pages/apply_job_screen.dart';
import '../../features/matching/presentation/pages/mentorship_details_screen2.dart';
import 'common_import.dart';

class AppRouter {
  AppRouter();

  static const launch = '/';
  static const login = '/login';
  static const verify = '/verify';
  static const main = '/main';
  static const selectCommunity = '/selectCommunity';
  static const startedApp = '/startedApp';
  static const registerOrUpdate = '/registerOrUpdate';
  static const community = '/community';
  static const createNewPost = '/createNewPost';
  static const postScreen = '/postScreen';
  static const job = '/job';
  static const createNewJob = '/createNewJob';
  static const searchJob = '/searchJob';
  static const searchResultJob = '/searchResultJob';
  static const jobDetails = '/jobDetails';
  static const applyJob = '/applyJob';
  static const application = '/application';
  static const applicationDetails = '/applicationDetails';
  static const mainMatching = '/mainMatching';
  static const matching = '/matching';
  static const mentorshipDetails = '/mentorshipDetails';
  static const mentorshipDetails2 = '/mentorshipDetails2';
  static const mentorshipAgreement = '/mentorshipAgreement';
  static const mentorshipHistory = '/mentorshipHistory';
  static const mentorshipCardDetails = '/mentorshipCardDetails';
  static const upcomingSession = '/upcomingSession';
  static const allChat = '/allChat';
  static const chat = '/chat';
  static const scehdule = '/scehdule';

  Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // START EXAMPLE

      case launch:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case scehdule:
        return MaterialPageRoute(
          builder: (context) => const ScheduleScreen(),
        );
      case chat:
        if (args is MentorshipEntity) {
          return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ChatCubit(
                    getIt(),
                    getIt(),
                  ),
                ),
              ],
              child: ChatScreen(
                mentorshipEntity: args,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }

      case allChat:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetAllChatCubit(getIt())..getAllChat(),
            child: const GetAllChatScreen(),
          ),
        );
      case upcomingSession:
        return MaterialPageRoute(
          builder: (context) => const UpcomingSessionScreen(),
        );
      case mentorshipCardDetails:
        if (args != null && args is MentorshipEntity) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ChangeMentorshipStatusCubit(getIt()),
              child: MentorshipCardDetailsScreen(
                mentorshipEntity: args,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }

      case mentorshipHistory:
        if (args is Map) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => GetMentorshipCubit(getIt())
                ..getMentorship(
                  status: args['status'],
                ),
              child: MentorshipHistoryScreen(
                status: args['status'],
                title: args['title'] ?? S.of(context).mentorshipHistory,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }

      case mentorshipAgreement:
        if (args != null && args is MentorshipModel) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => CreateMentorshipCubit(getIt()),
              child: MentorshipAgreementScreen(
                mentorshipModel: args,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }
      case mentorshipDetails:
        if (args != null && args is MentorshipModel) {
          return MaterialPageRoute(
            builder: (context) => MentorshipDetailsScreen(
              mentorshipModel: args,
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }
      case mentorshipDetails2:
        if (args != null && args is MentorshipModel) {
          return MaterialPageRoute(
            builder: (context) => MentorshipDetailsScreen2(
              mentorshipModel: args,
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }
      case mainMatching:
        return MaterialPageRoute(
          builder: (context) => const MainMatchingScreen(),
        );
      case matching:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetContributorCubit(getIt())..getContributor(),
            child: const MatchingScreen(),
          ),
        );
      case applicationDetails:
        if (args != null && args is ApplicationEntity) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ApproveUserCubit(getIt()),
              child: ApplicationDetailsScreen(
                applicationEntity: args,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }
      case application:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetApplicationsCubit(getIt())
              ..getApplications(
                needUserJob:
                    AppController.instance.getUserModel().type != UserType.user,
              ),
            child: const ApplicationScreen(),
          ),
        );
      case applyJob:
        if (args != null && args is JobEntity) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ApplyJobCubit(getIt()),
              child: ApplyJobScreen(
                job: args,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }

      case jobDetails:
        if (args != null && args is JobEntity) {
          return MaterialPageRoute(
            builder: (context) => JobDetailsScreen(
              jobEntity: args,
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }
      case searchResultJob:
        if (args != null && args is Map) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => GetJobsCubit(getIt())
                ..getJobs(
                  categoryId: args['categoryId'] ?? '',
                  search: args['search'] ?? '',
                ),
              child: SearchResultScreen(
                categoryId: args['categoryId'] ?? '',
                search: args['search'] ?? '',
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }
      case searchJob:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetCategoryCubit(getIt())
                  ..getCategories(
                    needUploadFile: false,
                  ),
              ),
              BlocProvider(
                create: (context) => JobVarCubit(),
              ),
            ],
            child: const SearchJobScreen(),
          ),
        );
      case createNewJob:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetCategoryCubit(getIt())
                  ..getCategories(
                    needUploadFile: false,
                  ),
              ),
              BlocProvider(
                create: (context) => CreateNewJobCubit(getIt()),
              ),
            ],
            child: CreateNewJobScreen(
              jobEntity: args is JobEntity ? args : null,
            ),
          ),
        );
      case job:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetJobsCubit(getIt())
              ..getJobs(
                userId:
                    context.user.type != UserType.user ? context.user.id : null,
              ),
            child: const JobScreen(),
          ),
        );
      case postScreen:
        if (args != null && args is Map) {
          return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CommentPostCubit(getIt()),
                ),
                BlocProvider(
                  create: (context) => LikePostCubit(getIt()),
                ),
                BlocProvider(
                  create: (context) => ReportPostCubit(getIt()),
                ),
              ],
              child: PostScreen(
                post: args['post'] ?? PostModel.emptyOne().toEntity(),
                isWomen: args['isWomen'] ?? false,
              ),
            ),
          );
        } else {
          throw RouteExceptions('Route Not Found');
        }

      case createNewPost:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CreateNewPostCubit(getIt()),
              ),
              BlocProvider(
                create: (context) => GetCategoryCubit(getIt())
                  ..getCategories(
                    needUploadFile: true,
                  ),
              ),
            ],
            child: CreateNewPostScreen(
              isWomen: args != null && args is bool ? args : false,
            ),
          ),
        );
      case selectCommunity:
        return MaterialPageRoute(
          builder: (context) => const SelectCommunityScreen(),
        );
      case community:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetCategoryCubit(getIt())
                  ..getCategories(
                    needShowAll: true,
                    needUploadFile: true,
                  ),
              ),
              BlocProvider(
                create: (context) => GetPostsCubit(getIt())
                  ..getPosts(
                    isWomen: args != null && args is bool ? args : false,
                  ),
              ),
              BlocProvider(
                create: (context) => CommunityVarCubit(),
              ),
            ],
            child: CommunityScreen(
              isWomen: args != null && args is bool ? args : false,
            ),
          ),
        );

      case main:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ChatCubit(getIt(), getIt()),
              ),
              BlocProvider(
                create: (context) => GetAllChatCubit(getIt()),
              ),
              BlocProvider(
                create: (context) => MainVarCubit(),
              ),
              BlocProvider(
                create: (context) => HomeVarCubit(),
              ),
              BlocProvider(
                create: (context) => GetCategoryCubit(getIt()),
              ),
            ],
            child: MainScreen(
              index: args != null && args is int ? args : null,
            ),
          ),
        );
      case startedApp:
        return MaterialPageRoute(
          builder: (context) => const StartedApp(),
        );

      case registerOrUpdate:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthCubit(),
              ),
              BlocProvider(
                create: (context) => GetCategoryCubit(getIt())
                  ..getCategories(
                    needUploadFile: false,
                  ),
              ),
            ],
            child: RegisterOrUpdateScreen(
              fromProfile: args is bool ? args : false,
            ),
          ),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthCubit(),
              ),
            ],
            child: const LoginScreen(),
          ),
        );

      // END EXAMPLE
      default:
        throw RouteExceptions('Route Not Found');
    }
  }

  void dispose() {
    // reservationsCubit.close();
  }
}

class RouteExceptions implements Exception {
  final String message;

  RouteExceptions(this.message);

  @override
  String toString() {
    return message;
  }
}
