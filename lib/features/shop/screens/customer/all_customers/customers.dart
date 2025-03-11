import 'package:ecommerce_admin/features/shop/screens/customer/all_customers/responsive_screens/customers_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/customer/all_customers/responsive_screens/customers_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/customer/all_customers/responsive_screens/customers_tablet.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../common/widgets/layouts/templates/site_layout.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: CustomersDesktop(), tablet: CustomersTablet(), mobile: CustomersMobile());
  }
}
