import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'firebase_options.dart';
import 'router_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          title: AppStrings.appTitle,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            fontFamily: 'Orbitron',
            useMaterial3: false,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
        );
      },
    );
  }
}
