import 'package:flutter/cupertino.dart';
import 'package:list_app/src/src.dart';

class ListController {
  final ListServices _services = ListServices.instance;

  final ValueNotifier<ListEntity?> list = ValueNotifier(null);

  Future<void> fetchList() async {
    final result = await _services.fetch(id: '1');

    result.fold(
      (l) => list.value = null,
      (r) => list.value = r,
    );

    list.notifyListeners();
  }

  Future<void> createList() async {
    final result = await _services.create();

    result.fold(
      (l) => list.value = null,
      (r) => list.value = r,
    );

    list.notifyListeners();
  }
}
