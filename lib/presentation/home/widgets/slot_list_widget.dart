import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_screen_widget.dart';

class SlotListWidget extends ConsumerWidget {
  const SlotListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            AppointmentSlotChip(),
            AppointmentSlotChip(),
            AppointmentSlotChip(),
            AppointmentSlotChip(),
          ],
        ),
      ),
    );
  }
}
