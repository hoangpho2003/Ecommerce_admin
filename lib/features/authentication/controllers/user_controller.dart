import 'package:ecommerce_admin/data/repositories/user/user_repository.dart';
import 'package:get/get.dart';
import '../../../utils/popups/loaders.dart';
import '../../shop/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());


  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Fetches user details from the repository
  Future<UserModel> fetchUserDetails() async {
    try {
      loading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      loading.value = false;
      return user;
    } catch (e) {
      loading.value = false;
      TLoaders.errorSnackBar (title: 'Something went wrong.', message: e.toString());
      return UserModel.empty();
    }
  }
}
