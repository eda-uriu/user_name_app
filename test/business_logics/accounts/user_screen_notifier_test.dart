import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:user_name_app/business_logics/accounts/user_screen_notifier.dart';
import 'package:user_name_app/models/accounts/user.dart';
import 'package:user_name_app/repositories/accounts/user_repository.dart';

@GenerateNiceMocks([MockSpec<UserRepository>()])
import 'user_screen_notifier_test.mocks.dart';

void main() {
  group('UserScreenNotifier 単体テスト', () {
    // TODO: mockitoで生成された、モックオブジェクトを使用すること
    final mockUserRepository = MockUserRepository();
    final userScreenNotifier = UserScreenNotifier(mockUserRepository);

    test('getUserNameメソッド -- ユーザデータ利用可能な場合', () async {
      // Arrange
      final expectedUser = User('user123', 'David');
      when(mockUserRepository.getUser('user123')).thenAnswer((_) async => expectedUser);

      // Act
      final userName = await userScreenNotifier.getUserName('user123');

      // Assert
      expect(userName, 'David');
      verify(mockUserRepository.getUser('user123')).called(1);
    });

    test('getUserNameメソッド -- ユーザデータ利用不可の場合', () async {
      const errorMessage = 'Error: Unable to fetch user name';

      // Arrange
      when(mockUserRepository.getUser('user123')).thenThrow(Exception('User not found'));

      // Act
      final userName = await userScreenNotifier.getUserName('user123');

      // Assert
      expect(userName, errorMessage);
      verify(mockUserRepository.getUser('user123')).called(1);
    });
  });
}
