import 'package:tinygram/features/auth/dao/i_auth_dao.dart';
import 'package:tinygram/features/auth/repository/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDAO authDAO;

  AuthRepository({
    required this.authDAO,
  });

  @override
  Future<String> getAppToken(String firebaseToken) {
    return authDAO.getAppToken(firebaseToken);
  }
}
