import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/shop/screens/customer/customer_detail/responsive_screens/customer_detail_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/customer/customer_detail/responsive_screens/customer_detail_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/customer/customer_detail/responsive_screens/customer_detail_tablet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customer = Get.arguments;
    return TSiteTemplate(
      desktop: CustomerDetailDesktop(customer: customer),
      tablet: CustomerDetailTablet(customer: customer),
      mobile: CustomerDetailMobile(customer: customer),
    );
  }
}
