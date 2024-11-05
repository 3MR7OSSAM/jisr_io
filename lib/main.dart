import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jisr/core/common/helper/notification_service.dart';
import 'package:jisr/core/configs/routing/routes.dart';
import 'package:jisr/core/configs/theme/app_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'core/configs/controller/ButtomNavBar.dart';
import 'core/configs/theme/app_colors.dart';
import 'presentation/settings/bloc/dark_theme_cubit.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await NotificationService.initialize(); // Initialize notifications
  // FirebaseMessaging.onBackgroundMessage(
  //     NotificationService.firebaseMessagingBackgroundHandler);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: AppColors.whiteColor, // Your desired color
    statusBarIconBrightness: Brightness.dark, // Adjust icon brightness
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => BottomNavCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mood) {
          return ScreenUtilInit(
            designSize: const Size(375, 812), // Set to your design's base size
            minTextAdapt: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'Jisr',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.dark,
                themeMode: mood,
                routerConfig: appRouter, // Use the router from app_router.dart
                debugShowCheckedModeBanner: false,
              );
            }
          );
        },
      ),
    );
  }
}
