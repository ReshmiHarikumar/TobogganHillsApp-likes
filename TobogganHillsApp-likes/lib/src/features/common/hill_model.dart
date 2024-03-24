import 'package:realm/realm.dart';

part 'hill_model.g.dart';

@RealmModel()
class _HillSite {
  @PrimaryKey()
  @MapTo("_id")
  late ObjectId id;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final List<String> likedBy;
  late final int likeCount;
}
