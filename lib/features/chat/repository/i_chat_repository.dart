import 'package:tinygram/features/chat/domain/models/message.dart';

abstract class IChatRepository {
  Future<List<Message>> readAll(String chatId);
}
