import 'package:flutter/material.dart';
import 'package:user_name_app/business_logics/accounts/user_screen_notifier.dart';
import 'package:user_name_app/repositories/accounts/user_repository.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {
  final UserRepository userRepository = UserRepository();
  final UserScreenNotifier userManager = UserScreenNotifier(UserRepository());

  String userName = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      const userId = 'user123'; // 仮のユーザーID
      final name = await userManager.getUserName(userId);
      setState(() {
        userName = name;
      });
    } catch (e) {
      print('Error fetching user data: $e');
      setState(() {
        userName = 'Error: Unable to fetch user name';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Manager App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'User Name:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              userName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
