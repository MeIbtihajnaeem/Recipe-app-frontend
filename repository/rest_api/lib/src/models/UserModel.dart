import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String token;
  final User user;

  UserModel({
    required this.token,
    required this.user,
  });

  UserModel copyWith({
    String? token,
    User? user,
  }) =>
      UserModel(
        token: token ?? this.token,
        user: user ?? this.user,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "token": token,
        "user": user.toJson(),
      };

  @override
  List<Object> get props => [token, user];
}

class User extends Equatable {
  final int id;
  final String username;
  final String email;

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  User copyWith({
    int? id,
    String? username,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
      );

  factory User.fromJson(Map<String, dynamic> json) =>
      User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "username": username,
        "email": email,
      };

  @override
  List<Object> get props => [id, username, email];
}
