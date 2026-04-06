import '../../domain/entities/chat_message_entity.dart';

class ChatMessageModel {
  final String id;
  final String senderId;
  final String message;
  final DateTime timestamp;

  ChatMessageModel({
    required this.id,
    required this.senderId,
    required this.message,
    required this.timestamp,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'],
      senderId: json['senderId'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  ChatMessageEntity toEntity() => ChatMessageEntity(
        id: id,
        senderId: senderId,
        message: message,
        timestamp: timestamp,
      );
}
