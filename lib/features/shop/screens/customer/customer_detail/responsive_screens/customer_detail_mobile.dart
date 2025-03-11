import 'package:ecommerce_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin/features/shop/models/user_model.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../widgets/customer_info.dart';
import '../widgets/customer_orders.dart';
import '../widgets/shipping_address.dart';

class CustomerDetailMobile extends StatelessWidget {
  const CustomerDetailMobile({super.key, required this.customer});

  final UserModel customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: customer.fullName,
                breadcrumbItems: const [HptRoutes.customers, 'Details'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              CustomerInfo(customer: customer),
              const SizedBox(height: TSizes.spaceBtwSections),

              const ShippingAddress(),
              const SizedBox(height: TSizes.spaceBtwSections),

              const CustomerOrders(),
            ],
          ),
        ),
      ),
    );
  }
}
