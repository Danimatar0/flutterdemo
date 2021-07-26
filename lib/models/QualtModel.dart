import 'dart:convert';


class QualtModel {
  final int Id;
  final String Time;
  final String TimeChecked;
  final String CaseOpenedTime;
  final String Rating;
  
  QualtModel({
    required this.Id,
    required this.Time,
    required this.TimeChecked,
    required this.CaseOpenedTime,
    required this.Rating,
  });


  QualtModel copyWith({
    int? Id,
    String? Time,
    String? TimeChecked,
    String? CaseOpenedTime,
    String? Rating,
  }) {
    return QualtModel(
      Id: Id ?? this.Id,
      Time: Time ?? this.Time,
      TimeChecked: TimeChecked ?? this.TimeChecked,
      CaseOpenedTime: CaseOpenedTime ?? this.CaseOpenedTime,
      Rating: Rating ?? this.Rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': Id,
      'Time': Time,
      'TimeChecked': TimeChecked,
      'CaseOpenedTime': CaseOpenedTime,
      'Rating': Rating,
    };
  }

  factory QualtModel.fromMap(Map<String, dynamic> map) {
    return QualtModel(
      Id: map['Id'],
      Time: map['Time'],
      TimeChecked: map['TimeChecked'],
      CaseOpenedTime: map['CaseOpenedTime'],
      Rating: map['Rating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QualtModel.fromJson(String source) => QualtModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QualtModel(Id: $Id, Time: $Time, TimeChecked: $TimeChecked, CaseOpenedTime: $CaseOpenedTime, Rating: $Rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QualtModel &&
      other.Id == Id &&
      other.Time == Time &&
      other.TimeChecked == TimeChecked &&
      other.CaseOpenedTime == CaseOpenedTime &&
      other.Rating == Rating;
  }

  @override
  int get hashCode {
    return Id.hashCode ^
      Time.hashCode ^
      TimeChecked.hashCode ^
      CaseOpenedTime.hashCode ^
      Rating.hashCode;
  }
}
