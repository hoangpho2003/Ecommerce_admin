import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/authentication/Screens/reset_password/responsive_screens/reset_password_desktop_tablet.dart';
import 'package:ecommerce_admin/features/authentication/Screens/reset_password/responsive_screens/reset_password_mobile.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(useLayout: false, desktop: ResetPasswordDesktopTablet(), mobile: const ResetPasswordMobile());
  }
}
