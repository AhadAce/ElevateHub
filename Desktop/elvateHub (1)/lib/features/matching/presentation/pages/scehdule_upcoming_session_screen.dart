import 'package:elvateHub/core/themes/app_colors.dart';
import 'package:elvateHub/core/themes/context.dart';
import 'package:elvateHub/core/widgets/app_btn.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

import '../../../../core/generated/l10n.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/vertical_sized_box.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBackButton(),
                const Spacer(),
                Text(
                  S.of(context).scehduleUpcomingSession,
                  style: context.mainTitle,
                ),
                const Spacer(),
              ],
            ),
            const VerticalSizedBox(20),

            // Week Days (FIXED SYNTAX)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('S', style: TextStyle(color: Colors.grey)),
                Text('M', style: TextStyle(color: Colors.grey)),
                Text('T', style: TextStyle(color: Colors.grey)),
                Text('W', style: TextStyle(color: Colors.grey)),
                Text('T', style: TextStyle(color: Colors.grey)),
                Text('F', style: TextStyle(color: Colors.grey)),
                Text('S', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),

            // Dates
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                7,
                (index) => CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.transparent,
                  child: Text(
                    '${17 + index}',
                    style: context.smallBody,
                  ),
                ),
              ),
            ),
            const CustomDivider(),

            // Available Days
            const Text('Dr. Alifiati Fitrikasari Available Days:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildDateChip('May 24'),
                _buildDateChip('May 27'),
                _buildDateChip('May 29'),
                _buildDateChip('May 31'),
                _buildDateChip('June 2'),
              ],
            ),
            const SizedBox(height: 24),

            // Time Picker
            const Text('Pick a Time:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTimeButton('11:30 AM'),
                _buildTimeButton('12:30 PM'),
                _buildTimeButton('1:30 PM'),
                _buildTimeButton('4:30 PM'),
              ],
            ),
            const Spacer(),

            // Confirm Button
            AppBtn(
              title: 'Confirm',
              function: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateChip(String date) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(date),
    );
  }

  Widget _buildTimeButton(String time) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColors.lightPrimaryColor,
        ),
        backgroundColor: AppColors.lightPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Text(
        time,
        style: TextStyle(
          color: AppColors.primaryTextColor,
        ),
      ),
    );
  }
}
