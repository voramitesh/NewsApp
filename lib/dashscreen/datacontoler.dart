import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:miteshapinews/dashscreen/modeldata.dart';

class News extends GetxController{

  Future<Newsdata> Apicall()async{
    Uri uri =Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2022-06-13&sortBy=publishedAt&apiKey=c22769cb30cd47a799ab729f2803b9d9");
     var res=await http.get(uri);
     var json =jsonDecode(res.body);

     return Newsdata.fromJson(json);
  }
  
  void PostData(String name,String job)async{
    Uri uri=Uri.parse("https://reqres.in/api/users");
    var res =await http.post(uri,body: {"name":"$name","job":"$job"});
    print(res.statusCode);
    print(res.body);

  }
}