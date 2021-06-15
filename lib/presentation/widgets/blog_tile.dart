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
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Card(
        
        child: Column(
          children: [
            //  Image.network(imageurl,boxfi),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
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
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                desc,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
          ],
        ),
        elevation: 5,
      ),
    );
  }
}
