import 'dart:convert';

import 'package:newsApp/modals/article_modal.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModal> news = [];

  Future<void> getNews() async{
    String url =
      "http://newsapi.org/v2/top-headlines?country=in&apiKey=78bd7dbf572c4d06b799e9f970651f21";

      var response = await http.get(url);

      var jsonData = jsonDecode(response.body);

      if(jsonData['status'] == "ok"){
        jsonData["articles"].forEach((element){
          if(element["urlToImage"] != null && element["description"] != null){
            
            ArticleModal  articleModal = ArticleModal(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              content:  element['content']

            );

            news.add(articleModal);
          }

        });
      }
  }
}


class CategoryNews {
  List<ArticleModal> news = [];

  Future<void> getNews(String category) async{
    String url =
      "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=78bd7dbf572c4d06b799e9f970651f21";


      var response = await http.get(url);

      var jsonData = jsonDecode(response.body);

      if(jsonData['status'] == "ok"){
        jsonData["articles"].forEach((element){
          if(element["urlToImage"] != null && element["description"] != null){
            
            ArticleModal  articleModal = ArticleModal(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              content:  element['content']

            );

            news.add(articleModal);
          }

        });
      }
  }
}

