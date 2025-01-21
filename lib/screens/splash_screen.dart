import 'package:todyapp/utils/all_packages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _startTimer(RoutePaths.homePage);
    super.initState();
  }

  _startTimer(routeName) {
    const duration = Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacementNamed(context, routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          children: [
            // Positioned.fill(
            //   child: Align(
            //     alignment: Alignment.topCenter,
            //     child: SizedBox(
            //       // decoration: const BoxDecoration(color: AppColors.primaryColor),
            //       width: deviceWidth(context),
            //       height: deviceHeight(context),
            //       child: Container(
            //         width: deviceWidth(context),
            //         decoration: const BoxDecoration(
            //           // color: AppColors.white,
            //           image: DecorationImage(
            //             fit: BoxFit.cover,
            //             image: AssetImage(ImageAssets.splashBG),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 100.h,
              top: 100.h,
              left: 120.h,
              right: 120.h,
              // child: SvgPicture.asset(
              child: Image.asset(
                width: 200.w,
                height: 74.h,
                // SvgAssets.splash,
                ImageAssets.splashLogo,
              ),
            ),
          ],
        ));
  }
}
