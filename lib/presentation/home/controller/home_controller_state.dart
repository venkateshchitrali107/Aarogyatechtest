import 'package:equatable/equatable.dart';

class HomeControllerState extends Equatable {
  final bool isLoading;
  final int currentDateIndex;
  final List<DateTime> dates;
  final List<String> doctors;
  final String? dropdownValue;

  const HomeControllerState({
    required this.currentDateIndex,
    required this.isLoading,
    required this.dates,
    required this.doctors,
    required this.dropdownValue,
  });

  HomeControllerState copyWith({
    int? currentDateIndex,
    bool? isLoading,
    List<DateTime>? dates,
    List<String>? doctors,
    String? dropdownValue,
  }) {
    return HomeControllerState(
      currentDateIndex: currentDateIndex ?? this.currentDateIndex,
      isLoading: isLoading ?? this.isLoading,
      dates: dates ?? this.dates,
      doctors: doctors ?? this.doctors,
      dropdownValue: dropdownValue ?? this.dropdownValue,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
