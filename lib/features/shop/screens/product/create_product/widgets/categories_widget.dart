import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/category_model.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories label
          Text('Categories', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),
          // MultiSelectDialogField for selecting categories
          MultiSelectDialogField(
            buttonText: const Text("Select Categories"),
            title: const Text("Categories"),
            items: [
              MultiSelectItem(CategoryModel(id: 'id', name: 'Shoes', image: 'image', isFeatured: false), 'Shoes'),
              MultiSelectItem(CategoryModel(id: 'id', name: 'Shirts', image: 'image', isFeatured: false), 'Shirts'),
            ],
            listType: MultiSelectListType.CHIP,
            onConfirm: (values) {},
          ),
        ],
      ),
    );
  }
}
