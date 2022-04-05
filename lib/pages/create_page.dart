import 'package:flutter/material.dart';
import 'package:pattern_provider/viewmodel/create_view_model.dart';
import 'package:provider/provider.dart';


class CreatePage extends StatefulWidget {
  static const String id = "/detail_page";

  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateModel createModel = CreateModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => createModel,
      child: Consumer<CreateModel>(
        builder: (context,model,index) => Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  createModel.apiCreatePost(context);
                },
                child: const Text(
                  "Save", style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: TextField(
                        controller: createModel.titleController,
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
                        controller: createModel.notesController,
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

              if(createModel.isLoading) const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}