import 'package:ecommerce_admin/common/widgets/layouts/templates/login_templates.dart';
import 'package:flutter/material.dart';

import '../widgets/header_form.dart';

class ForgetPasswordDesktopTablet extends StatelessWidget {
  const ForgetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginTemplate(
      child: HeaderAndForm(),
    );
  }
}
