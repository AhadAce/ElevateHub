import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/job_entity.dart';
import '../../domain/usecases/get_applications_use_case.dart';

part 'get_applications_state.dart';

@injectable
class GetApplicationsCubit extends Cubit<GetApplicationsState> {
  GetApplicationsCubit(
    this._createNewApplicationUseCase,
  ) : super(GetApplicationsInitial());

  final GetApplicationsUseCase _createNewApplicationUseCase;
  static GetApplicationsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getApplications({
    required bool needUserJob,
  }) async {
    emit(GetApplicationsLoadingState());
    (await _createNewApplicationUseCase(
      needUserJob: needUserJob,
    ))
        .fold(
      (l) => emit(GetApplicationsErrorState(errorMessage: l.message)),
      (r) => emit(
        GetApplicationsSuccessState(r),
      ),
    );
  }
}
