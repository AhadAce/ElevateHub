import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/job_model.dart';
import '../../domain/usecases/apply_job_use_case.dart';

part 'apply_job_state.dart';

@injectable
class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit(
    this._applyJobUseCase,
  ) : super(ApplyJobInitial());

  final ApplyJobUseCase _applyJobUseCase;
  static ApplyJobCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> applyJob({
    required Application application,
    required String jobjId,
  }) async {
    emit(ApplyJobLoadingState());
    (await _applyJobUseCase(
      jobId: jobjId,
      application: application,
    ))
        .fold(
      (l) => emit(ApplyJobErrorState(errorMessage: l.message)),
      (r) => emit(
        ApplyJobSuccessState(),
      ),
    );
  }
}
