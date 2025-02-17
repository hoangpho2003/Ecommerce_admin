import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin/utils/constants/colors.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductThumbnailImage extends StatelessWidget {
  const ProductThumbnailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Thumbnail', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),
          TRoundedContainer(
            height: 300,
            backgroundColor: TColors.primaryBackground,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TRoundedImage(width: 220, height: 220, imageType: ImageType.asset, image: TImages.defaultSingleImageIcon),
                      )
                    ],
                  ),
                  SizedBox(width: 200, child: OutlinedButton(onPressed: () {}, child: const Text('Add Thumbnail'))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
