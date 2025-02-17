import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin/features/shop/models/banner_model.dart';
import 'package:ecommerce_admin/utils/constants/colors.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/icons/table_action_icon_buttons.dart';
import '../../../../../../routes/routes.dart';

class BannerRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        const DataCell(
          TRoundedImage(
            width: 100,
            height: 100,
            padding: TSizes.sm,
            image: TImages.banner1,
            imageType: ImageType.network,
            borderRadius: TSizes.borderRadiusMd,
            backgroundColor: TColors.primaryBackground,
          ),
        ),
        const DataCell(Text('Shop')),
        const DataCell(Icon(Iconsax.eye, color: TColors.primary)),
        DataCell(
          TTableActionButtons(
            onEditPressed: () => Get.toNamed(HptRoutes.editBanner, arguments: BannerModel(imageUrl: '', targetScreen: 'targetScreen', active: false)),
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
