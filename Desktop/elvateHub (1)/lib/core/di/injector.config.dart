// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:elvateHub/features/auth/presentation/cubit/auth_cubit.dart'
    as _i921;
import 'package:elvateHub/features/category/data/datasources/category_remote_data_source.dart'
    as _i886;
import 'package:elvateHub/features/category/data/repositories/category_repo_impl.dart'
    as _i869;
import 'package:elvateHub/features/category/domain/repositories/category_repo.dart'
    as _i371;
import 'package:elvateHub/features/category/domain/usecases/create_new_category_use_case.dart'
    as _i116;
import 'package:elvateHub/features/category/domain/usecases/get_categories_use_case.dart'
    as _i552;
import 'package:elvateHub/features/category/presentation/manager/create_new_category_cubit.dart'
    as _i750;
import 'package:elvateHub/features/category/presentation/manager/get_category_cubit.dart'
    as _i558;
import 'package:elvateHub/features/chat/data/datasource/chat_remote_data_source.dart'
    as _i319;
import 'package:elvateHub/features/chat/data/repo/chat_repo_impl.dart' as _i849;
import 'package:elvateHub/features/chat/domain/repo/chat_repo.dart' as _i916;
import 'package:elvateHub/features/chat/domain/use_cases/get_all_chat_use_case.dart'
    as _i634;
import 'package:elvateHub/features/chat/domain/use_cases/get_message_use_case.dart'
    as _i187;
import 'package:elvateHub/features/chat/domain/use_cases/send_message_use_case.dart'
    as _i913;
import 'package:elvateHub/features/chat/presentation/manager/chat_cubit.dart'
    as _i213;
import 'package:elvateHub/features/chat/presentation/manager/get_all_chat_cubit.dart'
    as _i32;
import 'package:elvateHub/features/community/data/datasources/ommunity_remote_data_source.dart'
    as _i270;
import 'package:elvateHub/features/community/data/repositories/community_repo_impl.dart'
    as _i995;
import 'package:elvateHub/features/community/domain/repositories/community_repo.dart'
    as _i798;
import 'package:elvateHub/features/community/domain/usecases/comment_post_use_case.dart'
    as _i342;
import 'package:elvateHub/features/community/domain/usecases/create_new_post_use_case.dart'
    as _i207;
import 'package:elvateHub/features/community/domain/usecases/get_posts_use_case.dart'
    as _i723;
import 'package:elvateHub/features/community/domain/usecases/like_post_use_case.dart'
    as _i1004;
import 'package:elvateHub/features/community/domain/usecases/report_post_use_case.dart'
    as _i255;
import 'package:elvateHub/features/community/presentation/cubit/comment_post_cubit.dart'
    as _i354;
import 'package:elvateHub/features/community/presentation/cubit/create_new_post_cubit.dart'
    as _i1034;
import 'package:elvateHub/features/community/presentation/cubit/get_posts_cubit.dart'
    as _i458;
import 'package:elvateHub/features/community/presentation/cubit/like_post_cubit.dart'
    as _i848;
import 'package:elvateHub/features/community/presentation/cubit/report_post_cubit.dart'
    as _i317;
import 'package:elvateHub/features/job/data/datasources/job_remote_data_source.dart'
    as _i540;
import 'package:elvateHub/features/job/data/repositories/job_repo_impl.dart'
    as _i822;
import 'package:elvateHub/features/job/domain/repositories/job_repo.dart'
    as _i541;
import 'package:elvateHub/features/job/domain/usecases/apply_job_use_case.dart'
    as _i814;
import 'package:elvateHub/features/job/domain/usecases/approve_user_use_case.dart'
    as _i804;
import 'package:elvateHub/features/job/domain/usecases/create_new_job_use_case.dart'
    as _i76;
import 'package:elvateHub/features/job/domain/usecases/get_applications_use_case.dart'
    as _i391;
import 'package:elvateHub/features/job/domain/usecases/get_jobs_use_case.dart'
    as _i657;
import 'package:elvateHub/features/job/presentation/cubit/apply_job_cubit.dart'
    as _i77;
import 'package:elvateHub/features/job/presentation/cubit/approve_user_cubit.dart'
    as _i936;
import 'package:elvateHub/features/job/presentation/cubit/create_new_job_cubit.dart'
    as _i443;
