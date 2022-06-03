import 'dart:html';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:updates/utilities/layout_utility.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              "TODO",
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          expandedHeight: 250,
        ),
        SliverFillRemaining(
          child: newsDetailSection(),
        )
      ]),
    );
  }
}

Widget newsDetailSection() {
  return Container(
    padding: EdgeInsets.all(15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row1(),
        LayoutUtils.iconText(Icon(Icons.timer), Text("01st JAn 2021")),
        SizedBox(
          height: 15,
        ),
        Text(
          "Manish Ccoe News",
          style: TextStyle(
              fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          width: 100,
        ),
        Expanded(
            child: Html(style: {
          "p": Style(color: Colors.grey, fontSize: FontSize.larger)
        }, data: "<p> Test News</p><p> Test News para 2</p>"))
      ],
    ),
  );
}

Widget row1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          child: Text(
            "sports",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.monetization_on)),
            IconButton(onPressed: () {}, icon: Icon(Icons.monetization_on))
          ],
        ),
      )
    ],
  );
}
