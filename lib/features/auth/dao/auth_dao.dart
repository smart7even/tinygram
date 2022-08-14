import 'package:dio/dio.dart';
import 'package:tinygram/features/auth/dao/i_auth_dao.dart';

class AuthDAO implements IAuthDAO {
  final Dio dio;

  AuthDAO({required this.dio});

  @override
  Future<String> getAppToken(String firebaseToken) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/auth/token',
        options: Options(
          headers: <String, String>{
            'token': firebaseToken,
          },
        ),
      );

      final data = response.data;

      if (data == null) {
        throw ArgumentError();
      }

      return data['token'] as String;
    } on Exception {
      rethrow;
    }
  }
}
