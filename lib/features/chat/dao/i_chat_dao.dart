import 'package:tinygram/features/chat/domain/models/message.dart';

abstract class IChatDAO {
  Future<List<Message>> readAll(String chatId);
  Future<void> sendMessage(String chatId, String text);
}
