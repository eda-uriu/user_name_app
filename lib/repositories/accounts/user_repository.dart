import 'package:user_name_app/models/accounts/user.dart';

class UserRepository {
  Future<User> getUser(String userId) async {
    // 本来はAPI呼び出しの処理がここに入ります。
    await Future.delayed(const Duration(seconds: 1));
    return User(userId, 'Zack');
  }
}
