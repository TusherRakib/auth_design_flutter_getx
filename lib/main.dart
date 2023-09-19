import 'package:auth_design_flutter_getx/utils/app_colors.dart';
import 'package:auth_design_flutter_getx/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes/routes.dart';
import 'app_routes/routes_path.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: AppColors.colorPrimary,
      theme: AppTheme.lightTheme(),
      getPages: Routes.routes,
      initialRoute: RoutesPath.splashView,
      debugShowCheckedModeBanner: false,
    );
  }
}
