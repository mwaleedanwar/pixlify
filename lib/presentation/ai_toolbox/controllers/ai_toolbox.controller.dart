import 'package:get/get.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';

class AiToolboxController extends GetxController {
  // TODO: ADD ALL ROUTES.
  final tools = <ToolboxItem>[
    ToolboxItem(
      title: 'AI Avatar Generator',
      description: 'Turn your photo or selfie into an AI avatar',
      image: Images.AiAvatarGenThumb,
      route: Routes.AI_AVATAR_GENERATOR,
    ),
    ToolboxItem(
      title: 'AI Photo Generator',
      description: 'Create multiple variations from a single photo',
      image: Images.AiPhotoGenThumb,
      route: Routes.AI_PHOTO_GENERATOR,
    ),
    ToolboxItem(
      title: 'AI Magic Eraser Photo',
      description: 'Remove unwanted objects from a photo in just one tap',
      image: Images.AiMagicEraseThumb,
      route: Routes.AI_MAGIC_ERASE,
    ),
    ToolboxItem(
      title: 'AI Background Remover',
      description: 'Remove background from a photo in just one click',
      image: Images.AiBgEraseThumb,
      route: Routes.AI_BG_REMOVER,
    ),
    ToolboxItem(
      title: 'AI Photo Recoloring',
      description: 'Change the color of the image with a variety of styles',
      image: Images.AiPhotoRecolorThumb,
      route: Routes.AI_PHOTO_RECOLOR,
    ),
    ToolboxItem(
      title: 'AI Old Photo Restoration',
      description: 'Enhance the quality of old photos so they look great',
      image: Images.AiOldPhotoRestoreThumb,
      route: Routes.AI_OLD_PHOTO_RESTORE,
    ),
    ToolboxItem(
      title: 'AI Old Photo Colorization',
      description: 'Colorize an old photo so it looks more alive',
      image: Images.AiOldPhotoColorThumb,
      route: Routes.AI_OLD_PHOTO_RECOLOR,
    ),
    ToolboxItem(
      title: 'Extend Images',
      description: 'Change the aspect ratio of your image with one click',
      image: Images.ExtendImageThumb,
      route: Routes.AI_EXTEND_IMAGE,
    ),
    ToolboxItem(
      title: 'Batch Enhance',
      description: 'Enhance a batch of photos at once in one tap',
      image: Images.BatchEnhanceThumb,
      route: Routes.AI_BATCH_ENAHNCE,
    ),
  ];
}

class ToolboxItem {
  final String title;
  final String description;
  final String image;
  final String route;
  ToolboxItem({
    required this.title,
    required this.description,
    required this.image,
    required this.route,
  });
}
