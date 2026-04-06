import 'package:elvateHub/core/di/injector.dart';
import 'package:elvateHub/core/helpers/constant.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:elvateHub/features/community/data/models/report_model.dart';
import 'package:elvateHub/features/community/presentation/cubit/report_post_cubit.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({
    super.key,
    required this.postId,
  });
  final String postId;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool reportSuccess = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportPostCubit(getIt()),
      child: BlocConsumer<ReportPostCubit, ReportPostState>(
        listener: (context, state) {
          if (state is ReportPostSuccessState) {
            reportSuccess = true;
          }
        },
        builder: (context, state) => reportSuccess
            ? Center(
                child: Container(
                  height: 100.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                      color: context.scaffoldColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Center(
                    child: Text(
                      S.of(context).reportSuccess,
                      style: context.mainTitle,
                    ),
                  ),
                ),
              )
            : Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                      color: context.scaffoldColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).reportReason,
                        style: context.mainTitle,
                      ),
                      const VerticalSizedBox(20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: reportReason
                            .map((element) => _reportReasonWidget(
                                  context,
                                  label: element.name ?? '',
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _reportReasonWidget(
    BuildContext context, {
    required String label,
  }) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => ReportPostCubit.get(context).reportPost(
            reportModel: ReportModel(
              postId: widget.postId,
              reason: label,
              userId: context.user.id ?? '',
            ),
          ),
          child: Text(
            label,
            style: context.subBody,
          ),
        ),
      );
}
