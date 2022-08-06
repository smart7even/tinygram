import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tinygram/features/chat/dao/i_chats_dao.dart';
import 'package:tinygram/features/chat/domain/models/chat.dart';

class ChatsDAO extends IChatsDAO {
  final Dio dio;

  ChatsDAO({required this.dio});

  @override
  Future<List<Chat>> readAll() async {
    try {
      final response = await dio.get<List<dynamic>>('/chat');

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null) {
          return data
              .map<Chat>(
                (dynamic e) => Chat.fromJson(e as Map<String, dynamic>),
              )
              .toList();
        }
      }

      return [];
    } on Exception {
      rethrow;
    }
  }
}
