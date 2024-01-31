import 'package:flutter_test/flutter_test.dart';
import 'package:user_name_app/models/accounts/user.dart';


void main() {
  group('UserScreenNotifier 単体テスト', () {
    // TODO: mockitoで生成された、モックオブジェクトを使用すること
    // final mockUserRepository = MockUserRepository();
    // final userScreenNotifier = UserScreenNotifier(mockUserRepository);

    test('getUserNameメソッド -- ユーザデータ利用可能な場合', () async {
      // Arrange
      final expectedUser = User('user123', 'David');

      // Act

      // Assert
      // TODO: [確認項目] 受け取ったユーザネームが期待値と一致していること、getUserメソッドが一度呼ばれていること
    });

    test('getUserNameメソッド -- ユーザデータ利用不可の場合', () async {
      // Arrange
      const errorMessage = 'Error: Unable to fetch user name';

      // Act

      // Assert
      // TODO: [確認項目] 受け取ったユーザネームが期待値と一致していること、getUserメソッドが一度呼ばれていること
    });
  });
}
