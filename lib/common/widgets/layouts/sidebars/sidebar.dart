import 'package:ecommerce_admin/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import 'menu/menu_item.dart';

class TSidebar extends StatelessWidget {
  const TSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(color: TColors.grey, width: 1))
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TCircularImage(width: 100, height: 100, image: TImages.darkAppLogo, backgroundColor: Colors.transparent),
              const SizedBox(height: TSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('MENU', style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2)),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    const TMenuItem(route: HptRoutes.dashboard, itemName: 'Dashboard', icon: Iconsax.status),
                    const TMenuItem(route: HptRoutes.media, itemName: 'Media', icon: Iconsax.image),
                    const TMenuItem(route: HptRoutes.banners, itemName: 'Banners', icon: Iconsax.picture_frame),
                    const TMenuItem(route: HptRoutes.products, itemName: 'Products', icon: Iconsax.shopping_bag),
                    const TMenuItem(route: HptRoutes.categories, itemName: 'Categories', icon: Iconsax.category_2),
                    const TMenuItem(route: HptRoutes.brands, itemName: 'Brands', icon: Iconsax.dcube),
                    // const TMenuItem(route: HptRoutes.customers, itemName: 'Customers', icon: Iconsax.status),
                    // const TMenuItem(route: HptRoutes.orders, itemName: 'Orders', icon: Iconsax.status),
                    // const TMenuItem(route: HptRoutes.coupons, itemName: 'Coupons', icon: Iconsax.status),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    Text('OTHER', style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2)),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // const TMenuItem(route: HptRoutes.settings, itemName: 'Settings', icon: Iconsax.status),
                    const TMenuItem(route: HptRoutes.logout, itemName: 'Logout', icon: Iconsax.status),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

