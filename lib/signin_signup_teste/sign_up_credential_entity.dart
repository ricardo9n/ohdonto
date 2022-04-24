class SignUpCredentialEntity {
  String email;
  String name;
  String password;

  SignUpCredentialEntity(
      {required this.email, required this.name, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }
}
