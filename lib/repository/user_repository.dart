import 'dart:math';

import 'package:flutter_cubit/models/user.dart';

abstract class UserRepository {
  Future<User> fetchUserData();
}

class UserDataRepository implements UserRepository {
  @override
  Future<User> fetchUserData() {
    return Future.delayed(Duration(seconds: 1), () {
      final random = Random();
      if (random.nextBool()) {
        throw NetworkException();
      }

      return User(
        fullName: "Sagar Sandy",
        email: "abc@gmail.com",
        bio: "Mobile and web application developer",
      );
    });
  }
}

class NetworkException implements Exception {}
