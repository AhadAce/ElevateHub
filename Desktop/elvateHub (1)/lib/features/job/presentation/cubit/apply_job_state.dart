part of 'apply_job_cubit.dart';

abstract class ApplyJobState {}

class ApplyJobInitial extends ApplyJobState {}

class ApplyJobLoadingState extends ApplyJobState {}

class ApplyJobSuccessState extends ApplyJobState {
  ApplyJobSuccessState();
}

class ApplyJobErrorState extends ApplyJobState {
  final String errorMessage;

  ApplyJobErrorState({required this.errorMessage});
}
