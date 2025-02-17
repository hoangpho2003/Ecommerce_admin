import '../../../utils/constants/enums.dart';
import '../../../utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final DateTime? deliveryDate;
  final String paymentMethod;
  final String userId, docId;

  OrderModel({
    this.userId = '',
    this.docId = '',
    this.paymentMethod = 'Paypal',
    required this.id,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.deliveryDate,
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null ? THelperFunctions.getFormattedDate(deliveryDate!) : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  /// Static function to create on empty user model.
  static OrderModel empty() => OrderModel(id:'', orderDate: DateTime.now(), status: OrderStatus.pending, totalAmount: 0);
}
