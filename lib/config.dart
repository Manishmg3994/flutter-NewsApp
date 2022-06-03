class Config {
  static String apiURL = "http://localhost:8080/news-app/wp-json/wp/v2/";
  static String categoryURL = "categories";
  static String postURL = "latest-posts/?page_size=5&category_id=";
  static String postDetailURL = "post-details/?id=";
  static String dateFormat = "dd-MMM-yyyy"; //IF not then remove mmm s 1 m
}
