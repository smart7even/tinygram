import 'package:dio/dio.dart';
import 'package:tinygram/features/chat/dao/i_chat_dao.dart';
import 'package:tinygram/features/chat/domain/models/message.dart';

class ChatDAO implements IChatDAO {
  final Dio dio;

  ChatDAO({required this.dio});

  @override
  Future<List<Message>> readAll(String chatId) async {
    try {
      final response = await dio.get<List<dynamic>>('/chat/$chatId/message');

      final data = response.data;

      if (data == null) {
        throw Exception('Expected list of messages, got null');
      }

      return data
          .map<Message>(
            (dynamic e) => Message.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } on Exception {
      rethrow;
    }
  }
}
