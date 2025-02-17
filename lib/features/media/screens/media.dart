import 'package:ecommerce_admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:ecommerce_admin/features/media/screens/responsive_screens/media_desktop.dart';
import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: MediaDesktop(),);
  }
}
