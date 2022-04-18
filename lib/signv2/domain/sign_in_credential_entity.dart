class SignInCredentialEntity {
  String email;
  String password;

  SignInCredentialEntity({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
