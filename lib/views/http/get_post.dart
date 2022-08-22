import 'package:flutter/material.dart';

import '../../data/model/data_model.dart';
import '../../data/provider/http/http.dart';

class GetPost extends StatefulWidget {
  const GetPost({Key? key}) : super(key: key);

  @override
  State<GetPost> createState() => _GetPostState();
}

class _GetPostState extends State<GetPost> {
  late final TextEditingController _postId;
  var requesting = false;
  PostClient postClient = PostClient();
  bool isGetPost = false;
  late Future<PostModel> postModel;
  bool error = false;

  @override
  void initState() {
    _postId = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
  _postId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get Post'
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          if(isGetPost)
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _postId,
              decoration: const InputDecoration(
                hintText: 'enter your post id'
              ),
            ),
          ),
          Visibility(
            visible: error,
              child: Text('Error: Invalid Input')
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  String postId = _postId.text;
                  int checkTextInput(){
                    try{
                      int intPostId = int.parse(postId);
                      setState((){
                        error = false;
                      });
                      return intPostId;
                    }catch(e){
                      setState((){
                        error = true;
                      });
                      throw Exception('');
                    }
                  }
                  postModel = postClient.fetchPost(checkTextInput());
                  setState(() {
                    isGetPost = true;
                    _postId.clear();
                  });
                },
                child: const Text(
                  'Get Post',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    isGetPost = false;
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
    );
  }
}
