import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/features/comments/comment_widget.dart';
import 'package:toboggan_hills/src/features/common/hill_model.dart';

const Color brinjalColor = Color.fromARGB(255, 53, 28, 144);

class Details extends StatelessWidget {
  
  Details({super.key, required this.site, required this.user});
final HillSite site;
  final User user;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(site.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(site.description),
          ),
          Expanded(flex: 1, child: Image.network(site.imageUrl)),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 2,
              child: CommentSection(
                user: user,
                hillId: site.id.toString(),
              )),
        ],
      ),
    );
  }
}
