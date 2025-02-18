//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/func/on_generate_route.dart';
import 'features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';

void main() {
  runApp(
    const MoviesApp(),
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            onGenerateRoute: onGenerateRoute,
            theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
              scaffoldBackgroundColor: Color(0xFF34344A),
            ),
          ),
        );
      },
    );
  }
}
