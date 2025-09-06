class LoginResponseModel {
  String message;
  User user;
  String token;

  LoginResponseModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  int id;
  String name;
  String email;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
