import 'package:ecommerce_admin/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:ecommerce_admin/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:ecommerce_admin/common/widgets/responsive/screens/tablet_layout.dart';
import 'package:flutter/material.dart';
import '../../responsive/responsive_design.dart';

/// Template for the overall site layout, responsive to different screen sizes
class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({super.key, this.desktop, this.tablet, this.mobile, this.useLayout = true});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TResponsiveWidget(
        desktop: useLayout ? DesktopLayout(body: desktop) : desktop ?? Container(),
        tablet: useLayout ? TabletLayout(body: tablet ?? desktop) : tablet ?? desktop ?? Container(),
        mobile: useLayout ? MobileLayout(body: mobile ?? desktop) : mobile ?? desktop ?? Container(),
      ),
    );
  }
}
