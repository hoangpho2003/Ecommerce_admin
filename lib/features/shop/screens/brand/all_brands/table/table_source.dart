import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin/utils/constants/colors.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/icons/table_action_icon_buttons.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/device/device_utility.dart';

class BrandRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(
          Row(
            children: [
              const TRoundedImage(
                width: 50,
                height: 50,
                padding: TSizes.sm,
                image: TImages.adidasLogo,
                imageType: ImageType.asset,
                borderRadius: TSizes.borderRadiusMd,
                backgroundColor: TColors.primaryBackground,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: Text(
                  'Adidas',
                  style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: TColors.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        DataCell(Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              spacing: TSizes.xs,
              direction: TDeviceUtils.isMobileScreen(Get.context!) ? Axis.vertical : Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: TDeviceUtils.isMobileScreen(Get.context!) ? 0 : TSizes.xs),
                  child: const Chip(label: Text('Shoes'), padding: EdgeInsets.all(TSizes.xs)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: TDeviceUtils.isMobileScreen(Get.context!) ? 0 : TSizes.xs),
                  child: const Chip(label: Text('TrackSuits'), padding: EdgeInsets.all(TSizes.xs)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: TDeviceUtils.isMobileScreen(Get.context!) ? 0 : TSizes.xs),
                  child: const Chip(label: Text('Joggers'), padding: EdgeInsets.all(TSizes.xs)),
                ),
              ],
            ),
          ),
        )),

        const DataCell(Icon(Iconsax.heart5, color: TColors.primary)),
        DataCell(Text(DateTime.now().toString())),
        DataCell(
          TTableActionButtons(
            onEditPressed: () => Get.toNamed(HptRoutes.editBrand, arguments: ''),
            onDeletePressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 20;

  @override
  int get selectedRowCount => 0;
}
