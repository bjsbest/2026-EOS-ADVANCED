class User {
  final int? id; // 서버에서 할당하는 고유 ID
  final String loginId; // 로그인 시 사용하는 ID
  final String nickname; // 화면에 표시될 이름

  User({
    this.id,
    required this.loginId,
    required this.nickname,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      loginId: json['loginId'],
      nickname: json['nickname'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'loginId': loginId,
    'nickname': nickname,
  };
}