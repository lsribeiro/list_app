import 'package:flutter/material.dart';
import 'package:list_app/src/src.dart';
import 'package:list_app/src/ui/views/lists_view.dart';

void main() {
  Config.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageView(
        children: const [
          ListsView(),
          NewItemView(),
        ],
      ),
    );
  }
}
