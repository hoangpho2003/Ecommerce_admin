import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/common/widgets/loaders/loader_animation.dart';
import 'package:ecommerce_admin/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin/features/media/models/image_model.dart';
import 'package:ecommerce_admin/features/media/screens/widgets/folder_dropdown.dart';
import 'package:ecommerce_admin/features/media/screens/widgets/view_image_details.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:ecommerce_admin/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class MediaContent extends StatelessWidget {
  MediaContent({
    super.key,
    required this.allowSelection,
    required this.allowMultipleSelection,
    this.alreadySelectedUrls,
    this.onImagesSelected,
  });

  final bool allowSelection;
  final bool allowMultipleSelection;
  final List<String>? alreadySelectedUrls;
  final List<ImageModel> selectedImages = [];
  final Function(List<ImageModel> selectedImages)? onImagesSelected;

  @override
  Widget build(BuildContext context) {
    bool loadedPreviousSelection = false;
    bool isMobile = TDeviceUtils.isMobileScreen(context);
    final controller = MediaController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Select Folder', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  MediaFolderDropdown(
                    onChanged: (MediaCategory? newValue) {
                      if (newValue != null) {
                        controller.selectedPath.value = newValue;
                        controller.getMediaImages();
                      }
                    },
                  ),
                ],
              ),
              if(!isMobile)
                if (allowSelection) buildAddSelectedImagesButton(),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Obx(
            () {
              List<ImageModel> images = _getSelectedFolderImages(controller);
              if(!loadedPreviousSelection){
                if(alreadySelectedUrls != null && alreadySelectedUrls!.isNotEmpty){
                  final selectedUrlSet = Set<String>.from(alreadySelectedUrls!);

                  for(var image in images){
                    image.isSelected.value = selectedUrlSet.contains(image.url);
                    if(image.isSelected.value){
                      selectedImages.add(image);
                    }
                  }
                }else{
                  for(var image in images){
                    image.isSelected.value = false;
                  }
                }
                loadedPreviousSelection = true;
              }
              if (controller.loading.value && images.isEmpty) return const TLoaderAnimation();
              if (images.isEmpty) return _buildEmptyAnimationWidget(context);
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: images
                        .map((image) => GestureDetector(
                              onTap: () => Get.dialog(ImagePopup(image: image)),
                              child: SizedBox(
                                width: 140,
                                height: 180,
                                child: Column(
                                  children: [
                                    allowSelection ? _buildListWithCheckbox(image) : _buildSimpleList(image),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                                        child: Text(image.filename, maxLines: 1, overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  if (!controller.loading.value)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: TSizes.buttonWidth,
                            child: ElevatedButton.icon(
                              onPressed: () => controller.loadMoreMediaImages(),
                              label: const Text('Load More'),
                              icon: const Icon(Iconsax.arrow_down),
                            ),
                          )
                        ],
                      ),
                    )
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(isMobile)
                if (allowSelection) buildAddSelectedImagesButton()
            ],
          )
        ],
      ),
    );
  }

  List<ImageModel> _getSelectedFolderImages(MediaController controller) {
    List<ImageModel> images = [];
    if (controller.selectedPath.value == MediaCategory.banners) {
      images = controller.allBannerImages.where((image) => image.url.isNotEmpty).toList();
    } else if (controller.selectedPath.value == MediaCategory.brands) {
      images = controller.allBrandImages.where((image) => image.url.isNotEmpty).toList();
    } else if (controller.selectedPath.value == MediaCategory.categories) {
      images = controller.allCategoryImages.where((image) => image.url.isNotEmpty).toList();
    } else if (controller.selectedPath.value == MediaCategory.products) {
      images = controller.allProductImages.where((image) => image.url.isNotEmpty).toList();
    } else if (controller.selectedPath.value == MediaCategory.users) {
      images = controller.allUserImages.where((image) => image.url.isNotEmpty).toList();
    }
    return images;
  }

  Widget _buildEmptyAnimationWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.lg * 3),
      child: TAnimationLoaderWidget(
        width: 300,
        height: 300,
        text: 'Select your Desired Folder',
        animation: TImages.packageAnimation,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildSimpleList(ImageModel image) {
    return TRoundedImage(
      width: 140,
      height: 140,
      padding: TSizes.sm,
      image: image.url,
      imageType: ImageType.network,
      margin: TSizes.spaceBtwItems / 2,
      backgroundColor: TColors.primaryBackground,
    );
  }

  Widget _buildListWithCheckbox(ImageModel image) {
    return Stack(
      children: [
        TRoundedImage(
          width: 140,
          height: 140,
          padding: TSizes.sm,
          image: image.url,
          imageType: ImageType.network,
          margin: TSizes.spaceBtwItems / 2,
          backgroundColor: TColors.primaryBackground,
        ),
        Positioned(
          top: TSizes.md,
          right: TSizes.md,
          child: Obx(
              () => Checkbox(
                value: image.isSelected.value,
                onChanged: (selected){
                  if(selected != null){
                    image.isSelected.value = selected;

                    if(selected){
                      if(!allowMultipleSelection){
                        for(var otherImage in selectedImages){
                          if(otherImage != image){
                            otherImage.isSelected.value = false;
                          }
                        }
                        selectedImages.clear();
                      }

                      selectedImages.add(image);
                    }else{
                      selectedImages.remove(image);
                    }
                  }
                },
              )
          ),
        )
      ],
    );
  }

  Widget buildAddSelectedImagesButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Close Button
        SizedBox(
          width: 128,
          child: OutlinedButton.icon(label: const Text('Close'), icon: const Icon(Iconsax.close_circle), onPressed: () => Get.back()),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        SizedBox(
          width: 128,
          child: ElevatedButton.icon(
            label: const Text('Add'),
            icon: const Icon(Iconsax.image),
            onPressed: () => Get.back(result: selectedImages),
          ),
        ),
      ],
    );
  }
}
