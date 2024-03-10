import 'package:flutter_test/flutter_test.dart';
import 'package:user_name_app/models/accounts/user.dart';

void main() {
  group('User 単体テスト', () {
    test('User Modelテスト', () {
      // Arrange
      final user = User('user123', 'John');

      // Act & Assert
      expect(user.id, 'user123');
      expect(user.name, 'John');
    });
  });
}
