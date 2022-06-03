import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:updates/controllers/categories_controller.dart';
import 'package:updates/news_page.dart';
import 'dart:convert';

import 'package:updates/widget/news_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Widget> tabs = [];

  final CategoriesController categoriesController =
      Get.put(CategoriesController());

  @override
  void initState() {
    super.initState();
    // tabs.add(tab("Technology"));
    // tabs.add(tab("Business"));
    // tabs.add(tab("Entertainment"));
    // tabs.add(tab("Sports"));
    // tabs.add(tab("Health"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx((() {
        if (categoriesController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return DefaultTabController(
            length: categoriesController.categoriesList.length,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                bottom: TabBar(
                  tabs: categoriesController.categoriesList
                      .map((model) => tab(model.categoryName))
                      .toList(),
                  isScrollable: true,
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.redAccent,
                ),
                actions: const <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: TabBarView(
                children: categoriesController.categoriesList
                    .map((model) => NewsPage(
                          categoryID: model.categoryId,
                          isReload: true,
                          totalRecords:model.count,
                        ))
                    .toList(), // TODOq
              ),
            ),
          );
        }
      })),
    );
  }
}

Widget tab(String tabName) {
  return Tab(
    text: tabName,
  );
}
