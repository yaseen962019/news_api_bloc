import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:api_newsapp/news/data/news_model.dart';

class List extends StatelessWidget {
  const List({super.key, required this.model,});
  final Newsmodel model;


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        model.url;
      },
      child:Material(
        color: Colors.white.withOpacity(0.8), // Transparent white background
        elevation: 4, // Add shadow
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (model.imageUrl != null)
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1), // Add border
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      model.imageUrl!,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(height: 10),
              Text(
                model.title ?? 'No title',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                model.author ?? 'Unknown author',
                style: TextStyle(fontSize: 14),
              ),
              Text(model.time!.substring(0,10)
                ,style: TextStyle(fontSize: 14),

              )
            ],
          ),
        ),
      ),



    );
  }
}
