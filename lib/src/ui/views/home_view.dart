import 'package:flutter/material.dart';

import '../../src.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ToDo List App',
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                fontSize: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: TextField(
                controller: controller.usernameController,
                decoration: const InputDecoration(hintText: 'username'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () {
                  controller.login(context);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
