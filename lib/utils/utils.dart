import 'package:todyapp/utils/all_packages.dart';

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

navPush(BuildContext context, String route) {
  Navigator.push(context, MainRouter.generateRoute(RouteSettings(name: route)));
}

navPushReplace(BuildContext context, String route) {
  Navigator.pushReplacement(
      context, MainRouter.generateRoute(RouteSettings(name: route)));
}

navPop(BuildContext context) {
  Navigator.pop(context);
}
