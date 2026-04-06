part of 'create_new_job_cubit.dart';

abstract class CreateNewJobState {}

class CreateNewJobInitial extends CreateNewJobState {}

class CreateNewJobLoadingState extends CreateNewJobState {}

class CreateNewJobSuccessState extends CreateNewJobState {
  final bool isUpdate;
  CreateNewJobSuccessState(this.isUpdate);
}

class CreateNewJobErrorState extends CreateNewJobState {
  final String errorMessage;

  CreateNewJobErrorState({required this.errorMessage});
}
