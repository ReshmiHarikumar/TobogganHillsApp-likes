// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Comment extends _Comment with RealmEntity, RealmObjectBase, RealmObject {
  Comment(
    ObjectId id,
    String username,
    String content,
    String siteId,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'username', username);
    RealmObjectBase.set(this, 'content', content);
    RealmObjectBase.set(this, 'siteId', siteId);
  }

  Comment._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get username =>
      RealmObjectBase.get<String>(this, 'username') as String;
  @override
  set username(String value) => throw RealmUnsupportedSetError();

  @override
  String get content => RealmObjectBase.get<String>(this, 'content') as String;
  @override
  set content(String value) => throw RealmUnsupportedSetError();

  @override
  String get siteId => RealmObjectBase.get<String>(this, 'siteId') as String;
  @override
  set siteId(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Comment>> get changes =>
      RealmObjectBase.getChanges<Comment>(this);

  @override
  Comment freeze() => RealmObjectBase.freezeObject<Comment>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Comment._);
    return const SchemaObject(ObjectType.realmObject, Comment, 'Comment', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('username', RealmPropertyType.string),
      SchemaProperty('content', RealmPropertyType.string),
      SchemaProperty('siteId', RealmPropertyType.string),
    ]);
  }
}
