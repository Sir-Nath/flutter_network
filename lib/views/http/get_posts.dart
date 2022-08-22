import 'package:flutter/material.dart';

import '../../data/model/data_model.dart';
import '../../data/provider/http/http.dart';

class GetPosts extends StatefulWidget {
  const GetPosts({Key? key}) : super(key: key);

  @override
  State<GetPosts> createState() => _GetPostsState();
}

class _GetPostsState extends State<GetPosts> {
  late Future<List<PostModel>> postModels;
  bool isGetPosts = false;
  PostClient postClient = PostClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Get Posts'
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          if (isGetPosts)
            FutureBuilder<List<PostModel>>(
                future: postModels,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Container(
                            height: 600,
                            child: ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Text(snapshot.data![index].id.toString()),
                                    title: Text(snapshot.data![index].title),
                                      subtitle: Text(snapshot.data![index].body),
                                  );
                                  return Text(snapshot.data![index].title);
                                }),
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
                  postModels = postClient.fetchAllPost();
                  setState(() {
                    isGetPosts = true;

                  });
                },
                child: const Text(
                  'Get Posts',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    isGetPosts = false;
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
