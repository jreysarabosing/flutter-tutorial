import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'postList.dart';
import 'textInputWidget.dart';
import 'post.dart';
import 'database.dart';

class MyHomePage extends StatefulWidget {
  final User user;

  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    post.setId(savePost(post));
    this.setState(() {
      posts.add(post);
    });
  }

  void updatePostFeed() {
    getAllPosts().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updatePostFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Post Feed')),
        body: Column(children: <Widget>[
          Expanded(child: PostList(this.posts, widget.user)),
          TextInputWidget(this.newPost)
        ]));
  }
}
