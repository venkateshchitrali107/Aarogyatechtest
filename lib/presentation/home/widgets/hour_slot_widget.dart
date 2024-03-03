import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation_utils/circle_util.dart';

class GetTheHourSlot extends ConsumerWidget {
  const GetTheHourSlot(
    this.slotTime,
    this.numberOfAvailableSlots, {
    super.key,
  });
  final int slotTime;
  final int numberOfAvailableSlots;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: MediaQuery.of(context).size.width / 4.5,
      width: MediaQuery.of(context).size.width / 4.5,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black26,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: CustomPaint(
          painter: DrawSlotsCircle(numberOfSlots: numberOfAvailableSlots),
          child: Center(
            child: Text(
              '$slotTime',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
      ),
    );
  }
}
