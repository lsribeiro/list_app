import 'package:flutter/material.dart';
import 'package:list_app/src/src.dart';

class NewItemView extends StatefulWidget {
  const NewItemView({super.key});

  @override
  State<NewItemView> createState() => _NewItemViewState();
}

class _NewItemViewState extends State<NewItemView> {
  final ItemController controller = ItemController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            MaterialButton(
                color: Colors.grey,
                child: const Text('Create Item'),
                onPressed: () {
                  controller.create();
                }),
          ],
        ),
      ),
    );
  }
}
