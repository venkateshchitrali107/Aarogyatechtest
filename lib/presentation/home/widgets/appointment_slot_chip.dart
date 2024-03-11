import '../../presentation_utils/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentSlotChip extends ConsumerWidget {
  const AppointmentSlotChip({
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
    required this.isSelected,
    super.key,
  });
  final String startTime;
  final String endTime;
  final bool isAvailable;
  final bool isSelected;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        color: MaterialStatePropertyAll(
          isAvailable
              ? (isSelected ? primary90Color : Colors.white)
              : Colors.grey.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelPadding: const EdgeInsets.all(0),
        label: Text(
          '$startTime - $endTime',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
