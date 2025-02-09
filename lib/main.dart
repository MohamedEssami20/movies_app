import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) {
          return const MoviesApp();
        }),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: SplashView(),
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        );
      },
    );
  }
}
