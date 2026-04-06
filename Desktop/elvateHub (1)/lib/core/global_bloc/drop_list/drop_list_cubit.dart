import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elvateHub/core/global_model/drop_down_model.dart';

import 'drop_list_state.dart';

class DropListCubit extends Cubit<DropListState> {
  DropListCubit() : super(DropListInitState());

  static DropListCubit get(context) => BlocProvider.of(context);

  static Map<String, DropDownModel> dropListValue = {};

  void changeValue({
    required String key,
    required DropDownModel value,
  }) {
    if (dropListValue.containsKey(key)) {
      dropListValue.update(key, (v) => value);
    } else {
      dropListValue.addAll({key: value});
    }
    emit(DropListChangeValueState());
  }
}
