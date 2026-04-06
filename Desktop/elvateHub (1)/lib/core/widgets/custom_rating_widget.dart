import 'package:elvateHub/core/routes/common_import.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../assets/assets.gen.dart';
import 'horizontal_sized_box.dart';

class CustomRateWidget extends StatelessWidget {
  const CustomRateWidget({
    super.key,
    required this.rate,
    this.showRateValue = false,
  });
  final double rate;
  final bool showRateValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingStars(
          value: rate,
          valueLabelVisibility: false,
          starBuilder: (index, color) {
            return (index + 1) <= rate
                ? Assets.images.starFill.svg()
                : Assets.images.star.svg();
          },
        ),
        if (showRateValue) ...[
          const HorizontalSizedBox(5),
          Text(
            rate.toStringAsFixed(2),
            style: context.greyText,
          ),
        ],
      ],
    );
  }
}
