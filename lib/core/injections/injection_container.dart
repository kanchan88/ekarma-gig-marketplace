import 'dart:async';

import 'package:get_it/get_it.dart';

import 'auth_injection.dart';

var getIt = GetIt.instance;

FutureOr<void> injectionInit() async {
  await authInjectionInit();


  //! Common

}
