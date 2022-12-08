import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Program {
  List<String>? coordinators;
  DateTime? endDate;
  String? location;
  DateTime? startDate;
  String? title;

  Program({
    this.coordinators,
    this.endDate,
    this.location,
    this.startDate,
    this.title,
  });

  Program.fromJson(Map<String, dynamic> json) {
    coordinators = json['coordinators'].cast<String>();
    endDate = json['end_date'];
    location = json['location'];
    startDate = json['start_date'];
    title = json['title'];
  }

  Program.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final json = snapshot.data();
    coordinators =
        (json['coordinators'] as List).map((e) => e as String).toList();
    endDate = (json['end_date'] as Timestamp).toDate();
    location = json['location'];
    startDate = (json['start_date'] as Timestamp).toDate();
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coordinators'] = coordinators;
    data['end_date'] = endDate;
    data['location'] = location;
    data['start_date'] = startDate;
    data['title'] = title;
    return data;
  }

  String get startDateFormatted => DateFormat('d MMM y').format(startDate!);
  String get endDateFormatted => DateFormat('d MMM y').format(endDate!);
  String get timeStart => DateFormat('jm').format(startDate!);
  String get timeEnd => DateFormat('jm').format(endDate!);
  String get dayWeekStart => DateFormat('EEE').format(startDate!);
  String get dayStart => DateFormat('dd').format(startDate!);

  String get date {
    if (isSameDay) return startDateFormatted;
    return '${DateFormat('d').format(startDate!)} hingga $endDateFormatted';
  }

  String get time {
    return '$timeStart - $timeEnd';
  }

  bool get isSameDay {
    final startDay = DateTime(
      startDate!.year,
      startDate!.month,
      startDate!.day,
    );
    final endDay = DateTime(
      endDate!.year,
      endDate!.month,
      endDate!.day,
    );
    return startDay.isAtSameMomentAs(endDay);
  }

  String get description => 'Bermula pada $date ($time) di $location';
}
