import 'package:aarogyatechtest/data/data_source/models/slots_model.dart';
import 'package:aarogyatechtest/presentation/home/controller/home_controller.dart';
import 'package:aarogyatechtest/presentation/presentation_utils/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation_utils/circle_util.dart';

class GetTheHourSlot extends ConsumerWidget {
  const GetTheHourSlot(
    this.slot, {
    super.key,
  });
  final SlotsModel slot;

  Color getColorForHourSlot(WidgetRef ref) {
    if (slot.availableSlots == 0) {
      return Colors.grey.shade200;
    } else {
      final state = ref.read(homeControllerProvider);
      if (state.selectedSlot != null) {
        if (state.selectedSlot!.hour == slot.hour) {
          return primary90Color;
        }
      }
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: slot.availableSlots == 0
          ? null
          : () {
              ref.read(homeControllerProvider.notifier).selectHourSlot(slot);
            },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: MediaQuery.of(context).size.width / 4.5,
        width: MediaQuery.of(context).size.width / 4.5,
        decoration: BoxDecoration(
          color: getColorForHourSlot(ref),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black26,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: slot.availableSlots == 0
                  ? Colors.transparent
                  : Colors.black12,
              blurRadius: 10,
              offset: slot.availableSlots == 0
                  ? const Offset(0, 0)
                  : const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: CustomPaint(
            painter: DrawSlotsCircle(
              numberOfSlots: slot.availableSlots,
            ),
            child: Center(
              child: Text(
                slot.hour,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
