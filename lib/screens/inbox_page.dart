import 'package:todyapp/utils/all_packages.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            HSpace(60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(SvgAssets.back),
                Styles.medium("Inbox",
                    color: AppColors.darkText, fontSize: 18.sp),
                SvgPicture.asset(SvgAssets.search),
              ],
            ),
            HSpace(24.h),
            Container(
              padding: EdgeInsets.only(top: 8.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.primaryColor),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(SvgAssets.flagSmall),
                            WSpace(4.w),
                            Styles.regular("Priority task 1",
                                color: AppColors.white, fontSize: 12.sp),
                          ],
                        ),
                        WSpace(12.w),
                        SvgPicture.asset(SvgAssets.moreHorizontal),
                      ],
                    ),
                  ),
                  HSpace(8.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    decoration: const BoxDecoration(color: AppColors.white),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(SvgAssets.priority),
                            WSpace(12.w),
                            Styles.semiBold("Masyla Website Project",
                                color: AppColors.darkText, fontSize: 16.sp),
                          ],
                        ),
                        const Divider(
                          color: AppColors.dividerLine,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(SvgAssets.priority),
                            Styles.regular("Add your task",
                                color: AppColors.defaultGrey, fontSize: 12.sp),
                            Styles.regular("Mon 20 Jul 2022",
                                color: AppColors.defaultGrey, fontSize: 12.sp),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
