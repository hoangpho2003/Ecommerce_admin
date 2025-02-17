import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:get/get.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../models/order_model.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmounts = <OrderStatus, double>{}.obs;

  /// -- Order
  static final List<OrderModel> orders = [
    OrderModel(id: 'CWT0012', status: OrderStatus.processing, totalAmount: 265, orderDate: DateTime(2024, 12, 28), deliveryDate: DateTime(2024, 12, 20)),
    OrderModel(id: 'CWT0025', status: OrderStatus.shipped, totalAmount: 369, orderDate: DateTime(2024, 12, 21), deliveryDate: DateTime(2024, 12, 21)),
    OrderModel(id: 'CWT0152', status: OrderStatus.delivered, totalAmount: 254, orderDate: DateTime(2024, 12, 22), deliveryDate: DateTime(2024, 12, 22)),
    OrderModel(id: 'CWT0265', status: OrderStatus.delivered, totalAmount: 355, orderDate: DateTime(2024, 12, 23), deliveryDate: DateTime(2024, 12, 23)),
    OrderModel(id: 'CWT1536', status: OrderStatus.delivered, totalAmount: 115, orderDate: DateTime(2024, 12, 24), deliveryDate: DateTime(2024, 12, 24)),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    _calculateOrderStatusData();
    super.onInit();
  }

  // Calculate weekly sales
  void _calculateWeeklySales() {
    // Reset weeklySales to zeros
    weeklySales.value = List<double>.filled(7, 0.0);
    for (var order in orders) {
      final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(order.orderDate);
      // Check if the order is within the current week
      if (orderWeekStart.isBefore(DateTime.now()) && orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;
        // Ensure the index is non-negative
        index = index < 0 ? index + 7 : index;
        weeklySales[index] += order.totalAmount;

        print('OrderDate: ${order.orderDate}, CurrentWeekDay: $orderWeekStart, Index: $index');
      }
    }

    print('Weekly Sales: $weeklySales');
  }

  // Call this function to calculate Order Status counts
  void _calculateOrderStatusData() {
    // Reset status data
    orderStatusData.clear();
    // Map to store total amounts for each status
    totalAmounts.value = {for (var status in OrderStatus.values) status: 0.0};
    for (var order in orders) {
      // Count Orders
      final status = order.status;
      orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;
      // Calculate total amounts for each status
      totalAmounts[status] = (totalAmounts[status] ?? 0) + order.totalAmount;
    }
  }

  String getDisplayStatusName(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }
}
