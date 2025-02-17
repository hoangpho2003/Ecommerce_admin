import 'package:ecommerce_admin/features/authentication/Screens/login/widgets/login_form.dart';
import 'package:ecommerce_admin/features/authentication/Screens/login/widgets/login_header.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              LoginHeader(),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
