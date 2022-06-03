import 'package:http/http.dart' as http;
import 'package:updates/model/news_model.dart';
import '../model/category_model.dart';

import '../config.dart';

class APIService {
  static var client = http.Client();

  static Future<List<CategoryModel>> fetchCategories() async {
    // var url = .parse(Config.apiURL + Config.categoryURL,)
    var response = await client.get(Uri.parse(
      Config.apiURL + Config.categoryURL,
    ));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoryFromJson(jsonString);
    } else {
      return [];
    }
  }

  static Future<List<NewsModel>> fetchPosts(
      int pageNumber, int categoryId) async {
    var url = Config.apiURL +
        Config.postURL +
        "$categoryId" +
        "&page_no=" +
        pageNumber.toString();
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postFromJson(jsonString);
    } else {
      return [];
    }
  }

  static Future<NewsModel> fetchPostsDetails(int postId) async {
    var response = await client.get(
        Uri.parse(Config.apiURL + Config.postDetailURL + postId.toString()));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postDetailsfromJson(jsonString);
    } else {} //ToDo
  }
}
