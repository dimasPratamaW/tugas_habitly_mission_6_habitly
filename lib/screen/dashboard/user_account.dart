import 'package:flutter/material.dart';

class UserAccount extends StatelessWidget {
  final String email;
  final String password;

  const UserAccount({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle, size: 60),
          const SizedBox(height: 10),
          Text(email),
          const SizedBox(height: 10),
          Text(password),
        ],
      ),
    );
  }
}
