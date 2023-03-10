import 'package:get/get.dart';
import 'package:ui_task/app/modules/home/bindings/home_binding.dart';
import 'package:ui_task/app/modules/home/views/home_view.dart';
import 'package:ui_task/app/modules/map_screen/bindings/map_screen_binding.dart';
import 'package:ui_task/app/modules/map_screen/views/map_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAP_SCREEN,
      page: () => MapScreenView(),
      binding: MapScreenBinding(),
    ),
  ];
}
