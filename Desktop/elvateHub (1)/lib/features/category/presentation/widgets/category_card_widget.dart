import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/image_widget.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';

import '../../domain/entities/category_entity.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.categoryEntity,
  });
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.pushNamed(
      //   context,
      //   AppRouter.categoryDetails,
      //   arguments: categoryEntity,
      // ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            ImageWidget(
              image: categoryEntity.flag ?? '',
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
            const VerticalSizedBox(10),
            Text(
              categoryEntity.name ?? '',
              style: context.subTitle,
            ),
          ],
        ),
      ),
    );
  }
}
