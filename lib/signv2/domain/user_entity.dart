class UserEntity {
  String id;
  String name;
  String email;
  String? photoUrl;

  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      this.photoUrl});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'photoUrl': photoUrl,
  //   };
  // }

  @override
  String toString() {
    return 'UserEntity > id: $id nome:$name email:$email foto:$photoUrl';
  }
}
