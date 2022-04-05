import 'package:flutter/cupertino.dart';
import 'package:pattern_provider/models/post_model.dart';
import 'package:pattern_provider/services/http_service.dart';

class CreateModel extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  bool isLoading = false;


  void apiCreatePost(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    String title = titleController.text.trim().toString();
    String notes = notesController.text.trim().toString();

    Post post = Post(title: title, body: notes,userId: title.hashCode);
    await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    Navigator.pop(context,post);

    isLoading = false;
    notifyListeners();
  }
}