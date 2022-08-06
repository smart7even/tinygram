import 'package:tinygram/features/chat/domain/models/app_user.dart';

abstract class IUserRepository {
  AppUser getUser();
}
