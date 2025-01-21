import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todyapp/core/bottom_nav_model.dart';
import 'package:todyapp/utils/styles.dart';

import 'package:todyapp/utils/all_packages.dart';

class BottomNav extends StatefulWidget {
  final bool? showProviderProfile;

  const BottomNav({Key? key, this.showProviderProfile}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }
}

class _BottomNav extends State<BottomNav> {
  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Styles.regular('Exit App',
                fontSize: 14.sp, color: AppColors.darkText),
            content: Styles.regular('Do you want to exit an App?',
                fontSize: 14.sp, color: AppColors.darkText),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Styles.regular('No',
                    fontSize: 14.sp, color: AppColors.darkText),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Styles.regular('Yes',
                    fontSize: 14.sp, color: AppColors.darkText),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavModel>(builder: (context, model, child) {
      return WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          backgroundColor: AppColors.white,
          // drawer: customDrawer(context, drawerKey: homeKey, model),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) => model.updateIndex(index, context),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryColor,
              selectedLabelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
              unselectedLabelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
              backgroundColor: AppColors.white,
              currentIndex: model.currentIndex,
              items: userBottomTabItems(context)),
          body: SizedBox(
              height: deviceHeight(context).h,
              width: deviceWidth(context).w,
              child: model.children[model.currentIndex]),
        ),
      );
    });
  }

  userBottomTabItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            SvgAssets.homeActive,
          ),
          icon: SvgPicture.asset(
            SvgAssets.home,
          ),
          label: ""),
      BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            SvgAssets.directInboxActive,
          ),
          icon: SvgPicture.asset(
            SvgAssets.directInbox,
          ),
          label: ""),
      BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            SvgAssets.calendar,
            color: AppColors.primaryColor,
          ),
          icon: SvgPicture.asset(
            SvgAssets.calendar,
          ),
          label: ""),
      BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            SvgAssets.category,
            color: AppColors.primaryColor,
          ),
          icon: SvgPicture.asset(
            SvgAssets.category,
          ),
          label: ""),
      BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            SvgAssets.filePlus,
            color: AppColors.primaryColor,
          ),
          icon: SvgPicture.asset(
            SvgAssets.filePlus,
          ),
          label: ""),
    ];
  }
}
