import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/utility/helper/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/my_string.dart';
import 'package:todoapp/feature/todo/logic/cubit/task_cubit.dart';
import 'package:todoapp/feature/todo/widgets/custom_reg_text_field.dart';
import 'package:todoapp/feature/todo/widgets/custom_date_time_selection.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';

class CustomAddTask extends StatelessWidget {
  const CustomAddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var cubit = context.watch<TaskCubit>();

    return SizedBox(
      width: double.infinity,
      height: 530.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Text(
              MyStrings.titleOfTitleTextField,
              style: textTheme.headlineMedium,
            ),
          ),
          CustomRegTextFormField(
            controller: cubit.titleController,
            onChanged: (String inputTitle) {
              cubit.title = inputTitle;
            },
            onFieldSubmitted: (String inputTitle) {
              cubit.title = inputTitle;
            },
          ),
          verticalSpace(10),
          CustomRegTextFormField(
            controller: cubit.descriptionController,
            isForDescription: true,
            onChanged: (String inputSubTitle) {
              cubit.subTitle = inputSubTitle;
            },
            onFieldSubmitted: (String inputSubTitle) {
              cubit.subTitle = inputSubTitle;
            },
          ),
          CustomDateTimeSelection(
            onTap: () {
              showBottomSheet(
                context: context,
                builder: (_) => SizedBox(
                  height: 270.h,
                  child: TimePickerWidget(
                    initDateTime: cubit.showDateAsDateTime(cubit.time),
                    onChange: (_, __) {},
                    dateFormat: 'HH:mm',
                    onConfirm: (dateTime, _) {
                      cubit.updateTime(dateTime);
                    },
                  ),
                ),
              );
            },
            title: MyStrings.timeString,
            time: cubit.showTime(cubit.time),
          ),
          CustomDateTimeSelection(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                maxDateTime: DateTime(2050, 12, 31),
                minDateTime: DateTime.now(),
                initialDateTime: cubit.showDateAsDateTime(cubit.date),
                onConfirm: (dateTime, _) {
                  cubit.updateDate(dateTime);
                },
              );
            },
            isTime: true,
            title: MyStrings.dateString,
            time: cubit.showDate(cubit.date),
          ),
          verticalSpace(50),
        ],
      ),
    );
  }
}

