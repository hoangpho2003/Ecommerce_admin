import 'package:ecommerce_admin/features/media/controllers/media_controller.dart';
import 'package:ecommerce_admin/features/media/models/image_model.dart';
import 'package:get/get.dart';

class ProductImagesController extends GetxController {
  static ProductImagesController get instance => Get.find();

  //Rx Observables for the selected thumbnail image
  Rx<String?> selectedThumbnailImageUrl = Rx<String?>(null);

  // Lists to store additional product images
  final RxList<String> additionalProductImagesUrls = <String>[].obs;

  /// Pick Thumbnail Image from Media
  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if(selectedImages != null && selectedImages.isNotEmpty){
      ImageModel selectedImage = selectedImages.first;

      selectedThumbnailImageUrl.value = selectedImage.url;
    }
  }

  /// Pick Multiple Images from Media
  void selectMultipleProductImages() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia(multipleSelection: true, selectedUrls: additionalProductImagesUrls);

    if(selectedImages != null && selectedImages.isNotEmpty){
      additionalProductImagesUrls.assignAll(selectedImages.map((e) => e.url));
    }
  }

  /// Function to remove Product image
  Future<void> removeImage(int index) async {
    additionalProductImagesUrls.removeAt(index);
  }
}
