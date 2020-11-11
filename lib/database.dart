import 'package:firebase_database/firebase_database.dart';
import 'package:tutorial/post.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost(Post post) {
  var id = databaseReference.child('post/').push();
  id.set(post.toJSON());
  return id;
}

void updatePost(Post post, DatabaseReference id) {
  id.update(post.toJSON());
}

Future<List<Post>> getAllPosts() async {
  DataSnapshot dataSnapshot = await databaseReference.child('post/').once();
  List<Post> posts = [];

  if (dataSnapshot != null) {
    dataSnapshot.value.forEach((key, value) {
      Post newPost = createPost(value);
      newPost.setId(databaseReference.child('post/' + key));
      posts.add(newPost);
    });
  }

  return posts;
}