import 'package:elvateHub/features/job/presentation/cubit/get_applications_cubit.dart'
    as _i759;
import 'package:elvateHub/features/job/presentation/cubit/get_jobs_cubit.dart'
    as _i485;
import 'package:elvateHub/features/matching/data/datasources/matching_remote_data_source.dart'
    as _i839;
import 'package:elvateHub/features/matching/data/repositories/matching_repo_impl.dart'
    as _i506;
import 'package:elvateHub/features/matching/domain/repositories/matching_repo.dart'
    as _i291;
import 'package:elvateHub/features/matching/domain/usecases/change_mentorship_status_use_case.dart'
    as _i704;
import 'package:elvateHub/features/matching/domain/usecases/create_mentorship_use_case.dart'
    as _i1034;
import 'package:elvateHub/features/matching/domain/usecases/get_contributor_use_case.dart'
    as _i1053;
import 'package:elvateHub/features/matching/domain/usecases/get_mentorship_use_case.dart'
    as _i775;
import 'package:elvateHub/features/matching/presentation/cubit/change_mentorship_status_cubit.dart'
    as _i1064;
import 'package:elvateHub/features/matching/presentation/cubit/create_mentorship_cubit.dart'
    as _i614;
import 'package:elvateHub/features/matching/presentation/cubit/get_contributor_cubit.dart'
    as _i87;
