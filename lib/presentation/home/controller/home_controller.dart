import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/data_source/models/data_models.dart';
import 'home_controller_state.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  final amSlots = [
    SlotsModel(hour: '8', availableSlotNumbers: [1], availableSlots: 1),
    SlotsModel(hour: '9', availableSlotNumbers: [1, 3], availableSlots: 2),
    SlotsModel(
        hour: '10', availableSlotNumbers: [1, 2, 3, 4], availableSlots: 4),
    SlotsModel(hour: '11', availableSlotNumbers: [2, 3, 4], availableSlots: 3),
    SlotsModel(hour: '12', availableSlotNumbers: [], availableSlots: 0),
  ];
  final pmSlots = [
    SlotsModel(hour: '5', availableSlotNumbers: [1], availableSlots: 1),
    SlotsModel(hour: '6', availableSlotNumbers: [1, 3], availableSlots: 2),
    SlotsModel(
        hour: '7', availableSlotNumbers: [1, 2, 3, 4], availableSlots: 4),
    SlotsModel(hour: '8', availableSlotNumbers: [2, 3, 4], availableSlots: 3),
    SlotsModel(hour: '9', availableSlotNumbers: [], availableSlots: 0),
  ];
  @override
  HomeControllerState build() {
    return HomeControllerState(
        currentDateIndex: 0,
        isLoading: true,
        dates: const [],
        doctors: const [],
        dropdownValue: null,
        isAMSelected: isCurrentAM(),
        slots: amSlots,
        selectedSlot: null);
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

  void selectDate(int dateIndex) {
    state = state.copyWith(
      currentDateIndex: dateIndex,
      isAMSelected: isCurrentAM(),
      removeDropdownValue: true,
      removeSelectedSlot: true,
    );
  }

  void updateMeridean(bool isAMSelected) {
    state = state.copyWith(
      isAMSelected: isAMSelected,
      slots: isAMSelected ? amSlots : pmSlots,
      removeSelectedSlot: true,
    );
  }

  void updateSlots() {
    state = state.copyWith(slots: state.isAMSelected ? amSlots : pmSlots);
  }

  void selectHourSlot(SlotsModel slot) {
    state = state.copyWith(selectedSlot: slot);
  }

  bool isCurrentAM() {
    final now = DateTime.now();
    return now.hour < 12;
  }
}
