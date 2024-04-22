import 'package:get_it/get_it.dart';

import 'media_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<MediaService>(() => MediaService());
}
