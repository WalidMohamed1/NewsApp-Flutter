import 'package:flutter/material.dart';

Widget buildNews(article,context) {
  return Card(
      child: Container(
        height: 100.0,
        child: Row(
          children: [
            Container(
              height: 100.0,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.fill,
                ),
              )
            ),
            Expanded(
              child: Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${article['title']}',
                        style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.bold), maxLines: 2, softWrap: false, overflow: TextOverflow.ellipsis
                      ),
                      SizedBox(height: 17,),
                      Text(
                          '${article['publishedAt']}',
                          style: TextStyle(fontSize: 10.0,color: Colors.grey), maxLines: 1, softWrap: false, overflow: TextOverflow.ellipsis
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
  );
}
