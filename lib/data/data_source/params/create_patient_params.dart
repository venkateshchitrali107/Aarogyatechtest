import 'package:equatable/equatable.dart';

class CreatePatientParams extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String gender;
  const CreatePatientParams({
    required this.fullName,
    required this.phoneNumber,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'full_name': fullName,
      'phone': phoneNumber,
      'gender': gender,
    };
  }

  @override
  List<Object?> get props => [fullName, phoneNumber, gender];
}
