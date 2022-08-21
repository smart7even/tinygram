import 'package:tinygram/features/chat/dao/i_chat_dao.dart';
import 'package:tinygram/features/chat/domain/models/message.dart';
import 'package:tinygram/features/chat/repository/i_chat_repository.dart';

class ChatRepository implements IChatRepository {
  final IChatDAO chatDAO;

  ChatRepository({required this.chatDAO});

  @override
  Future<List<Message>> readAll(String chatId) async {
    return chatDAO.readAll(chatId);
  }

  @override
  Future<void> sendMessage(String chatId, String text) {
    return chatDAO.sendMessage(chatId, text);
  }
}
