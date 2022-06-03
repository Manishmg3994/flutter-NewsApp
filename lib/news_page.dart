import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:updates/controllers/posts_controller.dart';
import 'package:updates/widget/news_card_widget.dart';

class NewsPage extends StatefulWidget {
  int? categoryID;
  bool? isReload;
  int? totalRecords;

  NewsPage({Key? key, this.categoryID, this.isReload, this.totalRecords})
      : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PostsController postsController = Get.put(PostsController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (widget.isReload!) {
        await postsController.fetchPosts(
            categoryId: widget.categoryID!,
            pageNumber: 1,
            totalRecords: widget.totalRecords!);
      }
    });
    _scrollController.addListener(() async {
      //here is my code we will
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await postsController.fetchPosts(
            pageNumber: ++_page,
            totalRecords: widget.totalRecords!,
            categoryId: widget.categoryID!);
      }
    });
  }

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final ScrollController _scrollController = ScrollController();
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return newsList();
  }

  Widget newsList() {
    return Container(
      child: Obx(() {
        if (postsController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: () =>
                postsController.fetchPosts(categoryId: widget.categoryID!),
            child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: postsController.postsList.length,
                itemBuilder: (context, index) {
                  if ((index == postsController.postsList.length - 1) &&
                      postsController.postsList.length < widget.totalRecords!) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return NewsCardWidget(
                    model: postsController.postsList[index],
                  );
                }),
          );
        }
      }),
    );
  }
}
