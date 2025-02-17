import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/common/widgets/images/image_uploader.dart';
import 'package:ecommerce_admin/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin/utils/constants/colors.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validation.dart';

class ProductVariations extends StatelessWidget {
  const ProductVariations({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Variations Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Product Variations', style: Theme.of(context).textTheme.headlineSmall),
              TextButton(onPressed: () {}, child: const Text('Remove Variations')),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          // Variations List
          ListView.separated(
            itemCount: 2,
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              return _buildVariationTile();
            },
          ),
          // No variation Message
          _buildNoVariationsMessage(),
        ],
      ),
    );
  }

  Widget _buildVariationTile(){
    return ExpansionTile(
      backgroundColor: TColors.lightGrey,
      collapsedBackgroundColor: TColors.lightGrey,
      childrenPadding: const EdgeInsets.all(TSizes.md),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
      title: const Text('Color: Green, Size: Small'),
      children: [
        Obx(
            () => TImageUploader(
              right: 0,
              left: null,
              imageType: ImageType.asset,
              image: TImages.defaultImage,
              onIconButtonPressed: (){},
            ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Stock', hintText: 'Add stock, only numbers are allowed!'),
                validator: (value) => TValidator.validateEmptyText('Stock', value),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),

            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Price', hintText: 'Price with up-to 2 decimals!'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2$'))],
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Discounted Price', hintText: 'Price with up-to 2 decimals!'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2$'))],
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        TextFormField(
          decoration: const InputDecoration(labelText: 'Description', hintText: 'Add description of this variation...'),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }

  Widget _buildNoVariationsMessage(){
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(width: 200, height: 200, imageType: ImageType.asset, image: TImages.defaultVariationImageIcon),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text('There are no variations added for this product'),
      ],
    );
  }
}
