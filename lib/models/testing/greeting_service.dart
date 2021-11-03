import 'package:count_champ/models/testing/user_service.dart';
import 'package:flutter/foundation.dart';

class GreetingService {
  GreetingService(this._userService, {@required userService});

  final UserService _userService;

  String ? get greeting => "Hello, ${_userService.user.username}";
}