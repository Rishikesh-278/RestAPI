import 'package:http/http.dart' as http;
import 'package:restapi/models/post.dart';

class RemoteService {
  Future <List<Post>?> getPosts() async
  {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      print("yes");
      var json = response.body;
      return postFromJson(json);
    }
  }
}