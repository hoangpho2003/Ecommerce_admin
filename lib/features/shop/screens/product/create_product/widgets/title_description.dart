import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:ecommerce_admin/utils/validators/validation.dart';
import 'package:flutter/material.dart';

class ProductTitleAndDescription extends StatelessWidget {
  const ProductTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Basic Information', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwItems),

            TextFormField(
              validator: (value) => TValidator.validateEmptyText('Product Title', value),
              decoration: const InputDecoration(labelText: 'Product Title'),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            SizedBox(
              height: 300,
              child: TextFormField(
                expands: true,
                maxLines: null,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                validator: (value) => TValidator.validateEmptyText('Product Description', value),
                decoration: const InputDecoration(
                  labelText: 'Product Description',
                  hintText: 'Add your Product Description here...',
                  alignLabelWithHint: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
