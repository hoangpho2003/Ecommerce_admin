import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin/features/shop/models/product_model.dart';
import 'package:ecommerce_admin/utils/constants/colors.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/icons/table_action_icon_buttons.dart';
import '../../../../../../routes/routes.dart';

class ProductsRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(Row(
          children: [
            const TRoundedImage(
              width: 100,
              height: 100,
              padding: TSizes.sm,
              image: TImages.banner1,
              imageType: ImageType.network,
              borderRadius: TSizes.borderRadiusMd,
              backgroundColor: TColors.primaryBackground,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Flexible(child: Text('Product Title', style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: TColors.primary))),
          ],
        )),
        const DataCell(Text('256')),

        // Brand
        DataCell(
          Row(
            children: [
              const TRoundedImage(
                width: 35,
                height: 35,
                padding: TSizes.xs,
                image: TImages.nikeLogo,
                imageType: ImageType.asset,
                borderRadius: TSizes.borderRadiusMd,
                backgroundColor: TColors.primaryBackground,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Flexible(child: Text('Nike', style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: TColors.primary))),
            ],
          ),
        ),
        const DataCell(Text('\$99.9')),
        DataCell(Text(DateTime.now().toString())),
        DataCell(
          TTableActionButtons(
            onEditPressed: () => Get.toNamed(HptRoutes.editProduct, arguments: ProductModel.empty()),
            onDeletePressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;
}
