class UserModel {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.photoUrl});

  factory UserModel.fromMap(Map<String, dynamic> userMap) {
    return UserModel(
        email: userMap['email'],
        id: userMap['id'],
        name: userMap['name'],
        photoUrl: userMap['photoUrl']);
  }
}
