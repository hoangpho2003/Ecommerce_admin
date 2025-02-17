import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/validators/validation.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: TColors.primaryBackground),
        const SizedBox(height: TSizes.spaceBtwSections),
        Text('Add Product Attributes', style: Theme
            .of(context)
            .textTheme
            .headlineSmall),
        const SizedBox(height: TSizes.spaceBtwItems),
// Form to add new attribute
        Form(
          child: TDeviceUtils.isDesktopScreen(context)
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildAttributeName(),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                flex: 2,
                child: _buildAttributeTextField(),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              _buildAddAttributeButton(),
            ],
          )
              : Column(
            children: [
              _buildAttributeName(),
              const SizedBox(height: TSizes.spaceBtwItems),
              _buildAttributeTextField(),
              const SizedBox(height: TSizes.spaceBtwItems),
              _buildAddAttributeButton(),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        Text('All Attributes', style: Theme
            .of(context)
            .textTheme
            .headlineSmall),
        const SizedBox(height: TSizes.spaceBtwItems),

        TRoundedContainer(
          backgroundColor: TColors.primaryBackground,
          child: Column(
            children: [
              buildAttributesList(context),
              buildEmptyAttributes(),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton.icon(
              icon: const Icon(Iconsax.activity),
              label: const Text('Generate Variations'),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Column buildEmptyAttributes() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(imageType: ImageType.asset, image: TImages.defaultAttributeColorsImageIcon, width: 150, height: 80),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text('There are no attributes added for this product'),
      ],
    );
  }

  ListView buildAttributesList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ), // BoxDecoration
          child: ListTile(
            title: const Text('Color'),
            subtitle: const Text('Green, Orange, Pink'),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Iconsax.trash, color: TColors.error)),
          ),
        );
      },
    );
  }

  // Build button to add a new attribute
  SizedBox _buildAddAttributeButton() {
    return SizedBox(
      width: 100,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Iconsax.add),
        style: ElevatedButton.styleFrom(
          foregroundColor: TColors.black,
          backgroundColor: TColors.secondary,
          side: const BorderSide(color: TColors.secondary),
        ),
        label: const Text('Add'),
      ),
    );
  }

  // Build text form field for attribute name
  TextFormField _buildAttributeName() {
    return TextFormField(
      validator: (value) => TValidator.validateEmptyText('Attribute Name', value),
      decoration: const InputDecoration(labelText: 'Attribute Name', hintText: 'Colors, Sizes, Material'),
    );
  }

  // Build text form field for attribute values
  SizedBox _buildAttributeTextField() {
    return SizedBox(
      height: 80,
      child: TextFormField(
        expands:
        true,
        maxLines:
        null,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        validator: (value) => TValidator.validateEmptyText('Attributes Field', value),
        decoration: const InputDecoration(
          labelText:
          'Attributes',
          hintText: 'Add attributes separated by | Example: Green | Blue | Yellow',
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}