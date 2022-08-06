import 'package:tinygram/features/chat/domain/models/chat.dart';

abstract class IChatsDAO {
  Future<List<Chat>> readAll();
}
