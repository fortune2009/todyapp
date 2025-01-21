import 'package:todyapp/utils/all_packages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styles.medium("Today",
                        color: AppColors.darkText, fontSize: 24.sp),
                    Styles.regular("Best platform for creating to-do lists",
                        color: AppColors.defaultGrey, fontSize: 14.sp),
                  ],
                ),
                SvgPicture.asset(SvgAssets.setting)
              ],
            ),
            HSpace(24.h),
            Container(
              padding: EdgeInsets.only(top: 36.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.primaryColor),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: const BoxDecoration(color: AppColors.white),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return addNewTask(context: context);
                            });
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(SvgAssets.plus),
                          WSpace(12.w),
                          Styles.semiBold("Tap plus to create a new task",
                              color: AppColors.darkText, fontSize: 16.sp),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.dividerLine,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Styles.regular("Add your task",
                            color: AppColors.defaultGrey, fontSize: 12.sp),
                        Styles.regular("Today. Mon 20 Jul 2022",
                            color: AppColors.defaultGrey, fontSize: 12.sp),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
