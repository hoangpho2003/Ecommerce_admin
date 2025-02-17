import 'package:ecommerce_admin/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_admin/data/repositories/user/user_repository.dart';
import 'package:ecommerce_admin/features/authentication/controllers/user_controller.dart';
import 'package:ecommerce_admin/features/shop/models/user_model.dart';
import 'package:ecommerce_admin/utils/constants/enums.dart';
import 'package:ecommerce_admin/utils/constants/image_strings.dart';
import 'package:ecommerce_admin/utils/constants/text_strings.dart';
import 'package:ecommerce_admin/utils/helpers/network_manager.dart';
import 'package:ecommerce_admin/utils/popups/full_screen_loader.dart';
import 'package:ecommerce_admin/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      final user = await UserController.instance.fetchUserDetails();

      TFullScreenLoader.stopLoading();

      if(user.role != AppRole.admin){
        await AuthenticationRepository.instance.logout();
        TLoaders.errorSnackBar(title: 'Not Authorized', message: 'You are not authorized or do not have access. Contact Admin');
      }else{
        AuthenticationRepository.instance.screenRedirect();
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: "Account or password is wrong!");
    }
  }

  Future<void> registerAdmin() async {
    try {
      TFullScreenLoader.openLoadingDialog('Registering Admin Account...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.registerWithEmailAndPassword(TTexts.adminEmail, TTexts.adminPassword);

      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(UserModel(
        id: AuthenticationRepository.instance.authUser!.uid,
        firstName: 'Trac',
        lastName: 'Hoang Pho',
        email: TTexts.adminEmail,
        role: AppRole.admin,
        createdAt: DateTime.now(),
      ));

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
