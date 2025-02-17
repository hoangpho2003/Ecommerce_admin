import 'package:ecommerce_admin/common/widgets/layouts/templates/login_templates.dart';
import 'package:flutter/material.dart';

import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreenDesktopTablet extends StatelessWidget {
  const LoginScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginTemplate(
      child: Column(
        children: [
          LoginHeader(),
          LoginForm(),
        ],
      ),
    );
  }
}
