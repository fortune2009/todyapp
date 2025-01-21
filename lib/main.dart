import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todyapp/core/main_router.dart';

import 'core/bottom_nav_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360.0, 772.0),
      builder: (context, Widget? child) => MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider(create: (_) => BottomNavModel()),
          // ChangeNotifierProvider(create: (_) => LoyaltyPointsViewModel()),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          useInheritedMediaQuery: true,
          title: 'Tody ',
          debugShowCheckedModeBanner: false,
          // home: const SplashScreen(),
          onGenerateRoute: MainRouter.generateRoute,
          theme: ThemeData(
            fontFamily: 'SF Pro Display',
          ),
        ),
      ),
    );
  }
}
