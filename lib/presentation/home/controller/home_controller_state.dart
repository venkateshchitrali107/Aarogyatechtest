import 'package:equatable/equatable.dart';

import '../../../data/data_source/models/data_models.dart';

class HomeControllerState extends Equatable {
  final bool isLoading;
  final int currentDateIndex;
  final List<DateTime> dates;
  final List<String> doctors;
  final String? dropdownValue;
  final bool isAMSelected;
  final List<SlotsModel> slots;
  final SlotsModel? selectedSlot;
  const HomeControllerState({
    required this.currentDateIndex,
    required this.isLoading,
    required this.dates,
    required this.doctors,
    required this.dropdownValue,
    required this.isAMSelected,
    required this.slots,
    required this.selectedSlot,
  });

  HomeControllerState copyWith({
    int? currentDateIndex,
    bool? isLoading,
    List<DateTime>? dates,
    List<String>? doctors,
    String? dropdownValue,
    bool? isAMSelected,
    List<SlotsModel>? slots,
    SlotsModel? selectedSlot,
    bool removeSelectedSlot = false,
  }) {
    return HomeControllerState(
      currentDateIndex: currentDateIndex ?? this.currentDateIndex,
      isLoading: isLoading ?? this.isLoading,
      dates: dates ?? this.dates,
      doctors: doctors ?? this.doctors,
      dropdownValue: dropdownValue ?? this.dropdownValue,
      isAMSelected: isAMSelected ?? this.isAMSelected,
      slots: slots ?? this.slots,
      selectedSlot:
          removeSelectedSlot ? null : selectedSlot ?? this.selectedSlot,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
