import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required final String id,
    required final String name,
  }) = _Chat;

  const Chat._();

  factory Chat.fromJson(Map<String, Object?> json) => _$ChatFromJson(json);
}
