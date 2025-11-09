import 'package:cloud_firestore/cloud_firestore.dart';

DateTime dateTimeFromJson(dynamic value) {
  if (value is Timestamp) {
    return value.toDate();
  } else if (value is DateTime) {
    return value;
  } else if (value is String) {
    return DateTime.parse(value);
  } else if (value is Map && value['_seconds'] != null) {
    return DateTime.fromMillisecondsSinceEpoch((value['_seconds'] as int) * 1000);
  }
  return DateTime.now();
}

dynamic dateTimeToJson(DateTime dateTime) {
  return Timestamp.fromDate(dateTime);
}

