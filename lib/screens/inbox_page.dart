import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todyapp/models/get_todo_model.dart';
import 'package:todyapp/utils/all_packages.dart';
import 'package:todyapp/view_models/inbox_vm.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => InboxViewModel()..fetchTodos(),
        child: Scaffold(body:
            Consumer<InboxViewModel>(builder: (context, todoProvider, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Stack(
              children: [
                Column(
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
                    HSpace(20.h),
                    todoProvider.isLoading
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: ListView.builder(
                                itemCount: todoProvider.todoItem!.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  Item todo = todoProvider.todoItem![index];
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.only(top: 8.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: todo.isCompleted!
                                              ? AppColors.redText
                                              : AppColors.primaryColor),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        SvgAssets.flagSmall),
                                                    WSpace(4.w),
                                                    Styles.regular(
                                                        "Priority task 1",
                                                        color: AppColors.white,
                                                        fontSize: 12.sp),
                                                  ],
                                                ),
                                                WSpace(12.w),
                                                PopupMenuButton<int>(
                                                  color: AppColors.white,
                                                  onSelected: (item) =>
                                                      handleClick(item, context,
                                                          todo, todoProvider),
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem<int>(
                                                        value: 0,
                                                        child: Styles.regular(
                                                            "Edit",
                                                            color: AppColors
                                                                .darkText)),
                                                    PopupMenuItem<int>(
                                                        value: 1,
                                                        child: Styles.regular(
                                                            "Delete",
                                                            color: AppColors
                                                                .redText)),
                                                  ],
                                                  child: SvgPicture.asset(
                                                      SvgAssets.moreHorizontal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          HSpace(8.h),
                                          GestureDetector(
                                            onTap: () {
                                              todoProvider
                                                  .editTodos(
                                                      id: todo.id,
                                                      title: todo.title,
                                                      description:
                                                          todo.description,
                                                      isCompleted: true)
                                                  .then((value) {
                                                todoProvider.fetchTodos(
                                                    load: false);
                                                HapticFeedback.lightImpact();
                                              });
                                            },
                                            onDoubleTap: () {
                                              todoProvider
                                                  .editTodos(
                                                      id: todo.id,
                                                      title: todo.title,
                                                      description:
                                                          todo.description,
                                                      isCompleted: false)
                                                  .then((value) {
                                                todoProvider.fetchTodos(
                                                    load: false);
                                                HapticFeedback.lightImpact();
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w,
                                                  vertical: 20.h),
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.r),
                                                    bottomRight:
                                                        Radius.circular(8.r)),
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(todo
                                                              .isCompleted!
                                                          ? SvgAssets.completed
                                                          : SvgAssets.priority),
                                                      WSpace(12.w),
                                                      Styles.semiBold(
                                                          "${todo.title}",
                                                          color: AppColors
                                                              .darkText,
                                                          fontSize: 16.sp),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    color:
                                                        AppColors.dividerLine,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(children: [
                                                        SvgPicture.asset(
                                                            SvgAssets.alarm),
                                                        WSpace(2.w),
                                                        Styles.regular(
                                                            // "08:30 PM",
                                                            DateFormat('hh:mm a')
                                                                .format(todo
                                                                    .updatedAt!)
                                                                .toString(),
                                                            color: AppColors
                                                                .redText,
                                                            fontSize: 12.sp),
                                                        WSpace(6.w),
                                                        SvgPicture.asset(
                                                            SvgAssets.chat),
                                                        WSpace(2.w),
                                                        Styles.regular("1",
                                                            color: AppColors
                                                                .defaultGrey,
                                                            fontSize: 12.sp),
                                                        WSpace(6.w),
                                                        SvgPicture.asset(SvgAssets
                                                            .directInboxSmall),
                                                        WSpace(2.w),
                                                        Styles.regular("2",
                                                            color: AppColors
                                                                .defaultGrey,
                                                            fontSize: 12.sp),
                                                      ]),
                                                      Styles.regular(
                                                          // "Mon, 20 Jul 2022",
                                                          DateFormat(
                                                                  'E, dd MMM yyyy')
                                                              .format(todo
                                                                  .updatedAt!)
                                                              .toString(),
                                                          color: AppColors
                                                              .defaultGrey,
                                                          fontSize: 12.sp),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                  ],
                ),
                Positioned(
                  bottom: 15.h,
                  right: 0.w,
                  child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return addNewTask(
                                  context: context,
                                  titleController: todoProvider.titleController,
                                  descriptionController:
                                      todoProvider.descriptionController,
                                  onTap: () {
                                    todoProvider.addTodos().then((value) {
                                      todoProvider.fetchTodos();
                                      HapticFeedback.lightImpact();
                                    });
                                    navPop(context);
                                  });
                            });
                      },
                      child: SvgPicture.asset(SvgAssets.add)),
                )
              ],
            ),
          );
        })));
  }

  void handleClick(
      int item, BuildContext context, Item todo, InboxViewModel viewModel) {
    switch (item) {
      case 0:
        showModalBottomSheet(
            context: context,
            builder: (context) {
              TextEditingController titleController = TextEditingController();
              TextEditingController descriptionController =
                  TextEditingController();
              titleController.value = TextEditingValue(text: todo.title!);
              descriptionController.value =
                  TextEditingValue(text: todo.description!);
              return addNewTask(
                  context: context,
                  titleController: titleController,
                  descriptionController: descriptionController,
                  onTap: () {
                    viewModel
                        .editTodos(
                            id: todo.id,
                            title: titleController.text,
                            description: descriptionController.text)
                        .then((value) {
                      viewModel.fetchTodos();
                      HapticFeedback.lightImpact();
                    });
                    navPop(context);
                  });
            });
        break;
      case 1:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.defaultGrey,
            content: Text("Do you want to delete ${todo.title}"),
            action: SnackBarAction(
              label: "Yes",
              textColor: Colors.white,
              backgroundColor: AppColors.redText,
              onPressed: () {
                viewModel.deleteTodos(id: todo.id).then((value) {
                  viewModel.fetchTodos();
                  HapticFeedback.lightImpact();
                });
              },
            ),
          ),
        );

        break;
    }
  }
}
