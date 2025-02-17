import 'package:ecommerce_admin/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin/features/shop/models/banner_model.dart';
import 'package:ecommerce_admin/utils/constants/colors.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/product/product_images_controller.dart';
import 'package:get/get.dart';

class EditBannerForm extends StatelessWidget {
  const EditBannerForm({super.key, required this.banner});

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductImagesController());
    return TRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const SizedBox(height: TSizes.sm),
            Text('Update Banner', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwSections),

            Column(
              children: [
                GestureDetector(
                  child: const TRoundedImage(
                    width: 400,
                    height: 200,
                    backgroundColor: TColors.primaryBackground,
                    imageType: ImageType.asset,
                    image: TImages.defaultImage,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TextButton(onPressed: () => controller.selectMultipleProductImages(), child: const Text('Select Image')),
              ],
            ),

            const SizedBox (height: TSizes.spaceBtwInputFields),
            Text('Make your Banner Active or InActive', style: Theme.of(context).textTheme.bodyMedium),
            CheckboxMenuButton (value: true, onChanged: (value) {}, child: const Text('Active')),
            const SizedBox (height: TSizes.spaceBtwInputFields),
            // Dropdown Menu Screens
            DropdownButton<String>(value: 'search', onChanged: (String? newValue) {}, items: const [
              DropdownMenuItem<String>(value: 'home', child: Text('Home')),
              DropdownMenuItem<String>(value: 'search', child: Text('Search')),
            ]), // DropdownButton
            const SizedBox (height: TSizes.spaceBtwInputFields * 2),

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Update'))),

            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
