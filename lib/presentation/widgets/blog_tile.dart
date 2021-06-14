import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  const BlogTile(
      {Key? key,
      required this.title,
      required this.desc,
      required this.imageurl})
      : super(key: key);
  final String title, desc, imageurl;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          //  Image.network(imageurl,boxfi),

          Container(
            // height: 90,
            // width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.network(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            desc,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
