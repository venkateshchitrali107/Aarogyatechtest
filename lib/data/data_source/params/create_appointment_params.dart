import 'package:equatable/equatable.dart';

class CreateAppointmentParams extends Equatable {
  final String doctorId;
  final String patientId;
  final String slotValue;
  final String status;
  final String createdOn;
  final String scheduledDate;
  final String createdBy;
  const CreateAppointmentParams({
    required this.doctorId,
    required this.patientId,
    required this.slotValue,
    required this.status,
    required this.createdOn,
    required this.scheduledDate,
    required this.createdBy,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'doctor_id': doctorId,
      'patient_id': patientId,
      'slot_value': slotValue,
      'status': status,
      'created_on': createdOn,
      'scheduled_date': scheduledDate,
      'created_by': createdBy,
    };
  }

  @override
  List<Object?> get props => [
        doctorId,
        patientId,
        slotValue,
        status,
        createdOn,
        scheduledDate,
        createdBy
      ];
}
