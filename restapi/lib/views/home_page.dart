import 'package:flutter/material.dart';
import 'package:restapi/models/post.dart';
import 'package:restapi/services/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override void initState() {
    super.initState();
    getData();
  }

  getData() async
  {
    posts = await RemoteService().getPosts();
    if(posts != null)
      {
        setState(() {
          isLoaded = true;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(child: CircularProgressIndicator(),),
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
          return Container(
            child: Text(posts![index].title,style: TextStyle(fontSize: 22),),
          );
        }),
      ),
    );
  }
}