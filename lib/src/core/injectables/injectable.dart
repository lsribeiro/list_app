import 'package:get_it/get_it.dart';

abstract class Injectable {
  final GetIt injector = GetIt.instance;
  void attach();
}
