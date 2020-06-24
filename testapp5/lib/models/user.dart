class User {
  final int id;
  final String email;
  final String phone;

  User({this.id, this.email, this.phone});

  static User fromJson(json) {
    return User(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
