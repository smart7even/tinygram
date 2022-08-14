abstract class IAuthDAO {
  Future<String> getAppToken(String firebaseToken);
}
