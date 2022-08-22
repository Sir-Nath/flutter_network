import "package:flutter/material.dart";
import 'create_post.dart';
import 'update_post.dart';
import 'delete_post.dart';
import 'get_post.dart';
import 'get_posts.dart';

class HttpScreen extends StatefulWidget {
  const HttpScreen({Key? key}) : super(key: key);

  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('HTTP SCREEN'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Spacer(),
            const Text('Http Practice',style: TextStyle(
              fontSize: 30
            ),),
            Spacer(),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                MaterialButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const GetPost();
                    },),);
                  },
                  child: const Text(
                    'Get Post',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return const GetPosts();
                },),);
                },
                  child: const Text(
                    'Get Post List',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const CreatePost();
                    },),);
                  },
                  child: const Text(
                    'Create Post',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const UpdatePost();
                    },),);
                  },
                  child: const Text(
                    'Update Post',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const DeletePost();
                    },),);
                  },
                  child: const Text(
                    'Delete Post',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
