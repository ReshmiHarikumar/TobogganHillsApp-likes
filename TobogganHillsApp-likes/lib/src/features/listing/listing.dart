import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/features/common/hill_service.dart';
import 'package:toboggan_hills/src/features/likes/like_widget.dart';
import '../common/hill_model.dart';
import '../details/page.dart';

class Listing extends StatelessWidget {
  const Listing({
    super.key,
    required this.items,
    required this.user,
    required this.hillService,
  });
  final User user;
  final RealmResults<HillSite> items;
  final HillService hillService;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            leading: CircleAvatar(
              foregroundImage: NetworkImage(item.imageUrl),
            ),
            trailing: LikeWidget(
              item: item,
              user: user,
              hillService: hillService,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(user: user, site: item),
                ),
              );
            },
          );
        });
    // return StreamBuilder(
    //   stream: _controller.stream,
    //   builder: (context, snapshot) {
    //     if (!snapshot.hasData) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else {
    //       final List<HillSite>? data = snapshot.data;
    //       return ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: data?.length ?? 0,
    //         itemBuilder: (context, index) {
    //           final item = data?[index];
    //           if (item != null) {
    //             return ListTile(
    //               title: Text(item.name),
    //               leading: CircleAvatar(
    //                 foregroundImage: NetworkImage(item.imageUrl),
    //               ),
    //               trailing: IconButton(
    //                 icon: Icon(Icons.thumb_up,
    //                     color: true
    //                         ? Colors.blue
    //                         : null), // Use thumbs up icon for "like"
    //                 onPressed: () {
    //                   if (!false) {
    //                     // item.likeCount++; // Increment like count
    //                     // item.liked = true; // Set liked status to true
    //                   } else {
    //                     // item.likeCount--; // Decrement like count
    //                     // item.liked = false; // Set liked status to false
    //                   }
    //                   ScaffoldMessenger.of(context).showSnackBar(
    //                     SnackBar(
    //                       content: Text(true
    //                           ? '${item.name} Liked!'
    //                           : '${item.name} Unliked!'),
    //                       duration: Duration(seconds: 1),
    //                     ),
    //                   );
    //                   // Update the data in the stream
    //                 },
    //               ),
    //               onTap: () {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) => Details(site: item),
    //                   ),
    //                 );
    //               },
    //             );
    //           } else {
    //             return SizedBox.shrink();
    //           }
    //         },
    //       );
    //     }
    //   },
    // );
  }
}
