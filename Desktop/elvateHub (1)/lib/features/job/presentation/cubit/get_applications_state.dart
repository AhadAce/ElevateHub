part of 'get_applications_cubit.dart';

abstract class GetApplicationsState {}

class GetApplicationsInitial extends GetApplicationsState {}

class GetApplicationsLoadingState extends GetApplicationsState {}

class GetApplicationsSuccessState extends GetApplicationsState {
  List<ApplicationEntity> applications;
  GetApplicationsSuccessState(this.applications);
}

class GetApplicationsErrorState extends GetApplicationsState {
  final String errorMessage;

  GetApplicationsErrorState({required this.errorMessage});
}
