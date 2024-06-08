import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:api_newsapp/news/data/cubit/news_satate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../news_model.dart';

class News_Cubit extends Cubit<NewsStates>{
  News_Cubit() :super(newsintital());
  static News_Cubit get(context){
    return BlocProvider.of(context);
  }



  List<Newsmodel> newsList =[];
         void getNews () async {
      try {
      String apiKey = "61f5ccfbf7474640a31618aea77fea0c";
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        List listFromApi = jsonData['articles'];
        for (var element in listFromApi) {
          newsList.add(Newsmodel.fromJson(element));
        }
        emit(newssuccess());

      }
      else {
        debugPrint("status : ${response.statusCode}");
      }

    }
    catch (e) {
      debugPrint("$e");
      emit(newserror());


      }
         }


  static Future<void> urllaunch(String newsUrl) async{
    final Uri url= Uri.parse(newsUrl);
    if(!await launchUrl(url)) {
      throw Exception('Could not launch$url');
    }
  }
}