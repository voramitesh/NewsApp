import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:miteshapinews/dashscreen/datacontoler.dart';
import 'package:miteshapinews/dashscreen/modeldata.dart';

class DataUi extends StatefulWidget {
  const DataUi({Key? key}) : super(key: key);

  @override
  State<DataUi> createState() => _DataUiState();
}

class _DataUiState extends State<DataUi> {
  News _news= Get.put(News());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(onPressed: (){
              _news.PostData("Mitesh", "Flutter Developer");
            }, child: Text("Post Data")),
            Expanded(
              child: FutureBuilder<Newsdata>(
                future: _news.Apicall(),
                builder: (context ,snapshot){
                  if(snapshot.hasError)
                    {
                      return Center(child: Text("${snapshot.error}"));
                    }
                  else if(snapshot.hasData)
                    {
                      Newsdata newsdata = snapshot.data!;

                      return ListView.builder(itemCount:newsdata.articles.length ,itemBuilder:(context,index){
                       print(newsdata.articles[index].urlToImage);

                       return Container(
                         height: 200,
                         alignment: Alignment.center,
                         child: Column(
                           children: [
                             Container(
                             height: 120,
                           child: Image.network(newsdata.articles[index].urlToImage.toString(),fit: BoxFit.cover,),

                         ),
                             SizedBox(height: 20,),
                             Text("${newsdata.articles[index].publishedAt}"),
                             Text("${newsdata.articles[index].title}"),
                           ],
                         ),
                       );
                      },);
                    }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
