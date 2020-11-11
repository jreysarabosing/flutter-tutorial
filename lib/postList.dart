import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;
  final User currentUser;

  PostList(this.listItems, this.currentUser);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void likeClicked(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(post.body),
                  subtitle: Text(post.author),
                ),
              ),
              Row(children: <Widget>[
                Container(
                  child: Text(
                    post.usersLiked.length.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () => this
                        .likeClicked(() => post.likePost(widget.currentUser)),
                    color: post.usersLiked.contains(widget.currentUser.uid)
                        ? Colors.blue
                        : Colors.black)
              ])
            ],
          ),
        );
      },
    );
  }
}
