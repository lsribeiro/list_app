import 'package:flutter/material.dart';
import 'package:list_app/src/src.dart';

class NewListView extends StatelessWidget {
  NewListView({super.key});

  final controller = NewListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create your list',
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                fontSize: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: TextField(
                controller: controller.listNameController,
                decoration: const InputDecoration(hintText: 'List name'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () => controller.create(context),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
