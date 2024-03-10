import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/core.dart';
import 'widgets/home_screen_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 2,
        title: const Text(
          str_home_screen_appointment,
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          TitleWidget(),
          DateListWidget(),
          DoctorSelectionWidget(),
          HoursListWidget(),
          SlotListWidget(),
          SizedBox(height: 32),
          ScheduleButton(),
        ],
      ),
    );
  }
}
