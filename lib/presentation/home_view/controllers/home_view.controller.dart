import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';

class HomeViewController extends GetxController {
  List<File> get recentImages => _recentImages.value;
  bool get loading => _loading.value;
  bool get error => _error.value;
  int get selectedOptionIndex => _selectedOptionIndex.value;
  set selectedOptionIndex(int value) => _selectedOptionIndex.value = value;
  Rx<List<File>> _recentImages = Rx<List<File>>([]);
  RxBool _loading = true.obs;
  RxBool _error = false.obs;
  final scrollController = ScrollController();
  RxInt _selectedOptionIndex = 0.obs;
  File? selectedImage;

  @override
  void onInit() {
    getImagesFromPhone();
    super.onInit();
  }

  void updateOptionIndex(int index) {
    _selectedOptionIndex.value = index;
    update();
  }

  void getImagesFromPhone() async {
    final permissions = await _promptPermissionSetting();
    if (!permissions) {
      _loading.value = false;
      _error.value = true;
      return;
    }
    final albums = await PhotoGallery.listAlbums(mediumType: MediumType.image);
    final imagePage = await albums.first.listMedia(
      take: 30,
    );
    final images = imagePage.items;
    for (var image in images) {
      final file = await image.getFile();
      _recentImages.value.add(file);
    }
    _loading.value = false;
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS) {
      if (await Permission.storage.request().isGranted) {
        return true;
      }
    }
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted &&
          await Permission.photos.request().isGranted) {
        return true;
      }
      if (await Permission.storage.isPermanentlyDenied ||
          await Permission.photos.isPermanentlyDenied) {
        await openAppSettings();
      }
    }
    return false;
  }

  final saveOptioons = <SaveOption>[
    SaveOption(
      resolution: '400 x 600',
      isPro: false,
    ),
    SaveOption(
      resolution: ' 800 x 1200',
      isPro: false,
    ),
    SaveOption(
      resolution: '1600 x 2400',
      isPro: true,
    ),
    SaveOption(
      resolution: '2000 x 3000',
      isPro: true,
    ),
    SaveOption(
      resolution: '4000 x 6000',
      isPro: true,
    ),
  ];
}

class SaveOption {
  final String resolution;
  final bool isPro;
  SaveOption({
    required this.resolution,
    required this.isPro,
  });
}
