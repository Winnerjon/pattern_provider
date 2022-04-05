import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pattern_provider/models/post_model.dart';
import 'package:pattern_provider/pages/create_page.dart';
import 'package:pattern_provider/pages/update_page.dart';
import 'package:pattern_provider/services/http_service.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Post> posts = [];

  Future apiPostList() async{
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null) {
      posts = Network.parsePostList(response);
    }else{
      posts = [];
    }

    isLoading = false;
    notifyListeners();
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();

    var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    isLoading = false;
    notifyListeners();

    return response != null;
  }

  void apiUpdatePost(BuildContext context,Post post) async {
    var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePage(post: post,)));
    if(result != null) {
      posts.replaceRange(posts.indexOf(post), posts.indexOf(post) + 1, [result]);
      apiPostList();
    }
  }

  void apiCreatePost(BuildContext context) async {
    var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreatePage()));
    if (result != null) {
      posts.add(result as Post);
      apiPostList();
    }
  }
}