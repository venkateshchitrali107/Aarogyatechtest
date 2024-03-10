import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_controller_state.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeControllerState build() {
    return const HomeControllerState(
      currentDateIndex: 0,
      isLoading: true,
      dates: [],
      doctors: [],
      dropdownValue: null,
    );
  }

  void setDoctor(String doctor) {
    state = state.copyWith(dropdownValue: doctor);
  }

  void getDates() async {
    var now = DateTime.now();
    var oneMonthAgo = now.subtract(const Duration(days: 30));
    var oneMonthFuture = now.add(const Duration(days: 30));
    var dates = <DateTime>[];
    var current = oneMonthAgo;
    while (current.isBefore(oneMonthFuture)) {
      dates.add(current);
      current = current.add(const Duration(days: 1));
    }
    final currentDateIndex = dates.indexWhere((element) {
      return element.year == now.year &&
          element.month == now.month &&
          element.day == now.day;
    });
    final doctors = [
      'Dr Alpha',
      'Dr Beta',
      'Dr Gamma',
    ];
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(
      currentDateIndex: currentDateIndex,
      dates: dates,
      isLoading: false,
      doctors: doctors,
      dropdownValue: null,
    );
  }
}
