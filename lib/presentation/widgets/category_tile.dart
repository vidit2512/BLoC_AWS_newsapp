
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/listing_bloc.dart';
import 'package:news_app/bloc/listing_events.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.imageurl, required this.category})
      : super(key: key);
  final String imageurl, category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        child: Card(
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 90,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.network(
                      imageurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                  //  borderRadius: BorderRadius.all(Radius.circular(9)),
                    color: Colors.black38,
                  ),
                  height: 90,
                  width: 120,
                  child: Center(
                    child: Text(
                      category,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          elevation: 8,
        ),
     onTap: (){
       BlocProvider.of<ListingBloc>(context).add(FetchCategoryNewsEvent(category:category)); //TESTING
     },
      ),
    );
  }
}
