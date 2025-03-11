import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/features/shop/models/order_model.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/colors.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:ecommerce_admin/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerOrderRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final order = OrderModel(id: 'id', status: OrderStatus.shipped, totalAmount: 235.5, orderDate: DateTime.now());
    const totalAmount = '2563.5';
    return DataRow2(
      selected: false,
      onTap: () => Get.toNamed(HptRoutes.ordersDetails, arguments: order),
      cells: [
        DataCell(Text(order.id, style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: TColors.primary))),
        DataCell(Text(order.formattedOrderDate)),
        const DataCell(Text('${5} Items')),
        DataCell(
          TRoundedContainer(
            radius: TSizes.cardRadiusMd,
            padding: const EdgeInsets.symmetric(vertical: TSizes.sm, horizontal: TSizes.md),
            backgroundColor: THelperFunctions.getOrderStatusColor(order.status).withOpacity(0.1),
            child: Text(
              order.status.name.capitalize.toString(),
              style: TextStyle(color: THelperFunctions.getOrderStatusColor(order.status)),
            ),
          )
        ),
        const DataCell(Text('\$$totalAmount')),
      ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 5;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}