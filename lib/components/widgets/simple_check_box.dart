import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixlify/components/colors/app_colors.dart';

// ignore: must_be_immutable
class SimpleCheckBox extends StatefulWidget {
  SimpleCheckBox({required this.checked, super.key});
  bool checked;

  @override
  State<SimpleCheckBox> createState() => _SimpleCheckBoxState();
}

class _SimpleCheckBoxState extends State<SimpleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox.adaptive(
        activeColor: AppColors.kPrimary,
        checkColor: AppColors.kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(
          color: AppColors.kPrimary,
          width: 2.75.w,
        ),
        value: widget.checked,
        onChanged: (checked) {
          setState(() {
            widget.checked = checked ?? false;
          });
        },
      ),
    );
  }
}
