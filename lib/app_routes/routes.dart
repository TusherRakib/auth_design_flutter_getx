import 'package:auth_design_flutter_getx/modules/registration/bindings/registration_bindings.dart';
import 'package:auth_design_flutter_getx/modules/registration/views/registration_view.dart';
import 'package:get/get.dart';
import '../modules/getstarted/bindings/get_started_bindings.dart';
import '../modules/getstarted/views/get_started_view.dart';
import '../modules/home/bindings/home_bindings.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_bindings.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_bindings.dart';
import '../modules/splash/views/splash_view.dart';
import 'routes_path.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesPath.homePage,
      binding: HomeBinding(),
      page: () => const HomeView(),
    ),
    GetPage(
      name: RoutesPath.splashView,
      binding: SplashBinding(),
      page: () => const SplashView(),
    ),
    GetPage(
      name: RoutesPath.getStartedView,
      binding: GetStartedBinding(),
      page: () => const GetStartedView(),
    ),
    GetPage(
      name: RoutesPath.registrationView,
      binding: RegistrationBinding(),
      page: () => RegistrationView(),
    ),
    GetPage(
      name: RoutesPath.logInView,
      binding: LogInBinding(),
      page: () => const LogInView(),
    ),
  ];
}
