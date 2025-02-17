import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/images/image_uploader.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../models/brand_model.dart';

class EditBrandForm extends StatelessWidget {
  const EditBrandForm({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const SizedBox(height: TSizes.sm),
            Text('Update Brand', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwSections),

            TextFormField(
              validator: (value) => TValidator.validateEmptyText('Name', value),
              decoration: const InputDecoration(labelText: 'Brand Name', prefixIcon: Icon(Iconsax.category)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            DropdownButtonFormField(
              decoration: const InputDecoration(hintText: 'Parent Brand', labelText: 'Parent Brand', prefixIcon: Icon(Iconsax.bezier)),
              onChanged: (newValue) {},
              items: const [
                DropdownMenuItem(
                  value: '',
                  child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [Text('item.name')]),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
            TImageUploader(
              width: 80,
              height: 80,
              imageType: ImageType.asset,
              image: TImages.defaultImage,
              onIconButtonPressed: () {},
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            CheckboxMenuButton(
              value: true,
              onChanged: (value) {},
              child: const Text('Featured'),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Update'))),

            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
