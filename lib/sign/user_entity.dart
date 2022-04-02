class UserEntity {
  String id;
  String name;
  String email;

  UserEntity({required this.id, required this.name, required this.email});

  factory UserEntity.fromMap(Map<String, dynamic> userMap) {
    return UserEntity(
        email: userMap['email'], id: userMap['id'], name: userMap['name']);
  }

  @override
  String toString() {
    return 'UserEntity > id: $id name:$name email:$email';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
