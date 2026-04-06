part of 'get_jobs_cubit.dart';

abstract class GetJobsState {}

class GetJobsInitial extends GetJobsState {}

class GetJobsLoadingState extends GetJobsState {}

class GetJobsSuccessState extends GetJobsState {
  List<JobEntity> jobs;
  GetJobsSuccessState(this.jobs);
}

class GetJobsErrorState extends GetJobsState {
  final String errorMessage;

  GetJobsErrorState({required this.errorMessage});
}
