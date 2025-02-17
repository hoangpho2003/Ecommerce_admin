import 'package:ecommerce_admin/common/widgets/layouts/templates/login_templates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/reset_password_widget.dart';

class ResetPasswordDesktopTablet extends StatelessWidget {
  ResetPasswordDesktopTablet({super.key});

  final email = Get.parameters['email'] ?? '';

  @override
  Widget build(BuildContext context) {
    return const LoginTemplate(
      child: ResetPasswordWidget(),
    );
  }
}
