import 'package:ecommerce_admin/common/widgets/images/image_uploader.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';

class ProductAdditionalImages extends StatelessWidget {
  const ProductAdditionalImages({super.key, required this.additionalProductImagesURLs, this.onTapToAddImages, this.onTapToRemoveImage});

  final RxList<String> additionalProductImagesURLs;
  final void Function()? onTapToAddImages;
  final void Function(int index)? onTapToRemoveImage;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 380,
        child: Column(
          children: [
// Section to Add Additional Product Images
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: onTapToAddImages,
                child: TRoundedContainer(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(TImages.defaultMultiImageIcon, width: 58, height: 56),
                        const Text('Add Additional Product Images'),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Section to Display Uploaded Images
            Expanded(
              child: Row(
                children: [
                  Expanded(flex: 2, child: SizedBox(height: 80, child: _uploadedImagesOrEmptyList())),
                  const SizedBox(width: TSizes.spaceBtwItems / 2),
                  // Add More Images Button
                  TRoundedContainer(
                    width: 80,
                    height: 80,
                    showBorder: true,
                    borderColor: TColors.grey,
                    backgroundColor: TColors.white,
                    onTap: onTapToAddImages,
                    child: const Center(child: Icon(Iconsax.add)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _uploadedImagesOrEmptyList() {
    return additionalProductImagesURLs.isNotEmpty ? _uploadedImages() : emptyList();
  }

  Widget emptyList() {
    return ListView.separated(
      itemBuilder: (context, index) => const TRoundedContainer(backgroundColor: TColors.primaryBackground, width: 80, height: 80),
      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems / 2),
      itemCount: 6,
      scrollDirection: Axis.horizontal,
    );
  }

  ListView _uploadedImages() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems / 2),
      itemCount: additionalProductImagesURLs.length,
      itemBuilder: (context, index) {
        final image = additionalProductImagesURLs[index];
        return TImageUploader(
          top: 0,
          right: 0,
          width: 80,
          height: 80,
          left: null,
          bottom: null,
          imageType: ImageType.network,
          image: image,
          icon: Iconsax.trash,
          onIconButtonPressed: () => onTapToRemoveImage!(index),
        );
      },
    );
  }
}
