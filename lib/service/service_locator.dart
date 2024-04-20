import 'package:get_it/get_it.dart';
import 'package:scanImage/service/media_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<MediaService>(() => MediaService());
}
