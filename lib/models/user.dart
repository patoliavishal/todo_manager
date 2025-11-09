import 'package:todo_manager/models/utils.dart';

class AppUser {
  final String id;
  final String email;
  final String displayName;
  final String photoUrl;
  final DateTime createdAt;

  const AppUser({
    required this.id,
    required this.email,
    required this.displayName,
    this.photoUrl = '',
    required this.createdAt,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      photoUrl: json['photoUrl'] as String? ?? '',
      createdAt: dateTimeFromJson(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createdAt': dateTimeToJson(createdAt),
    };
  }
}

