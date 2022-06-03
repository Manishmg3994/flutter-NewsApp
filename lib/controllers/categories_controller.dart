import 'package:get/get.dart';
import 'package:updates/model/category_model.dart';
import 'package:updates/services/api_services.dart';

class CategoriesController extends GetxController {
  var isLoading = true.obs;
  var categoriesList = [].obs;
  @override
  void onInit() {
    fetchCategories();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var categories = await APIService.fetchCategories();
      if (categories.isNotEmpty) {
        categoriesList.clear();
        categoriesList.addAll(categories);
      }
    } finally {
      isLoading(false);
    }
    // catch (error) {
    //   print(error);
    // }
  }
}
