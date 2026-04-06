import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/job_model.dart';
import '../../domain/usecases/create_new_job_use_case.dart';
part 'create_new_job_state.dart';

@injectable
class CreateNewJobCubit extends Cubit<CreateNewJobState> {
  CreateNewJobCubit(
    this._createNewJobUseCase,
  ) : super(CreateNewJobInitial());

  final CreateNewJobUseCase _createNewJobUseCase;
  static CreateNewJobCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> createNewJob({
    required JobModel jobModel,
    required bool isUpdate,
  }) async {
    emit(CreateNewJobLoadingState());
    (await _createNewJobUseCase(
      jobModel: jobModel,
      isUpdate: isUpdate,
    ))
        .fold(
      (l) => emit(CreateNewJobErrorState(errorMessage: l.message)),
      (r) => emit(
        CreateNewJobSuccessState(isUpdate),
      ),
    );
  }
}
