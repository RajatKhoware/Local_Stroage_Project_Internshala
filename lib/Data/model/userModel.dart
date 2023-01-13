// Define a class to represent the user data
import '../userJson.dart';

class User {
  final String name;
  final String id;
  final String atype;

  User({required this.name, required this.id, required this.atype});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? "",
      id: json['id'] ?? "",
      atype: json['atype'] ?? "",
    );
  }
}

final users = usersJson[0]['users']!.map((e) => User.fromJson(e)).toList();
