import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/features/shop/controllers/category/category_controller.dart';
import 'package:ecommerce_admin/features/shop/controllers/category/edit_category_controller.dart';
import 'package:ecommerce_admin/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/images/image_uploader.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validation.dart';
import 'package:get/get.dart';

class EditCategoryForm extends StatelessWidget {
  const EditCategoryForm({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final editController = Get.put(EditCategoryController());
    editController.init(category);
    final categoryController = Get.put(CategoryController());
    return TRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        key: editController.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const SizedBox(height: TSizes.sm),
            Text('Update Category', style: Theme
                .of(context)
                .textTheme
                .headlineMedium),
            const SizedBox(height: TSizes.spaceBtwSections),

            TextFormField(
              controller: editController.name,
              validator: (value) => TValidator.validateEmptyText('Name', value),
              decoration: const InputDecoration(labelText: 'Category Name', prefixIcon: Icon(Iconsax.category)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            Obx(
                  () =>
                  DropdownButtonFormField<CategoryModel>(
                    decoration: const InputDecoration(hintText: 'Parent Category', labelText: 'Parent Category', prefixIcon: Icon(Iconsax.bezier)),
                    onChanged: (newValue) => editController.selectedParent.value = newValue!,
                    items: categoryController.allItems.map(
                          (item) =>
                          DropdownMenuItem(
                            value: item,
                            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [Text(item.name)]),
                          ),
                    )
                        .toList(),
                  ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
            Obx(
              () => TImageUploader(
                width: 80,
                height: 80,
                imageType: editController.imageURL.isNotEmpty? ImageType.network : ImageType.asset,
                image: editController.imageURL.isNotEmpty? editController.imageURL.value : TImages.defaultImage,
                onIconButtonPressed: () => editController.pickImage(),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            Obx(
              () => CheckboxMenuButton(
                value: editController.isFeatured.value,
                onChanged: (value) => editController.isFeatured.value = value ?? false,
                child: const Text('Featured'),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => editController.updateCategory(category), child: const Text('Update'))),

            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
