import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/shop/screens/dashboard/responsive_screens/dashboard_desktop.dart';
import 'package:ecommerce_admin/features/shop/screens/dashboard/responsive_screens/dashboard_mobile.dart';
import 'package:ecommerce_admin/features/shop/screens/dashboard/responsive_screens/dashboard_tablet.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: DashboardDesktop(), mobile:  DashboardMobile(), tablet: DashboardTablet(),);
  }
}
