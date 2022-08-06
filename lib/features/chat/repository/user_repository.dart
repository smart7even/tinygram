import 'package:tinygram/features/chat/domain/models/app_user.dart';
import 'package:tinygram/features/chat/repository/i_user_repository.dart';

class UserRepository extends IUserRepository {
  final AppUser user;

  UserRepository({required this.user});

  @override
  AppUser getUser() {
    return user;
  }
}
