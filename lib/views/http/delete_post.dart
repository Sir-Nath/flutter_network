import 'package:flutter/material.dart';
import '../../data/provider/http/http.dart';

class DeletePost extends StatefulWidget {
  const DeletePost({Key? key}) : super(key: key);

  @override
  State<DeletePost> createState() => _DeletePostState();
}

class _DeletePostState extends State<DeletePost> {
  late final TextEditingController _postId;
  PostClient postClient = PostClient();
  bool isDeletePost = false;
  late Future<String> result;

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
            'Delete Post'
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          if(isDeletePost)
            FutureBuilder<String>(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text('${snapshot.data}'),
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
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  int id = int.parse(_postId.text);
                  result = PostClient().deletePost(id);
                  setState((){
                    isDeletePost = true;
                    _postId.clear();
                  });
                },
                child: const Text(
                  'Delete Post',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    isDeletePost = false;
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
