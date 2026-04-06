part of 'report_post_cubit.dart';

abstract class ReportPostState {}

class ReportPostInitial extends ReportPostState {}

class ReportPostLoadingState extends ReportPostState {}

class ReportPostSuccessState extends ReportPostState {
  ReportPostSuccessState();
}

class ReportPostErrorState extends ReportPostState {
  final String errorMessage;

  ReportPostErrorState({required this.errorMessage});
}
