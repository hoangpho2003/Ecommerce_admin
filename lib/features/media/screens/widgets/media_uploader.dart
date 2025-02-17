import 'dart:io';

import 'package:ecommerce_admin/utils/device/device_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' as html;
import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin/features/media/models/image_model.dart';
import 'package:ecommerce_admin/utils/constants/colors.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    bool isMobile = TDeviceUtils.isMobileScreen(context);

    return Obx(
      () => controller.showImagesUploaderSection.value
          ? Column(
              children: [
                /// Drag and Drop area (desktop and web only)
                if (!isMobile)
                  TRoundedContainer(
                    height: 250,
                    showBorder: true,
                    borderColor: TColors.borderPrimary,
                    backgroundColor: TColors.primaryBackground,
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              DropzoneView(
                                mime: const ['image/jpeg', 'image/png'],
                                cursor: CursorType.Default,
                                operation: DragOperation.copy,
                                onLoaded: () => print('Zone loaded'),
                                onError: (ev) => print('Zone error: $ev'),
                                onCreated: (ctrl) => controller.dropzoneViewController = ctrl,
                                onDropInvalid: (ev) => Get.snackbar(
                                  'Invalid File',
                                  'Only JPEG and PNG images are supported.',
                                  snackPosition: SnackPosition.BOTTOM,
                                ),
                                onDrop: (file) async {
                                  if (file is html.File) {
                                    final bytes = await controller.dropzoneViewController.getFileData(file);
                                    final image = ImageModel(
                                      url: '',
                                      folder: '',
                                      filename: file.name,
                                      file: file,
                                      localImageToDisplay: Uint8List.fromList(bytes),
                                    );
                                    controller.selectedImagesToUpload.add(image);
                                  }
                                },
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(TImages.defaultMultiImageIcon, width: 50, height: 50),
                                  const SizedBox(height: TSizes.spaceBtwItems),
                                  const Text('Drag and Drop Images Here'),
                                  const SizedBox(height: TSizes.spaceBtwItems),
                                  OutlinedButton(
                                    onPressed: () => controller.selectLocalImages(),
                                    child: const Text('Select Images'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                else

                  /// File picker for mobile and unsupported platforms
                  TRoundedContainer(
                    height: 250,
                    showBorder: true,
                    borderColor: TColors.borderPrimary,
                    backgroundColor: TColors.primaryBackground,
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(TImages.defaultMultiImageIcon, width: 50, height: 50),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const Text('Select Images from your device'),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        ElevatedButton(
                          onPressed: () async {
                            print('Button pressed!');
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['jpg', 'png'],
                              allowMultiple: true,
                            );
                            if (result != null) {
                              for (var file in result.files) {
                                if (file.path != null) {
                                  final bytes = await File(file.path!).readAsBytes();
                                  final image = ImageModel(
                                    url: '',
                                    folder: '',
                                    filename: file.name,
                                    localImageToDisplay: Uint8List.fromList(bytes),
                                  );
                                  controller.selectedImagesToUpload.add(image);
                                }
                              }
                            } else {
                              print('No file selected');
                            }
                          },
                          child: const Text('Select Images'),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: TSizes.spaceBtwItems),

                /// Locally Selected Images (same as before)
                if (controller.selectedImagesToUpload.isNotEmpty)
                  TRoundedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: () => controller.selectedImagesToUpload.clear(), child: const Text('Remove All')),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            SizedBox(
                                width: TSizes.buttonWidth,
                                child: ElevatedButton(
                                  onPressed: () => controller.uploadImagesConfirmation(),
                                  child: const Text('Upload'),
                                )),
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: TSizes.spaceBtwItems / 2,
                          runSpacing: TSizes.spaceBtwItems / 2,
                          children: controller.selectedImagesToUpload
                              .map((image) => TRoundedImage(
                                    width: 90,
                                    height: 90,
                                    padding: TSizes.sm,
                                    imageType: ImageType.memory,
                                    memoryImage: image.localImageToDisplay,
                                    backgroundColor: TColors.primaryBackground,
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  )
                else
                  Center(child: Text('No images selected')),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
