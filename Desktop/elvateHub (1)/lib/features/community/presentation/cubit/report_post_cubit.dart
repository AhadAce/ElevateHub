import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/report_model.dart';
import '../../domain/usecases/report_post_use_case.dart';

part 'report_post_state.dart';

@injectable
class ReportPostCubit extends Cubit<ReportPostState> {
  ReportPostCubit(
    this._eportPostUseCase,
  ) : super(ReportPostInitial());

  final ReportPostUseCase _eportPostUseCase;
  static ReportPostCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> reportPost({
    required ReportModel reportModel,
  }) async {
    emit(ReportPostLoadingState());
    (await _eportPostUseCase(
      reportModel: reportModel,
    ))
        .fold(
      (l) => emit(ReportPostErrorState(errorMessage: l.message)),
      (r) => emit(
        ReportPostSuccessState(),
      ),
    );
  }
}
