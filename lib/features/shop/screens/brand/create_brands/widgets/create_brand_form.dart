import 'package:ecommerce_admin/common/widgets/images/image_uploader.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:ecommerce_admin/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/chips/rounded_choice_chips.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/sizes.dart';

class CreateBrandForm extends StatelessWidget {
  const CreateBrandForm({super.key});

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
            Text('Create New Brand', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwSections),

            TextFormField(
              validator: (value) => TValidator.validateEmptyText('Name', value),
              decoration: const InputDecoration(labelText: 'Brand Name', prefixIcon: Icon(Iconsax.category)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Categories
            Text('Select Categories', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            Wrap(
              spacing: TSizes.sm,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.sm),
                  child: TChoiceChip(text: 'Shoes', selected: true, onSelected: (value) {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.sm),
                  child: TChoiceChip(text: 'Track Suits', selected: false, onSelected: (value) {}),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
            TImageUploader(
              width: 80,
              height: 80,
              imageType: ImageType.asset,
              image: TImages.defaultImage,
              onIconButtonPressed: (){},
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields ),

            CheckboxMenuButton(
              value: true,
              onChanged: (value) {},
              child: const Text('Featured'),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Create'))),

            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
