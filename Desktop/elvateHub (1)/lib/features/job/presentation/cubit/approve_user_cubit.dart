import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/approve_user_use_case.dart';

part 'approve_user_state.dart';

@injectable
class ApproveUserCubit extends Cubit<ApproveUserState> {
  ApproveUserCubit(
    this._approveUserUseCase,
  ) : super(ApproveUserInitial());

  final ApproveUserUseCase _approveUserUseCase;
  static ApproveUserCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> approveUser({
    required String applicationId,
    required bool approve,
  }) async {
    emit(ApproveUserLoadingState());
    (await _approveUserUseCase(
      applicationId: applicationId,
      approve: approve,
    ))
        .fold(
      (l) => emit(ApproveUserErrorState(
        errorMessage: l.message,
      )),
      (r) => emit(
        ApproveUserSuccessState(),
      ),
    );
  }
}
