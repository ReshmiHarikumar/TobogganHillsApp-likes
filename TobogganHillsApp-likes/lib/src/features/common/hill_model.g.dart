// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hill_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class HillSite extends _HillSite
    with RealmEntity, RealmObjectBase, RealmObject {
  HillSite(
    ObjectId id,
    String name,
    String description,
    String imageUrl,
    int likeCount, {
    Iterable<String> likedBy = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'imageUrl', imageUrl);
    RealmObjectBase.set(this, 'likeCount', likeCount);
    RealmObjectBase.set<RealmList<String>>(
        this, 'likedBy', RealmList<String>(likedBy));
  }

  HillSite._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => throw RealmUnsupportedSetError();

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) => throw RealmUnsupportedSetError();

  @override
  String get imageUrl =>
      RealmObjectBase.get<String>(this, 'imageUrl') as String;
  @override
  set imageUrl(String value) => throw RealmUnsupportedSetError();

  @override
  RealmList<String> get likedBy =>
      RealmObjectBase.get<String>(this, 'likedBy') as RealmList<String>;
  @override
  set likedBy(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get likeCount => RealmObjectBase.get<int>(this, 'likeCount') as int;
  @override
  set likeCount(int value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<HillSite>> get changes =>
      RealmObjectBase.getChanges<HillSite>(this);

  @override
  HillSite freeze() => RealmObjectBase.freezeObject<HillSite>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(HillSite._);
    return const SchemaObject(ObjectType.realmObject, HillSite, 'HillSite', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('imageUrl', RealmPropertyType.string),
      SchemaProperty('likedBy', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('likeCount', RealmPropertyType.int),
    ]);
  }
}
