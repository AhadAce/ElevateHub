import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/mentorship_model.dart';
import '../../domain/usecases/change_mentorship_status_use_case.dart';

part 'change_mentorship_status_state.dart';

@injectable
class ChangeMentorshipStatusCubit extends Cubit<ChangeMentorshipStatusState> {
  ChangeMentorshipStatusCubit(
    this._changeMentorshipStatusUseCase,
  ) : super(ChangeMentorshipStatusInitial());

  final ChangeMentorshipStatusUseCase _changeMentorshipStatusUseCase;
  static ChangeMentorshipStatusCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> changeMentorshipStatus({
    required String mentorshipId,
    required MentorshipStatus status,
  }) async {
    emit(ChangeMentorshipStatusLoadingState());
    (await _changeMentorshipStatusUseCase(
      mentorshipId: mentorshipId,
      status: status,
    ))
        .fold(
      (l) => emit(ChangeMentorshipStatusErrorState(errorMessage: l.message)),
      (r) => emit(
        ChangeMentorshipStatusSuccessState(),
      ),
    );
  }
}
