import 'package:count_champ/models/testing/user.dart';

class UserService {
  late User _user;
  User get user => _user;

  setUser(User user) {
    _user = user;
  }
}