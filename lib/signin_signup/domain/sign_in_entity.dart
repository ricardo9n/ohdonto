import 'package:ohdonto/shared/value_object.dart';

class SignInEntity {
  Email email;
  Password password;

  SignInEntity({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() => 'SignInEntity(email: $email, password: $password)';
}
