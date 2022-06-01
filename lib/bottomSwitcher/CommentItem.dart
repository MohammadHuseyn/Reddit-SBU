import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mu/Classes/CommentClass.dart';

class CommentItem extends StatelessWidget {
  CommentItem({
    this.comment
});
  CommentClass comment;
  @override
  Widget build(BuildContext context) {
    String ago;
    if (comment.dateCreated.difference(DateTime.now()).inDays.abs() >= 30)
      ago = (comment.dateCreated.difference(DateTime.now()).inDays.abs().toInt() %
          30 +
          1)
          .toString() +
          " month(s)";
    else if (comment.dateCreated.difference(DateTime.now()).inDays.abs() >= 7)
      ago = (comment.dateCreated.difference(DateTime.now()).inDays.abs().toInt() %
          7 +
          1)
          .toString() +
          " week(s)";
    else if (comment.dateCreated.difference(DateTime.now()).inDays.abs() > 0)
      ago = (comment.dateCreated.difference(DateTime.now()).inDays.abs())
          .toString() +
          " day(s)";
    else if (comment.dateCreated.difference(DateTime.now()).inHours.abs() > 0)
      ago = (comment.dateCreated.difference(DateTime.now()).inHours.abs())
          .toString() +
          " hour(s)";
    else if (comment.dateCreated.difference(DateTime.now()).inMinutes.abs() > 0)
      ago = (comment.dateCreated.difference(DateTime.now()).inMinutes.abs())
          .toString() +
          " minute(s)";
    else
      ago = (comment.dateCreated.difference(DateTime.now()).inSeconds.abs())
          .toString() +
          " second(s)";
    ago += " ago, ";
    return ListTile(
      title: Text(comment.comment),
      leading: CircleAvatar(backgroundImage: AssetImage(comment.owner.avatarDirectory),),
      subtitle: Text(comment.owner.username + ", " + ago),
    );
  }
}
