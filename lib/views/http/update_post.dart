import 'package:flutter/material.dart';
import 'package:flutter_network/data/provider/http/http.dart';
import '../../data/model/data_model.dart';

class UpdatePost extends StatefulWidget {
  const UpdatePost({Key? key}) : super(key: key);

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  bool isUpdatePost = false;
  late final TextEditingController _userId;
  late final TextEditingController _title;
  late final TextEditingController _body;
  late final TextEditingController _id;
  late Future<PostModel> postModel;

  @override
  void initState() {
    _body = TextEditingController();
    _title = TextEditingController();
    _userId = TextEditingController();
    _id = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _body.dispose();
    _title.dispose();
    _userId.dispose();
    _id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Update Post'
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _id,
              decoration: const InputDecoration(
                  hintText: 'Id'
              ),
            ),
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
            if(isUpdatePost)
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
                    int id =int.parse(_id.text);
                    int userId = int.parse(_userId.text);
                    String title = _title.text;
                    String body = _body.text;
                    postModel = PostClient().updatePost(id,userId, title, body);
                    setState((){
                      isUpdatePost = true;
                      _body.clear();
                      _title.clear();
                      _userId.clear();
                      _id.clear();
                    });
                  },
                  child: const Text(
                    'Update Post',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    setState((){
                      isUpdatePost = false;
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
