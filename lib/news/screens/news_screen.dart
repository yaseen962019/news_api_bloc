import 'package:api_newsapp/news/data/cubit/news_satate.dart';
import 'package:flutter/material.dart';
import 'package:api_newsapp/news/data/cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_newsapp/news/screens/news_list.dart';
import 'package:url_launcher/url_launcher.dart';





class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business News'),
      ),
      body:BlocProvider(
          create:(context)=>News_Cubit()..getNews() ,
          child: BlocBuilder<News_Cubit,NewsStates>(
            builder: (context,state){
              return SafeArea(
                  child:(state is newsload)?
                  const Center(child: CircularProgressIndicator()):
                  (state is newssuccess)?
                  ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context,index){
                        return List(
                          model: News_Cubit.get(context).newsList[index],
                        );
                      },
                      separatorBuilder: (context,index){
                        return const SizedBox(
                          height: 9,
                        );
                      },
                      itemCount: News_Cubit.get(context).newsList.length):
                  const Center(child:
                  Text("error"))
              );
            },
          )
      ),
    );
  }
}
