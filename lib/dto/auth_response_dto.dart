class AuthResponseDto {
  String? token;
  String? tokenType;
  int? userId;
  String? email;
  String? name;
  String? OTP;

  AuthResponseDto({
    required this.token,
    required this.tokenType,
    required this.userId,
    required this.email,
    required this.name,
    required this.OTP,
  });

  // Factory to create from JSON
  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      token: json['token'],
      tokenType: json['tokenType'],
      userId: json['userId'],
      email: json['email'],
      name: json['name'],
      OTP: json['OTP'],
    );
  }
}
