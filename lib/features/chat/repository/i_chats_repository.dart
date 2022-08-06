import 'package:tinygram/features/chat/domain/models/chat.dart';

abstract class IChatsRepository {
  Future<List<Chat>> readAll();
}
