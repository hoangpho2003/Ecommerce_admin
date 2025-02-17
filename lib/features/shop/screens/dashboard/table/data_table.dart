import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:ecommerce_admin/features/shop/screens/dashboard/table/table_source.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashboardOrderTable extends StatelessWidget {
  const DashboardOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: TSizes.xl * 1.2,
      columns: const [
        DataColumn2(label: Text('Order ID')),
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Items')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Amount')),
      ],
      source: OrderRows(),
    );
  }
}
