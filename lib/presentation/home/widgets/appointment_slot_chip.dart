import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentSlotChip extends ConsumerWidget {
  const AppointmentSlotChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelPadding: const EdgeInsets.all(0),
        label: Text(
          '8:00 - 8:15',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
