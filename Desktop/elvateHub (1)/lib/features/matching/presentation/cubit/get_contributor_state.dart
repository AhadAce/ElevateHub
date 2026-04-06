part of 'get_contributor_cubit.dart';

abstract class GetContributorState {}

class GetContributorInitial extends GetContributorState {}

class GetContributorLoadingState extends GetContributorState {}

class GetContributorSuccessState extends GetContributorState {
  List<UserEntity> success;
  GetContributorSuccessState(this.success);
}

class GetContributorErrorState extends GetContributorState {
  final String errorMessage;

  GetContributorErrorState({required this.errorMessage});
}
