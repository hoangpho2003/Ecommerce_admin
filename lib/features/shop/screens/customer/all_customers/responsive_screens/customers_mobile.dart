import "package:flutter/material.dart";
import "../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart";
import "../../../../../../common/widgets/containers/rounded_container.dart";
import "../../../../../../common/widgets/data_table/table_header.dart";
import "../../../../../../utils/constants/sizes.dart";
import "../table/data_table.dart";

class CustomersMobile extends StatelessWidget {
  const CustomersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BreadcrumbWithHeading(heading: 'Customers', breadcrumbItems: ['Customers']),
              SizedBox(height: TSizes.spaceBtwSections),

              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(showLeftWidget: false),
                    SizedBox(height: TSizes.spaceBtwItems),

                    CustomerTable(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
