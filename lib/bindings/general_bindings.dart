import 'package:ecommerce_admin/features/authentication/controllers/user_controller.dart';
import 'package:ecommerce_admin/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
  }
}