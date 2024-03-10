import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_screen_widget.dart';

class HoursListWidget extends ConsumerWidget {
  const HoursListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            GetTheHourSlot(5, 1),
            GetTheHourSlot(6, 2),
            GetTheHourSlot(7, 4),
            GetTheHourSlot(8, 0),
            GetTheHourSlot(9, 3),
          ],
        ),
      ),
    );
  }
}
