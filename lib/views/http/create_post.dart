import 'package:flutter/material.dart';
import 'package:flutter_network/data/provider/http/http.dart';

import '../../data/model/data_model.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
bool isCreatePost = false;
late final TextEditingController _userId;
late final TextEditingController _title;
late final TextEditingController _body;
late Future<PostModel> postModel;

@override
  void initState() {
  _body = TextEditingController();
  _title = TextEditingController();
  _userId = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _body.dispose();
    _title.dispose();
    _userId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Create Post'
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _userId,
              decoration: const InputDecoration(
                hintText: 'userId'
              ),
            ),
            TextField(
              controller: _title,
              decoration: const InputDecoration(
                  hintText: 'title'
              ),
            ),
            TextField(
              controller: _body,
              decoration: const InputDecoration(
                  hintText: 'body'
              ),
            ),
            const SizedBox(height: 20,),
            if(isCreatePost)
              FutureBuilder<PostModel>(
                  future: postModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text('${snapshot.data?.id.toString()}'),
                              title: Text('${snapshot.data?.title}'),
                              subtitle: Text('${snapshot.data?.body}'),

                            )
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('$snapshot.error');
                    }
                    return const CircularProgressIndicator();
                  }),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    int userId = int.parse(_userId.text);
                    String title = _title.text;
                    String body = _body.text;
                    postModel = PostClient().createPost(userId, title, body);
                    setState((){
                      isCreatePost = true;
                      _body.clear();
                      _title.clear();
                      _userId.clear();
                    });
                  },
                  child: const Text(
                    'Create Post',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    setState((){
                      isCreatePost = false;
                    });
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
