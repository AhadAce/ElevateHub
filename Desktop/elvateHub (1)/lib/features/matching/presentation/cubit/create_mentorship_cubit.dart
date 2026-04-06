import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/mentorship_model.dart';
import '../../domain/usecases/create_mentorship_use_case.dart';

part 'create_mentorship_state.dart';

@injectable
class CreateMentorshipCubit extends Cubit<CreateMentorshipState> {
  CreateMentorshipCubit(
    this._createMentorshipUseCase,
  ) : super(CreateMentorshipInitial());

  final CreateMentorshipUseCase _createMentorshipUseCase;
  static CreateMentorshipCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> createMentorship({
    required MentorshipModel data,
  }) async {
    emit(CreateMentorshipLoadingState());
    (await _createMentorshipUseCase(
      data: data,
    ))
        .fold(
      (l) => emit(CreateMentorshipErrorState(errorMessage: l.message)),
      (r) => emit(
        CreateMentorshipSuccessState(),
      ),
    );
  }
}
