import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/features/shop/screens/dashboard/widgets/order_status_graph.dart';
import 'package:ecommerce_admin/features/shop/screens/dashboard/widgets/t_weekly_sales_graph.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../table/data_table.dart';
import '../widgets/dashboard_card.dart';

class DashboardTablet extends StatelessWidget {
  const DashboardTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dashboard', style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: TSizes.spaceBtwSections),

                const Row(
                  children: [
                    Expanded(child: TDashboardCard(title: 'Sales total', subTitle: '\$365.6', status: 25)),
                    SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(child: TDashboardCard(title: 'Average Order Value', subTitle: '\$25', status: 15)),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const Row(
                  children: [
                    Expanded(child: TDashboardCard(title: 'Total Orders', subTitle: '36', status: 44)),
                    SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(child: TDashboardCard(title: 'Visitors', subTitle: '25,035', status: 2)),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                const TWeeklySalesGraph(),
                const SizedBox(height: TSizes.spaceBtwSections),

                TRoundedContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Recent Orders', style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      const DashboardOrderTable(),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                const OrderStatusGraph(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
