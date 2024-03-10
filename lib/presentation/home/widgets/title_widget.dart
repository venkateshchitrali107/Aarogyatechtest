import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';

class TitleWidget extends ConsumerWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            str_home_screen_pick_date,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const Icon(
            Icons.calendar_month,
          )
        ],
      ),
    );
  }
}
