import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/features/comments/comment_model.dart';

class CommentService {
  final User user;
  late final Realm realm;

  CommentService(this.user) {
    realm = openRealm();
  }

  Realm openRealm() {
    var realmConfig = Configuration.flexibleSync(user, [Comment.schema]);
    var realm = Realm(realmConfig);
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<Comment>());
    });
    return realm;
  }

  RealmResults<Comment> getItems(String siteId) {
    final res = realm.query<Comment>("siteId == '${siteId}'");
    return res;
    //return realm.all<Comment>();
  }

  add(String newComment, String userName, String hillId) {
    realm.write(() => {
          realm.add<Comment>(Comment(ObjectId(), userName, newComment, hillId))
        });
  }

  delete(Comment comment) {
    realm.write(() => {realm.delete(comment)});
  }
}
