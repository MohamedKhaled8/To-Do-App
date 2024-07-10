import 'package:flutter/material.dart';
import 'package:todoapp/base_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:todoapp/core/utility/helper/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/helper/extensions.dart';
import 'package:todoapp/core/utility/constant/my_string.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';

emptyWarning(BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);

  fToast.showToast(
    child: Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
        color: Colors.redAccent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            MyStrings.oopsMesg,
            style: TextStyle(fontSize: 18.sp, color: ColorsManger.white),
          ),
          verticalSpace(5),
          Text(
            "You Must fill all fields!",
            style: TextStyle(fontSize: 14.sp, color: ColorsManger.white),
          ),
        ],
      ),
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

void updateTaskWarning(BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);

  fToast.showToast(
    child: Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
        color: Colors.redAccent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            MyStrings.oopsMesg,
            style: TextStyle(fontSize: 18.sp, color: ColorsManger.white),
          ),
          verticalSpace(5),
          Text(
            "You must edit the task to update it!",
            style: TextStyle(fontSize: 14.sp, color: ColorsManger.white),
          ),
        ],
      ),
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

dynamic noTaskWarning(BuildContext context) {
  PanaraInfoDialog.showAnimatedGrow(
    context,
    title: MyStrings.oopsMesg,
    message:
        "There is no Task For Delete!\n Try adding some and then delete it!",
    buttonText: "Okay",
    onTapDismiss: () {
      Navigator.of(context).pop();
    },
    panaraDialogType: PanaraDialogType.warning,
  );
}

dynamic deleteAllTask(BuildContext context) {
  return PanaraConfirmDialog.show(context,
      message:
          "Do You really want to delete all task? You will no be able to undo this action!",
      title: MyStrings.areYourSure,
      confirmButtonText: 'Yes',
      cancelButtonText: 'No', onTapCancel: () {
    context.pop();
  }, onTapConfirm: () {
    BaseWidget.of(context).dataStore.box.clear();
    context.pop();
  }, 
  barrierDismissible: false,
  panaraDialogType: PanaraDialogType.error);
  
  
}
