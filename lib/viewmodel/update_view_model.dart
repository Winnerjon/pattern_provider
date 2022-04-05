import 'package:flutter/cupertino.dart';
import 'package:pattern_provider/models/post_model.dart';
import 'package:pattern_provider/services/http_service.dart';

class UpdateModel extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  bool isLoading = false;
  late Post post;


  apiCreatePost(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    String title = titleController.text.trim().toString();
    String notes = notesController.text.trim().toString();

    Post postUpdate = Post(title: title,body: notes,id: post.id,userId: post.userId);
    Network.PUT(Network.API_UPDATE,Network.paramsUpdate(post));
    Navigator.pop(context,postUpdate);

    isLoading = true;
    notifyListeners();
  }
}