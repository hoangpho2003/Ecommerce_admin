import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:ecommerce_admin/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_admin/features/shop/models/user_model.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/colors.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerRows extends DataTableSource{
  @override
  DataRow? getRow(int index){
    return DataRow2(
      cells: [
        DataCell(
          Row(
            children: [
              const TRoundedImage(
                width: 50,
                height: 50,
                padding: TSizes.sm,
                imageType: ImageType.network,
                image: TImages.defaultImage,
                borderRadius: TSizes.borderRadiusMd,
                backgroundColor: TColors.primaryBackground,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: Text(
                  'Trac Hoang Pho',
                  style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: TColors.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ),
        const DataCell(Text('photh.21it@vku.udn.vn')),
        const DataCell(Text('0922815775')),
        DataCell(Text(DateTime.now().toString())),
        DataCell(
          TTableActionButtons(
            view: true,
            edit: false,
            onViewPressed: () => Get.toNamed(HptRoutes.customerDetails, arguments: UserModel.empty()),
            onDeletePressed: () {},
          )
        ),
      ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 10;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}