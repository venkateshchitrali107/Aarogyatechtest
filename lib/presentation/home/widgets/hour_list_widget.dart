import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/home_controller.dart';
import 'home_screen_widget.dart';

class HoursListWidget extends ConsumerWidget {
  const HoursListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    if ((state.dropdownValue ?? '').isEmpty) {
      return SizedBox(
        height: 130,
        child: Center(
          child: Text(
            'Please select the doctor from the dropdown',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );
    }
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: state.slots.map((e) => GetTheHourSlot(e)).toList(),
        ),
      ),
    );
  }
}
