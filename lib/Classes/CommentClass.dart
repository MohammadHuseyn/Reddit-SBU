import 'Post.dart';
import 'User.dart';
class CommentClass {
  String comment;
  User owner;
  Post onPost;
  DateTime dateCreated = DateTime.now();
  CommentClass({
    this.comment,
    this.owner,
    this.onPost,
});
}