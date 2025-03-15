class UserEntity {
  final String email;
  final String uid;
  UserEntity({
    required this.email,
    required this.uid,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map['email'],
      uid: map['uid'],
    );
  }
}
