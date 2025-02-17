import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: TSizes.spaceBtwSections * 2),
        Form(
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.toNamed(HptRoutes.resetPassword, parameters: {'email': 'some@email.com'}), child: const Text(TTexts.submit)),
        )
      ],
    );
  }
}
