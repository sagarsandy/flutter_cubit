import 'package:flutter/material.dart';
import 'package:flutter_cubit/models/user.dart';

class UserDetailsWidget extends StatelessWidget {
  final User userData;

  UserDetailsWidget({this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(userData.fullName),
        Text(userData.email),
        Text(userData.bio),
      ],
    );
  }
}
