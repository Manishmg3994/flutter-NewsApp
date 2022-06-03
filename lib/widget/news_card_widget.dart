import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:updates/model/news_model.dart';
import 'package:updates/utilities/layout_utility.dart';

import '../news_details.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel? model;
  const NewsCardWidget({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      child: InkWell(
        onTap: () {
          MaterialPageRoute(
            builder: (context) => NewsDetails(),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child:
                  Image.network(model!.imageURL.toString()), //TODO FIXED IMAGE
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      model!.categoryName!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Container(
                //     padding: EdgeInsets.all(10),
                //     margin: EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //       color: Colors.green,
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: Text(
                //       "Technology",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 15,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model!.title!.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LayoutUtils.iconText(
                        Icon(Icons.timer),
                        Text(
                          model!.postedDate!.toString(),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.favorite_border),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
