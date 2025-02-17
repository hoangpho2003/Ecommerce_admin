import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return Column(
      children: [
        IconButton(onPressed: () => Get.offAllNamed(HptRoutes.login), icon: const Icon(CupertinoIcons.clear)),
        const SizedBox(height: TSizes.spaceBtwItems),

        const Image(image: AssetImage(TImages.deliveredEmailIllustration), width: 300, height: 300),

        /// Title & SubTitle
        Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(email, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(
          TTexts.changeYourPasswordSubTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.offAllNamed(HptRoutes.login), child: const Text(TTexts.done)),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: () {}, child: const Text(TTexts.resendEmail)),
        ),
      ],
    );
  }
}
