import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/features/comments/comment_model.dart';
import 'package:toboggan_hills/src/features/comments/comment_service.dart';

class CommentSection extends StatefulWidget {
  final String hillId;
  final User user;
  CommentSection({super.key, required this.hillId, required this.user});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currUser = widget.user;
    final CommentService commentService = CommentService(currUser);
    final allComments = commentService.getItems(widget.hillId);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: _buildCommentList(allComments)),
        _buildCommentInput(widget.hillId),
      ],
    );
  }

  Widget _buildCommentList(RealmResults<Comment> comments) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return _buildComment(comments[index]);
      },
    );
  }

  Widget _buildComment(Comment comment) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(comment.username.toString()),
            subtitle: Text(comment.content.toString()),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput(String hillId) {
    if (widget.user.profile.email != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: 'Add a comment...',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                // final app = App(AppConfiguration(MongoConfig.appName));
                // final user = app.currentUser;
                _addComment(widget.user.profile.email!, hillId);
              },
            ),
          ],
        ),
      );
    } else {
      return Container(
          child: Center(
              child: Text(
        "Loggin to comment",
        style: Theme.of(context).textTheme.headlineMedium,
      )));
    }
  }

  void _addComment(String userID, String hillId) {
    String newComment = _commentController.text.trim();
    if (newComment.isNotEmpty) {
      setState(() {
        final CommentService commentService = CommentService(widget.user);
        commentService.add(newComment, userID, hillId);

        //comments.add(Comment(username: 'User', content: newComment));
        _commentController.clear();
      });
    }
  }
}
