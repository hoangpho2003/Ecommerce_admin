import 'package:ecommerce_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:ecommerce_admin/common/widgets/containers/rounded_container.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:ecommerce_admin/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/additional_images.dart';
import '../widgets/attributes_widgets.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/brand_widget.dart';
import '../widgets/categories_widget.dart';
import '../widgets/product_type_widget.dart';
import '../widgets/stock_pricing_widget.dart';
import '../widgets/thumbnail_widget.dart';
import '../widgets/title_description.dart';
import '../widgets/variations_widget.dart';
import '../widgets/visibility_widget.dart';

class CreateProductDesktopScreen extends StatelessWidget {
  const CreateProductDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ProductBottomNavigationButtons(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BreadcrumbWithHeading(
              heading: 'Create Product',
                  breadcrumbItems: [HptRoutes.products, 'Create Product'],
              returnToPreviousScreen: true),
              const SizedBox(height: TSizes.spaceBtwSections),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: TDeviceUtils.isTabletScreen(context) ? 2 : 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductTitleAndDescription(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Stock & Pricing', style: Theme.of(context).textTheme.headlineSmall),
                              const SizedBox(height: TSizes.spaceBtwItems),

                              const ProductTypeWidget(),
                              const SizedBox(height: TSizes.spaceBtwInputFields),

                              const ProductStockAndPricing(),
                              const SizedBox(height: TSizes.spaceBtwSections),

                              const ProductAttributes(),
                              const SizedBox(height: TSizes.spaceBtwSections),
                            ],
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        const ProductVariations(),
                      ],
                    ),
                  ),
                  const SizedBox(width: TSizes.defaultSpace),

                  Expanded(
                    child: Column(
                      children: [
                        const ProductThumbnailImage(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('All Product Images', style: Theme.of(context).textTheme.headlineSmall),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              ProductAdditionalImages(
                                additionalProductImagesURLs: RxList<String>.empty(),
                                onTapToAddImages: (){},
                                onTapToRemoveImage: (index){},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        const ProductBrand(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        const ProductCategories(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        const ProductVisibilityWidget(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
