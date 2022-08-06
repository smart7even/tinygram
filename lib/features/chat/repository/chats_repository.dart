import 'package:tinygram/features/chat/dao/i_chats_dao.dart';
import 'package:tinygram/features/chat/domain/models/chat.dart';
import 'package:tinygram/features/chat/repository/i_chats_repository.dart';

class ChatsRepository extends IChatsRepository {
  final IChatsDAO chatsDAO;

  ChatsRepository({required this.chatsDAO});

  @override
  Future<List<Chat>> readAll() {
    return chatsDAO.readAll();
  }
}
