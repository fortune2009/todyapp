import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todyapp/utils/all_packages.dart';
import 'package:todyapp/view_models/home_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Scaffold(
          body:
              Consumer<HomeViewModel>(builder: (context, todoProvider, child) {
            return Padding(
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
                          Styles.regular(
                              "Best platform for creating to-do lists",
                              color: AppColors.defaultGrey,
                              fontSize: 14.sp),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.r),
                            bottomRight: Radius.circular(8.r)),
                      ),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  enableDrag: true,
                                  // isScrollControlled: true,
                                  builder: (context) {
                                    return addNewTask(
                                        context: context,
                                        titleController:
                                            todoProvider.titleController,
                                        descriptionController:
                                            todoProvider.descriptionController,
                                        onTap: () {
                                          todoProvider.addTodos().then((value) {
                                            HapticFeedback.lightImpact();
                                          });
                                          navPop(context);
                                        });
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
                                  color: AppColors.defaultGrey,
                                  fontSize: 12.sp),
                              Styles.regular(
                                  DateFormat('E, dd MMM yyyy')
                                      .format(DateTime.now())
                                      .toString(),
                                  color: AppColors.defaultGrey,
                                  fontSize: 12.sp),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ));
  }
}
