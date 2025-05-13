class UserDto {
  String? accessToken;
  String? tokenType;
  int? id;
  String? firstName;
  String? email;
  String? username;

  UserDto({
    required this.accessToken,
    required this.tokenType,
    required this.id,
    required this.firstName,
    required this.email,
    required this.username,
  });

  // Factory to create from JSON
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
      id: json['id'],
      firstName: json['firstName'],
      email: json['email'],
      username: json['username'],
    );
  }
}
