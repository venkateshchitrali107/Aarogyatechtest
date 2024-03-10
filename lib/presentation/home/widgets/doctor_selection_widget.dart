import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../presentation_utils/app_theme_data.dart';
import '../controller/home_controller.dart';

class DoctorSelectionWidget extends ConsumerWidget {
  const DoctorSelectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 16,
              ),
              child: DropdownButton<String>(
                hint: const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    str_home_screen_doctor,
                    textAlign: TextAlign.center,
                  ),
                ),
                value: state.dropdownValue,
                underline: const SizedBox(),
                items:
                    state.doctors.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  ref
                      .read(homeControllerProvider.notifier)
                      .setDoctor(newValue!);
                },
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  ref
                      .read(homeControllerProvider.notifier)
                      .updateMeridean(true);
                },
                child: Card(
                  color: state.isAMSelected ? primary90Color : null,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(str_home_screen_am),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  ref
                      .read(homeControllerProvider.notifier)
                      .updateMeridean(false);
                },
                child: Card(
                  color: state.isAMSelected ? null : primary90Color,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(str_home_screen_pm),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
