import 'package:ecommerce_admin/features/authentication/Screens/reset_password/widgets/reset_password_widget.dart';
import 'package:ecommerce_admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ResetPasswordMobile extends StatelessWidget {
  const ResetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ResetPasswordWidget(),
        ),
      ),
    );
  }
}
