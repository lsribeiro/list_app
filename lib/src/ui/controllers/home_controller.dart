import 'package:flutter/cupertino.dart';
import 'package:list_app/src/src.dart';

class HomeController {
  final TextEditingController usernameController = TextEditingController();
  final UserServices _userServices = UserServices.instance;

  Future<void> login(BuildContext context) async {
    final loginResult = await _userServices.login(username: usernameController.text);
    final user = loginResult.fold((l) => null, (r) => r);
    if (user != null) {
      Navigator.pushNamed(context, '/new_list');
    }
  }
}
