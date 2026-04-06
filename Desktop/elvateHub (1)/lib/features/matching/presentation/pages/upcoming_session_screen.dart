import 'package:elvateHub/core/themes/context.dart';
import 'package:elvateHub/core/widgets/custom_app_bar.dart';
import 'package:elvateHub/core/widgets/vertical_sized_box.dart';
import 'package:flutter/material.dart';

import '../../../../core/generated/l10n.dart';
import '../../../../core/widgets/custom_back_button.dart';

class UpcomingSessionScreen extends StatelessWidget {
  const UpcomingSessionScreen({super.key});

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
                  S.of(context).upcomingSession,
                  style: context.mainTitle,
                ),
                const Spacer(),
              ],
            ),
            const VerticalSizedBox(20),
            // Calendar Header
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

            // Calendar Dates
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                7,
                (index) => CircleAvatar(
                  backgroundColor: index == 3
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  radius: 16,
                  child: Text(
                    '${17 + index}',
                    style: TextStyle(
                      color: index == 3 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(thickness: 2, height: 32),

            // Sessions List
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) => const Divider(height: 32),
                itemBuilder: (context, index) => _buildSessionItem(),
              ),
            ),

            // Close Button
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Close'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'need to reschedule? Chat Mentor!!!',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionItem() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(value: false, onChanged: null),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('May ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('(Today | 5:00 PM)',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 4),
              Text('20',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Mentorship session'),
              Text('Career growth: Nick (Your Mentor)',
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
