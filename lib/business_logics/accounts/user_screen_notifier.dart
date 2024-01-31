import 'package:user_name_app/models/accounts/user.dart';
import 'package:user_name_app/repositories/accounts/user_repository.dart';

class UserScreenNotifier {
  final UserRepository _userRepository;

  UserScreenNotifier(this._userRepository);

  Future<String> getUserName(String userId) async {
    try {
      User user = await _userRepository.getUser(userId);
      return user.name;
    } catch (e) {
      // エラーハンドリング
      return 'Error: Unable to fetch user name';
    }
  }
}
