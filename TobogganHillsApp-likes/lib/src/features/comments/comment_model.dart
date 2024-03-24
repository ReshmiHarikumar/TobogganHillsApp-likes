import 'package:realm/realm.dart';

part 'comment_model.g.dart';

@RealmModel()
class _Comment {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late final String username;
  late final String content;
  late final String siteId;
}
