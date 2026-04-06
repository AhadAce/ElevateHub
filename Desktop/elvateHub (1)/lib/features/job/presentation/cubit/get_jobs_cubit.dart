import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/job_entity.dart';
import '../../domain/usecases/get_jobs_use_case.dart';

part 'get_jobs_state.dart';

@injectable
class GetJobsCubit extends Cubit<GetJobsState> {
  GetJobsCubit(
    this._createNewJobUseCase,
  ) : super(GetJobsInitial());

  final GetJobsUseCase _createNewJobUseCase;
  static GetJobsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getJobs({
    String? categoryId,
    String? userId,
    String? search,
  }) async {
    emit(GetJobsLoadingState());
    (await _createNewJobUseCase(
      categoryId: (categoryId?.trim().isNotEmpty ?? false) ? categoryId : null,
      userId: (userId?.trim().isNotEmpty ?? false) ? userId : null,
      search: (search?.trim().isNotEmpty ?? false) ? search : null,
    ))
        .fold(
      (l) => emit(GetJobsErrorState(errorMessage: l.message)),
      (r) => emit(
        GetJobsSuccessState(r),
      ),
    );
  }
}
