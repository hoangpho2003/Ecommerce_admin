import 'package:ecommerce_admin/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_admin/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class HptRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated ? null : const RouteSettings(name: HptRoutes.login);
  }
}
