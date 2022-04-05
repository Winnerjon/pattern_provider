import 'package:flutter/material.dart';
import 'package:pattern_provider/models/post_model.dart';
import 'package:pattern_provider/viewmodel/update_view_model.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {
  static const String id = "/update_post";
  Post post;

  UpdatePage({Key? key,required this.post}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateModel updateView = UpdateModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateView.post = widget.post;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => updateView,
      child: Consumer<UpdateModel>(
        builder: (context,model,index) => Scaffold(
          appBar: AppBar(
            title: Text("Update",style: TextStyle(fontSize: 20),),
            actions: [
              TextButton(
                onPressed: () {
                  updateView.apiCreatePost(context);
                },
                child: Text(
                  "Save", style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    controller: updateView.titleController..text = updateView.post.title!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    controller: updateView.notesController..text = updateView.post.body!,
                    maxLines: null,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Notes",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}