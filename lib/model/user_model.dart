class UserModel {
  String? name;
  String? email;
  String? password;
  UserModel({this.email, this.name, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String?,
      name: json['username'] as String?,
    );
  }
}
