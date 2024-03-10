import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/home_controller.dart';
import 'home_screen_widget.dart';

class SlotListWidget extends ConsumerWidget {
  const SlotListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    if (state.selectedSlot == null) {
      return const SizedBox(
        height: 60,
      );
    } else {
      final selectedSlot = state.selectedSlot!;
      final int slotHour = int.parse(selectedSlot.hour);
      return SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              AppointmentSlotChip(
                startTime: '$slotHour:00',
                endTime: '$slotHour:15',
                isAvailable: selectedSlot.availableSlotNumbers.contains(1),
              ),
              AppointmentSlotChip(
                startTime: '$slotHour:15',
                endTime: '$slotHour:30',
                isAvailable: selectedSlot.availableSlotNumbers.contains(2),
              ),
              AppointmentSlotChip(
                startTime: '$slotHour:30',
                endTime: '$slotHour:45',
                isAvailable: selectedSlot.availableSlotNumbers.contains(3),
              ),
              AppointmentSlotChip(
                startTime: '$slotHour:45',
                endTime: '${slotHour + 1}:00',
                isAvailable: selectedSlot.availableSlotNumbers.contains(4),
              ),
            ],
          ),
        ),
      );
    }
  }
}
