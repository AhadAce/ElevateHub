import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/usecases/get_contributor_use_case.dart';

part 'get_contributor_state.dart';

@injectable
class GetContributorCubit extends Cubit<GetContributorState> {
  GetContributorCubit(
    this._getContributorUseCase,
  ) : super(GetContributorInitial());

  final GetContributorUseCase _getContributorUseCase;
  static GetContributorCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getContributor() async {
    emit(GetContributorLoadingState());
    (await _getContributorUseCase()).fold(
      (l) => emit(GetContributorErrorState(errorMessage: l.message)),
      (r) => emit(
        GetContributorSuccessState(r),
      ),
    );
  }
}
