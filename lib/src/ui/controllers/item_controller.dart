import 'package:flutter/cupertino.dart';

import '../../src.dart';

class ItemController {
  final ItemServices _services = ItemServices.instance;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> create() async {
    await _services.create(
      listId: '1',
      title: titleController.text,
      description: descriptionController.text,
    );
  }
}
