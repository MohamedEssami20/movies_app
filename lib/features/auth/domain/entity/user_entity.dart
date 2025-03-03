class UserEntity {
  final String email;
  final String password;
  UserEntity({
    required this.email,
    required this.password,
  });

  UserEntity copyWith({
    String? email,
    String? password,
  }) {
    return UserEntity(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}