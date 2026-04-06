import 'package:dropdown_search/dropdown_search.dart';
import 'package:elvateHub/core/global_model/drop_down_model.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_divider.dart';
import 'package:elvateHub/core/widgets/horizontal_sized_box.dart';
import 'package:elvateHub/core/widgets/image_widget.dart';
import '../../features/category/data/models/category_model.dart';
import '../global_bloc/drop_list/drop_list_cubit.dart';
import 'vertical_sized_box.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.keyStr,
    required this.list,
    required this.value, // 'value' is the string representation of the initial selected item
    required this.title,
    this.function,
    this.needTitle = false,
  });

  final String keyStr, value, title;
  final List<DropDownModel> list;
  final VoidCallback? function;
  final bool needTitle;

  @override
  Widget build(BuildContext context) {
    // Find the initial selected item based on the 'value' string
    DropDownModel? initialSelectedItem = list.firstWhere(
      (element) => element.name == value,
      orElse: () => CategoryModel.emptyOne().toEntity(),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (needTitle) ...[
            Text(
              title,
              style: context.greyText,
            ),
            const VerticalSizedBox(10),
          ],
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                style: BorderStyle.solid,
                color: AppColors.primaryColor,
              ),
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: InkWell(
                borderRadius: BorderRadius.circular(8.r),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownSearch<DropDownModel>(
                          selectedItem:
                              initialSelectedItem, // Set initial value
                          itemAsString: (item) => item.name ?? '',
                          popupProps: PopupProps.menu(
                            showSearchBox: true,
                            isFilterOnline: true,
                            menuProps: MenuProps(
                              backgroundColor: context.scaffoldColor,
                            ),
                            itemBuilder: (context, item, val) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 16.h,
                                  ),
                                  child: Row(
                                    children: [
                                      if (item.flag != null) ...[
                                        ImageWidget(
                                          image: item.flag!,
                                          height: 20,
                                          width: 20,
                                        ),
                                        const HorizontalSizedBox(8),
                                      ],
                                      Text(
                                        item.name ?? '',
                                        style: context.subBody,
                                      ),
                                    ],
                                  ),
                                ),
                                const CustomDivider(),
                              ],
                            ),
                            searchFieldProps: TextFieldProps(
                              style: context.smallBody,
                              decoration: InputDecoration(
                                fillColor: AppColors.primaryColor,
                                filled: true,
                                border: InputBorder.none,
                                hintStyle: context.smallBody,
                                hintText: title,
                              ),
                            ),
                          ),
                          enabled: true,
                          asyncItems: (String filter) async {
                            List<DropDownModel> newList = [];
                            for (var element in list) {
                              if (element.name?.contains(filter) ?? false) {
                                newList.add(element);
                              }
                            }
                            return newList;
                          },
                          onChanged: (val) =>
                              _changeValue(context, dropDownModel: val!),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changeValue(
    BuildContext context, {
    required DropDownModel dropDownModel,
  }) {
    DropListCubit.get(context).changeValue(
      key: keyStr,
      value: dropDownModel,
    );
    if (function != null) function!.call();
  }
}
