import 'package:get/get.dart';
import 'package:updates/services/api_services.dart';

class PostsController extends GetxController {
  var isLoading = true.obs;
  var postsList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchPosts(
      {int categoryId = 1, int pageNumber = 0, int totalRecords = 0}) async {
    try {
      if (postsList.isEmpty || pageNumber == 0) {
        isLoading(true);
        postsList.clear();
      }

      if (postsList.length < totalRecords) {
        var posts = await APIService.fetchPosts(
          pageNumber,
          categoryId,
        );
        postsList.clear();
        if (posts.isNotEmpty) {
          postsList.addAll(posts);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
