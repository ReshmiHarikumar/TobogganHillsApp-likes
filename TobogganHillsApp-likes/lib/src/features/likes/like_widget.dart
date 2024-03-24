import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/features/common/hill_model.dart';
import 'package:toboggan_hills/src/features/common/hill_service.dart';

class LikeWidget extends StatelessWidget {
  const LikeWidget({
    super.key,
    required this.item,
    required this.user,
    required this.hillService,
  });
  final HillService hillService;
  final HillSite item;
  final User user;
  final likedByUser = false;
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = user.profile.email != null;

    void loggedOutOnpressed() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Log In to Like!"),
          duration: Duration(seconds: 1),
        ),
      );
    }

    void onPressed() {
      //Check if user is already there in items
      if (item.likedBy.contains(user.id)) {
        hillService.updateLike(item, user.id, true);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Liked"),
          duration: Duration(seconds: 1),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("${item.likeCount}"),
        IconButton(
          icon: Icon(Icons.thumb_up,
              color: likedByUser
                  ? Colors.blue
                  : null), // Use thumbs up icon for "like"
          onPressed: isLoggedIn ? onPressed : loggedOutOnpressed,
        ),
      ],
    );
  }
}
