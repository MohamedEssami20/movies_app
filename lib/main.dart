//import 'package:device_preview/device_preview.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/func/on_generate_route.dart';
import 'package:movies_app/core/services/get_it_service.dart';
import 'package:movies_app/core/services/shared_pref_service.dart';
import 'package:movies_app/core/utils/bloc_observer.dart';
import 'package:movies_app/firebase_options.dart';
import 'core/cubits/cubit/check_internnet_connection_cubit.dart';
import 'core/services/hive_service.dart';
import 'features/auth/domain/repos/auth_repos.dart';
import 'features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefService().init();
  await HiveService.init();
  setupGetIt();
  runApp(
    DevicePreview(
      builder: (context) => MoviesApp(),
      enabled: true,
    ),
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
              create: (context) => AuthCubit(
                getIt.get<AuthRepos>(),
              ),
            ),
            BlocProvider(
              create: (context) => InternetConnectionCubit(
                Connectivity(),
              )..checkInternetConnection(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
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
