import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/dependency_injection/dependency_injection.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInjection();
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
