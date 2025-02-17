import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:ecommerce_admin/features/shop/controllers/category/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../table/table_source.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(
      () {
        Text(controller.filteredItems.length.toString());
        Text(controller.selectedRows.length.toString());

        return TPaginatedDataTable(
          sortColumnIndex: controller.sortColumnIndex.value,
          sortAscending: controller.sortAscending.value,
          minWidth: 700,
          columns: [
            DataColumn2(label: const Text('Category'), onSort: (columnIndex, ascending) => controller.sortByName(columnIndex, ascending)),
            DataColumn2(label: const Text('Parent Category'), onSort: (columnIndex, ascending) => controller.sortByParentName(columnIndex, ascending)),
            const DataColumn2(label: Text('Featured')),
            const DataColumn2(label: Text('Date')),
            const DataColumn2(label: Text('Action'), fixedWidth: 100),
          ],
          source: CategoryRow(),
        );
      }
    );
  }
}
