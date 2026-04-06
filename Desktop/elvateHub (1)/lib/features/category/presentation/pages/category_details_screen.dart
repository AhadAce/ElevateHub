import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/features/category/domain/entities/category_entity.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({
    super.key,
    required this.categoryEntity,
  });
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('category'),
      ),
    );
  }
}
