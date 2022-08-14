abstract class IAuthRepository {
  Future<String> getAppToken(String firebaseToken);
}
