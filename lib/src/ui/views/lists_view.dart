import 'package:flutter/material.dart';
import 'package:list_app/src/src.dart';

class ListsView extends StatefulWidget {
  const ListsView({Key? key}) : super(key: key);

  @override
  State<ListsView> createState() => _ListsViewState();
}

class _ListsViewState extends State<ListsView> {
  final ListController _listController = ListController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            _listController.createList();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _listController.fetchList();
            },
          )
        ],
      ),
      body: ValueListenableBuilder<ListEntity?>(
          valueListenable: _listController.list,
          builder: (context, list, _) {
            return ListView(
              children: list != null
                  ? list.items
                      .map<Widget>(
                        (e) => ListTile(title: Text(e.title)),
                      )
                      .toList()
                  : [const SizedBox()],
            );
          }),
    );
  }
}
