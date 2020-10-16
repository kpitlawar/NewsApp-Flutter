import 'package:flutter/material.dart';
import 'package:newsApp/helper/news.dart';
import 'package:newsApp/modals/article_modal.dart';
import 'package:newsApp/views/article_view.dart';

class CatgegoryNews extends StatefulWidget {
  final String category;
  CatgegoryNews({this.category});

  @override
  _CatgegoryNewsState createState() => _CatgegoryNewsState();
}

class _CatgegoryNewsState extends State<CatgegoryNews> {
  List<ArticleModal> articles = new List<ArticleModal>();

  bool loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category);
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
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
                      child: Container(
                   padding: EdgeInsets.all(10),
                child: Column(
                  children: [
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
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      imageUrl: url,
                    )));
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
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
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
