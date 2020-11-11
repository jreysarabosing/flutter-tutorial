import 'package:firebase_database/firebase_database.dart';
import 'package:tutorial/post.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost(Post post) {
  var id = databaseReference.child('post/').push();
  id.set(post.toJSON());
  return id;
}
