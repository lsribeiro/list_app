import 'package:flutter/material.dart';
import 'package:list_app/src/src.dart';

void main() async {
  Config.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Config.initFirebase();
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
      routes: {
        '/new_list': (context) => NewListView(),
        '/list_view': (context) => const ListsView(),
      },
      home: HomeView(),
    );
  }
}
