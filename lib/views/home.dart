import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsApp/helper/data.dart';
import 'package:newsApp/helper/news.dart';
import 'package:newsApp/modals/article_modal.dart';
import 'package:newsApp/modals/category_modal.dart';
import 'package:newsApp/views/category_news.dart';
import 'package:newsApp/views/article_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModal> categories = new List<CategoryModal>();
  List<ArticleModal> articles = new List<ArticleModal>();

  bool loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategory();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            )
          ]),
        ),
        body: loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Column(
                    children: [
                      ///Catgories
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 70,
                        child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageAssetUrl,
                                categoryName: categories[index].categorieName,
                              );
                            }),
                      ),

                      ///News
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: articles.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(), // for scrolling
                            itemBuilder: (context, index) {
                              return BlogTile(
                                url: articles[index].url,
                                imageUrl: articles[index].urlToImage ?? "",
                                title: articles[index].title ?? "",
                                descrption: articles[index].description ?? "",
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ));
  }
}

class CategoryTile extends StatelessWidget {
  final  String imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder:(context) => CatgegoryNews(
            category: categoryName.toString().toLowerCase(),
        
          )

    ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 60,
                  width: 120,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              height: 60,
              width: 120,
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, descrption, url;

  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.descrption,
      @required this.url
      });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(imageUrl: url,)
        ));
      },
          child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              descrption,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
