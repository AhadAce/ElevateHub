import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget(
      {super.key, required this.error, required this.function});
  final String error;
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(error),
          ),
          SizedBox(
            height: 10.h,
          ),
          AppBtn(
            function: function,
            title: S.of(context).reloadRequest,
          ),
        ],
      ),
    );
  }
}
