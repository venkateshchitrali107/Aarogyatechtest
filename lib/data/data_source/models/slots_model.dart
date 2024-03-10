import 'dart:convert';

class SlotsModel {
  final String hour;
  final List<int> availableSlotNumbers;
  final int availableSlots;

  SlotsModel({
    required this.hour,
    required this.availableSlotNumbers,
    required this.availableSlots,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hour': hour,
      'availableSlotNumbers': availableSlotNumbers,
      'availableSlots': availableSlots,
    };
  }

  factory SlotsModel.fromMap(Map<String, dynamic> map) {
    return SlotsModel(
      hour: map['hour'] as String,
      availableSlotNumbers:
          List<int>.from((map['availableSlotNumbers'] as List<int>)),
      availableSlots:
          4 - List<int>.from((map['availableSlotNumbers'] as List<int>)).length,
    );
  }

  String toJson() => json.encode(toMap());

  factory SlotsModel.fromJson(String source) =>
      SlotsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
