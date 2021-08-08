import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

Widget buildArticleItems(Map item) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              item['urlToImage']??"https://mcleansmartialarts.com/wp-content/uploads/2017/04/default-image-620x600.jpg"
            ),
            fit: BoxFit.cover

          ),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item['title'],
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text("${item['publishedAt']}",
                style: TextStyle(
                    color: Colors.grey
                ),)
            ],
          ),
        ),
      ),
    ],
  ),
);


Widget buildArticle(List list , context) {

  return Directionality(
    textDirection: TextDirection.rtl,
    child: Conditional.single(
      context: context,
      conditionBuilder: (BuildContext context) => list.length > 0,
      widgetBuilder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => buildArticleItems(list[index]),
        separatorBuilder: (_, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20 , end: 20),
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        itemCount: list.length,
      ),
      fallbackBuilder: (context)=>Center(child: CircularProgressIndicator()),
    ),
  );
}