import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';

import 'package:pixlify/presentation/ai_toolbox/controllers/ai_toolbox.controller.dart';
import 'package:pixlify/theme.dart';

class AiToolboxScreen extends GetView<AiToolboxController> {
  const AiToolboxScreen({Key? key}) : super(key: key);
  AiToolboxController get controller => Get.put(AiToolboxController());
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SizedBox(
            height: 28.w,
            width: 28.w,
            child: SvgPicture.asset(Images.logo),
          ),
        ),
        title: Text(
          'AI Toolbox',
          style: AppTypography.h4Bold.copyWith(
            color: theme.primaryTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: controller.tools.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: theme.primaryDividerColor,
          thickness: 1.w,
        ),
        itemBuilder: (BuildContext context, int index) => ToolboxTile(
          toolboxItem: controller.tools[index],
        ),
      ),
    );
  }
}

class ToolboxTile extends StatelessWidget {
  const ToolboxTile({
    required this.toolboxItem,
    super.key,
  });
  final ToolboxItem toolboxItem;
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(toolboxItem.route);
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          toolboxItem.image,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        toolboxItem.title,
        style: AppTypography.h5Bold.copyWith(
          color: theme.primaryTextColor,
        ),
      ),
      subtitle: Text(
        toolboxItem.description,
        style: AppTypography.BodyMRegular.copyWith(
          color: theme.primaryTextColor,
        ),
      ),
      trailing: Icon(
        IconlyLight.arrow_right_2,
        color: theme.defaultIconColor,
        size: 24.w,
      ),
    );
  }
}
