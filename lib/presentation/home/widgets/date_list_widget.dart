import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../presentation_utils/app_theme_data.dart';
import '../controller/home_controller.dart';

class DateListWidget extends ConsumerStatefulWidget {
  const DateListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DateListWidgetState();
}

class _DateListWidgetState extends ConsumerState<DateListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(homeControllerProvider.notifier).getDates();
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
    ).then((value) {
      _scrollController.animateTo(
        (ref.read(homeControllerProvider).currentDateIndex - 1) * 100.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.dates.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ref.read(homeControllerProvider.notifier).selectDate(index);
            },
            child: SizedBox(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color:
                      (index == state.currentDateIndex) ? primary90Color : null,
                  elevation: index == state.currentDateIndex ? 3.0 : 0.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      width: 1,
                      color: (index == state.currentDateIndex)
                          ? primary80Color
                          : Colors.transparent,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          date_format_mmm.format(state.dates[index]),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            date_format_dd.format(state.dates[index]),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Text(
                          date_format_e.format(state.dates[index]),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
