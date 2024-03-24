import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/features/common/hill_model.dart';

class HillService {
  final User user;
  late final Realm realm;

  HillService(this.user) {
    realm = openRealm();
  }

  Realm openRealm() {
    var realmConfig = Configuration.flexibleSync(user, [HillSite.schema]);
    var realm = Realm(realmConfig);
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<HillSite>());
    });
    return realm;
  }

  RealmResults<HillSite> getItems() {
    return realm.all<HillSite>();
  }


// Update likes
    updateLike(HillSite hill, String userId, bool liked) {
    if (liked) {
      hill.likeCount -= 1;
    } else {
      hill.likeCount += 1;
      hill.likedBy.add(userId);
    }

    realm.write(() {
      realm.add<HillSite>(hill, update: true);
    });
  }
}
