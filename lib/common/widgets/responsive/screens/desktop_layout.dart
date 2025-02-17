import 'package:ecommerce_admin/common/widgets/layouts/headers/header.dart';
import 'package:ecommerce_admin/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          const Expanded(child: TSidebar()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                const THeader(),

                Expanded(child: body ?? const SizedBox())
              ],
            ),
          )
        ],
      ),
    );
  }
}
