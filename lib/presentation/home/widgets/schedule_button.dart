import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../patient_profile/patient_profile_screen.dart';
import '../../presentation_utils/app_theme_data.dart';

class ScheduleButton extends ConsumerWidget {
  const ScheduleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primary90Color),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const PatientProfileScreen();
            },
          ),
        );
      },
      child: Text(
        str_home_screen_schedule_appointment,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
