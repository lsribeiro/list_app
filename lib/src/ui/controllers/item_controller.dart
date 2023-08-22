import 'package:flutter/cupertino.dart';

import '../../src.dart';

class ItemController {
  final ItemServices _services = ItemServices.instance;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> create({required String listId}) async {
    await _services.create(
      listId: listId,
      title: titleController.text,
      description: descriptionController.text,
    );
  }
}
