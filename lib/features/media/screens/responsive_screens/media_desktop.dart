import 'package:ecommerce_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin/features/media/screens/widgets/media_content.dart';
import 'package:ecommerce_admin/features/media/screens/widgets/media_uploader.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../controllers/media_controller.dart';

class MediaDesktop extends StatelessWidget {
  const MediaDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BreadcrumbWithHeading(heading: 'Media', breadcrumbItems: ['Media'], returnToPreviousScreen: true),

                  SizedBox(
                    width: TSizes.buttonWidth * 1.5,
                    child: ElevatedButton.icon(
                        onPressed: () => controller.showImagesUploaderSection.value = !controller.showImagesUploaderSection.value,
                        label: const Text('Upload Images'),
                      icon: const Icon(Iconsax.cloud_add),
                    ),
                  )
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              const MediaUploader(),
              const SizedBox(height: TSizes.spaceBtwSections),

              MediaContent(allowSelection: false, allowMultipleSelection: false),
            ],
          ),
        ),
      ),
    );
  }
}
