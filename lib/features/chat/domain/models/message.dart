import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required final String id,
    required final String userId,
    required final String userName,
    required final String chatId,
    required final DateTime sentAt,
    required final String text,
  }) = _Message;

  const Message._();

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);
}
