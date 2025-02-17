import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/brand_model.dart';

class ProductBrand extends StatelessWidget {
  const ProductBrand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand label
          Text('Brand', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),
          // TypeAheadField for brand selection
          TypeAheadField(
            builder: (context, ctr, focusNode) {
              return TextFormField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Brand',
                  suffixIcon: Icon(Iconsax.box),
                ),
              );
            },
            suggestionsCallback: (pattern) {
              // Return filtered brand suggestions based on the search pattern
              return [BrandModel(id: 'id', image: TImages.adidasLogo, name: 'Adidas'), BrandModel(id: 'id', image: TImages.adidasLogo, name: 'Nike')];
            },
            itemBuilder: (context, suggestion) {
              return ListTile(title: Text(suggestion.name));
            },
            onSelected: (suggestion) {},
          ),
        ],
      ),
    );
  }
}
