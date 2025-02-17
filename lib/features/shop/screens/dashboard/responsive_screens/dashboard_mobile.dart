import 'package:flutter/material.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../table/data_table.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/order_status_graph.dart';
import '../widgets/t_weekly_sales_graph.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

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

                const TDashboardCard(title: 'Sales total', subTitle: '\$365.6', status: 25),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TDashboardCard(title: 'Average Order Value', subTitle: '\$25', status: 15),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TDashboardCard(title: 'Total Orders', subTitle: '36', status: 44),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TDashboardCard(title: 'Visitors', subTitle: '25,035', status: 2),
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
