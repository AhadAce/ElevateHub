import 'package:bloc/bloc.dart';
import 'package:elvateHub/features/matching/domain/entities/mentorship_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/mentorship_model.dart';
import '../../domain/usecases/get_mentorship_use_case.dart';

part 'get_mentorship_state.dart';

@injectable
class GetMentorshipCubit extends Cubit<GetMentorshipState> {
  GetMentorshipCubit(
    this._getMentorshipUseCase,
  ) : super(GetMentorshipInitial());

  final GetMentorshipUseCase _getMentorshipUseCase;
  static GetMentorshipCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getMentorship({
    required MentorshipStatus? status,
  }) async {
    emit(GetMentorshipLoadingState());
    (await _getMentorshipUseCase(
      status: status,
    ))
        .fold(
      (l) => emit(GetMentorshipErrorState(errorMessage: l.message)),
      (r) => emit(
        GetMentorshipSuccessState(r),
      ),
    );
  }
}
