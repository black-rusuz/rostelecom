import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() async => $initGetIt(sl);

@module
abstract class RegisterModule {
  @Singleton()
  Dio get client => Dio();
}
