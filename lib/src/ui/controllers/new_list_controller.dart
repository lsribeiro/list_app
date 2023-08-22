import 'package:flutter/cupertino.dart';
import 'package:list_app/src/src.dart';

class NewListController {
  final TextEditingController listNameController = TextEditingController();
  final ListServices listServices = ListServices.instance;

  Future<void> create(BuildContext context) async {
    final result = await listServices.create(name: listNameController.text);
    final list = result.fold((l) => null, (r) => r);
    if (list != null) {
      Navigator.pushNamed(context, '/list_view', arguments: list);
    }
  }
}