import 'package:elvateHub/features/matching/presentation/cubit/get_mentorship_cubit.dart'
    as _i561;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i921.AuthCubit>(() => _i921.AuthCubit());
    gh.factory<_i270.OmmunityRemoteDataSource>(
        () => _i270.CommunityRemoteDataSourceImpl());
    gh.factory<_i540.JobRemoteDataSource>(
        () => _i540.JobRemoteDataSourceImpl());
    gh.factory<_i839.MatchingRemoteDataSource>(
        () => _i839.MatchingRemoteDataSourceImpl());
    gh.factory<_i319.ChatRemoteDataSource>(
        () => _i319.ChatRemoteDataSourceImpl());
    gh.factory<_i886.CategoryRemoteDataSource>(
        () => _i886.CategoryRemoteDataSourceImpl());
    gh.factory<_i371.CategoryRepo>(
        () => _i869.CategoryRepoImpl(gh<_i886.CategoryRemoteDataSource>()));
    gh.factory<_i291.MatchingRepo>(
        () => _i506.MatchingRepoImpl(gh<_i839.MatchingRemoteDataSource>()));
    gh.factory<_i798.CommunityRepo>(
        () => _i995.CommunityRepoImpl(gh<_i270.OmmunityRemoteDataSource>()));
    gh.factory<_i1053.GetContributorUseCase>(
        () => _i1053.GetContributorUseCase(gh<_i291.MatchingRepo>()));
    gh.factory<_i775.GetMentorshipUseCase>(
        () => _i775.GetMentorshipUseCase(gh<_i291.MatchingRepo>()));
    gh.factory<_i1034.CreateMentorshipUseCase>(
        () => _i1034.CreateMentorshipUseCase(gh<_i291.MatchingRepo>()));
    gh.factory<_i704.ChangeMentorshipStatusUseCase>(
        () => _i704.ChangeMentorshipStatusUseCase(gh<_i291.MatchingRepo>()));
    gh.factory<_i541.JobRepo>(
        () => _i822.JobRepoImpl(gh<_i540.JobRemoteDataSource>()));
    gh.factory<_i916.ChatRepository>(
        () => _i849.ChatRepositoryImpl(gh<_i319.ChatRemoteDataSource>()));
    gh.factory<_i342.CommentPostUseCase>(
        () => _i342.CommentPostUseCase(gh<_i798.CommunityRepo>()));
    gh.factory<_i1004.LikePostUseCase>(
        () => _i1004.LikePostUseCase(gh<_i798.CommunityRepo>()));
    gh.factory<_i207.CreateNewPostUseCase>(
        () => _i207.CreateNewPostUseCase(gh<_i798.CommunityRepo>()));
    gh.factory<_i255.ReportPostUseCase>(
        () => _i255.ReportPostUseCase(gh<_i798.CommunityRepo>()));
    gh.factory<_i723.GetPostsUseCase>(
        () => _i723.GetPostsUseCase(gh<_i798.CommunityRepo>()));
    gh.factory<_i458.GetPostsCubit>(
        () => _i458.GetPostsCubit(gh<_i723.GetPostsUseCase>()));
    gh.factory<_i614.CreateMentorshipCubit>(() =>
        _i614.CreateMentorshipCubit(gh<_i1034.CreateMentorshipUseCase>()));
    gh.factory<_i116.CreateNewCategoryUseCase>(
        () => _i116.CreateNewCategoryUseCase(gh<_i371.CategoryRepo>()));
    gh.factory<_i552.GetCategoriesUseCase>(
        () => _i552.GetCategoriesUseCase(gh<_i371.CategoryRepo>()));
    gh.factory<_i391.GetApplicationsUseCase>(
        () => _i391.GetApplicationsUseCase(gh<_i541.JobRepo>()));
    gh.factory<_i657.GetJobsUseCase>(
        () => _i657.GetJobsUseCase(gh<_i541.JobRepo>()));
    gh.factory<_i76.CreateNewJobUseCase>(
        () => _i76.CreateNewJobUseCase(gh<_i541.JobRepo>()));
    gh.factory<_i814.ApplyJobUseCase>(
        () => _i814.ApplyJobUseCase(gh<_i541.JobRepo>()));
    gh.factory<_i804.ApproveUserUseCase>(
        () => _i804.ApproveUserUseCase(gh<_i541.JobRepo>()));
    gh.factory<_i354.CommentPostCubit>(
        () => _i354.CommentPostCubit(gh<_i342.CommentPostUseCase>()));
    gh.factory<_i848.LikePostCubit>(
        () => _i848.LikePostCubit(gh<_i1004.LikePostUseCase>()));
    gh.factory<_i634.GetAllChatUseCase>(
        () => _i634.GetAllChatUseCase(gh<_i916.ChatRepository>()));
    gh.factory<_i913.SendMessageUseCase>(
        () => _i913.SendMessageUseCase(gh<_i916.ChatRepository>()));
    gh.factory<_i187.GetMessagesUseCase>(
        () => _i187.GetMessagesUseCase(gh<_i916.ChatRepository>()));
    gh.factory<_i558.GetCategoryCubit>(
        () => _i558.GetCategoryCubit(gh<_i552.GetCategoriesUseCase>()));
    gh.factory<_i443.CreateNewJobCubit>(
        () => _i443.CreateNewJobCubit(gh<_i76.CreateNewJobUseCase>()));
    gh.factory<_i1064.ChangeMentorshipStatusCubit>(() =>
        _i1064.ChangeMentorshipStatusCubit(
            gh<_i704.ChangeMentorshipStatusUseCase>()));
    gh.factory<_i561.GetMentorshipCubit>(
        () => _i561.GetMentorshipCubit(gh<_i775.GetMentorshipUseCase>()));
    gh.factory<_i750.CreateNewCategoryCubit>(() =>
        _i750.CreateNewCategoryCubit(gh<_i116.CreateNewCategoryUseCase>()));
    gh.factory<_i317.ReportPostCubit>(
        () => _i317.ReportPostCubit(gh<_i255.ReportPostUseCase>()));
    gh.factory<_i1034.CreateNewPostCubit>(
        () => _i1034.CreateNewPostCubit(gh<_i207.CreateNewPostUseCase>()));
    gh.factory<_i759.GetApplicationsCubit>(
        () => _i759.GetApplicationsCubit(gh<_i391.GetApplicationsUseCase>()));
    gh.factory<_i87.GetContributorCubit>(
        () => _i87.GetContributorCubit(gh<_i1053.GetContributorUseCase>()));
    gh.factory<_i32.GetAllChatCubit>(
        () => _i32.GetAllChatCubit(gh<_i634.GetAllChatUseCase>()));
    gh.factory<_i485.GetJobsCubit>(
        () => _i485.GetJobsCubit(gh<_i657.GetJobsUseCase>()));
    gh.factory<_i213.ChatCubit>(() => _i213.ChatCubit(
          gh<_i187.GetMessagesUseCase>(),
          gh<_i913.SendMessageUseCase>(),
        ));
    gh.factory<_i77.ApplyJobCubit>(
        () => _i77.ApplyJobCubit(gh<_i814.ApplyJobUseCase>()));
    gh.factory<_i936.ApproveUserCubit>(
        () => _i936.ApproveUserCubit(gh<_i804.ApproveUserUseCase>()));
    return this;
  }
}
