import 'package:tinygram/features/chat/dao/chat_dao.dart';
import 'package:tinygram/features/chat/domain/models/message.dart';
import 'package:tinygram/features/chat/repository/i_chat_repository.dart';

class ChatRepository implements IChatRepository {
  final ChatDAO chatDAO;

  ChatRepository({required this.chatDAO});

  @override
  Future<List<Message>> readAll(String chatId) async {
    return chatDAO.readAll(chatId);
  }
}
