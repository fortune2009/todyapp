import 'package:todyapp/utils/all_packages.dart';
import 'package:todyapp/utils/styles.dart';

class BottomNav extends StatefulWidget {
  final bool? showProviderProfile;

  const BottomNav({Key? key, this.showProviderProfile}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }
}

class _BottomNav extends State<BottomNav> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        _fetchData(context);
        break;
      default:
        break;
    }
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Styles.regular('Exit App',
                fontSize: 14.sp, color: AppColors.black),
            content: Styles.regular('Do you want to exit an App?',
                fontSize: 14.sp, color: AppColors.black),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Styles.regular('No',
                    fontSize: 14.sp, color: AppColors.black),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Styles.regular('Yes',
                    fontSize: 14.sp, color: AppColors.black),
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
          backgroundColor: AppColors.scaffoldBGColor,
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
                  color: AppColors.primaryBgColor,
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
          color: AppColors.primaryColor,
        ),
        icon: SvgPicture.asset(
          SvgAssets.home,
          color: AppColors.iconGrey,
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          SvgAssets.giftActive,
          color: AppColors.primaryColor,
        ),
        icon: SvgPicture.asset(
          SvgAssets.giftActive,
          color: AppColors.iconGrey,
        ),
        label: "Gift Cards",
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          SvgAssets.loyalty,
          color: AppColors.primaryColor,
        ),
        icon: SvgPicture.asset(
          SvgAssets.loyalty,
          color: AppColors.iconGrey,
        ),
        label: "Loyalty",
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          SvgAssets.transactions,
          color: AppColors.primaryColor,
        ),
        icon: SvgPicture.asset(
          SvgAssets.transactions,
          color: AppColors.iconGrey,
        ),
        label: "Transactions",
      ),
    ];
  }
}
