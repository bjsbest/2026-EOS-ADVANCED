class Friend {
  final int? id;
  final int userId;    // 나 (현재 로그인한 유저 ID)
  final int friendId;  // 친구 (상대방 유저 ID)

  Friend({
    this.id,
    required this.userId,
    required this.friendId,
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      id: json['id'],
      userId: json['userId'],
      friendId: json['friendId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'friendId': friendId,
  };
}