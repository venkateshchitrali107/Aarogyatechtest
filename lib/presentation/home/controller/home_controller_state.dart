import 'package:equatable/equatable.dart';

import '../../../data/data_source/models/data_models.dart';

class HomeControllerState extends Equatable {
  final bool isLoading; // tracks loading state
  final int currentDateIndex; // index of selected date
  final List<DateTime> dates; // list of available dates
  final List<String> doctors; // list of available doctors
  final String? dropdownValue; // selected doctor
  final bool isAMSelected; // tracks AM/PM selection
  final List<SlotsModel> slots; // available slots
  final SlotsModel? selectedSlot; // selected slot
  final int? selectedSlotNumber; // index of selected slot

  const HomeControllerState({
    required this.currentDateIndex,
    required this.isLoading,
    required this.dates,
    required this.doctors,
    required this.dropdownValue,
    required this.isAMSelected,
    required this.slots,
    required this.selectedSlot,
    required this.selectedSlotNumber,
  });

  HomeControllerState copyWith({
    int? currentDateIndex,
    bool? isLoading,
    List<DateTime>? dates,
    List<String>? doctors,
    bool removeDropdownValue = false,
    String? dropdownValue,
    bool? isAMSelected,
    List<SlotsModel>? slots,
    SlotsModel? selectedSlot,
    bool removeSelectedSlot = false,
    int? selectedSlotNumber,
    bool removeSelectedSlotNumber = false,
  }) {
    return HomeControllerState(
      currentDateIndex: currentDateIndex ?? this.currentDateIndex,
      isLoading: isLoading ?? this.isLoading,
      dates: dates ?? this.dates,
      doctors: doctors ?? this.doctors,
      dropdownValue:
          removeDropdownValue ? null : dropdownValue ?? this.dropdownValue,
      isAMSelected: isAMSelected ?? this.isAMSelected,
      slots: slots ?? this.slots,
      selectedSlot:
          removeSelectedSlot ? null : selectedSlot ?? this.selectedSlot,
      selectedSlotNumber: removeSelectedSlotNumber
          ? null
          : selectedSlotNumber ?? this.selectedSlotNumber,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        currentDateIndex,
        dates,
        doctors,
        dropdownValue,
        isAMSelected,
        slots,
        selectedSlot,
        selectedSlotNumber
      ];
}
