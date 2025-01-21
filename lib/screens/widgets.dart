import 'package:todyapp/utils/all_packages.dart';

Widget addNewTask(
    {BuildContext? context,
    TextEditingController? titleController,
    TextEditingController? descriptionController}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    child: Column(children: [
      CustomTextFormField(
        hintText: "eg : Meeting with client",
        controller: titleController,
      ),
      CustomTextFormField(
        hintText: "Description",
        controller: descriptionController,
      ),
      HSpace(32.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(SvgAssets.directInbox),
              WSpace(14.w),
              SvgPicture.asset(SvgAssets.calendar),
              WSpace(14.w),
              SvgPicture.asset(SvgAssets.clock),
              WSpace(14.w),
              SvgPicture.asset(SvgAssets.flag),
            ],
          ),
          GestureDetector(
            onTap: () {
              navPop(context!);
              HapticFeedback.lightImpact();
            },
            child: SizedBox(
                width: 30.w,
                height: 20.h,
                child: SvgPicture.asset(SvgAssets.send)),
          ),
        ],
      )
    ]),
  );
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText, this.controller});
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.greyHintText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),
        labelStyle: TextStyle(
            color: AppColors.darkText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
      ),
    );
  }
}
