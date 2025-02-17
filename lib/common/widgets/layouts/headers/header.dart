import 'package:ecommerce_admin/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_admin/features/authentication/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../images/t_rounded_image.dart';

/// Header widget for the application
class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Container(
      decoration: const BoxDecoration(
        color: TColors.white,
        border: Border(bottom: BorderSide(color: TColors.grey, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        leading: !TDeviceUtils.isDesktopScreen(context) ? IconButton(onPressed: () => scaffoldKey?.currentState?.openDrawer(), icon: const Icon(Iconsax.menu)) : null,
        title: !TDeviceUtils.isDesktopScreen(context)
            ? null
            : SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.search_normal), hintText: 'Search anything...'),
                ),
              ),

        /// Actions
        actions: [
          // Search Icon on Mobile
          if (!TDeviceUtils.isDesktopScreen(context)) IconButton(icon: const Icon(Iconsax.search_normal), onPressed: () {}),
          // Notification Icon
          IconButton(icon: const Icon(Iconsax.notification), onPressed: () {}),
          const SizedBox(width: TSizes.spaceBtwItems / 2),
          // User Data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => TRoundedImage(
                  width: 40,
                  padding: 2,
                  height: 40,
                  imageType: controller.user.value.profilePicture.isEmpty ? ImageType.network : ImageType.asset,
                  image: controller.user.value.profilePicture.isEmpty ? controller.user.value.profilePicture : TImages.user,
                ),
              ),
              const SizedBox(width: TSizes.sm),
              if (!TDeviceUtils.isMobileScreen(context))
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.loading.value
                          ? const TShimmerEffect(width: 50, height: 13)
                          : Text(controller.user.value.fullName, style: Theme.of(context).textTheme.titleLarge),
                      controller.loading.value
                          ? const TShimmerEffect(width: 50, height: 13)
                          : Text(controller.user.value.email, style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
// TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
