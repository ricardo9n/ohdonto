class SignUpEntity {
  String name;
  String email;
  String password;

  SignUpEntity(
      {required this.email, required this.name, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
