// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String username;
  final String email;
  final String profilePic;
  final String uid;
  final List followers;
  final List following;
  UserModel({
    required this.username,
    required this.email,
    required this.profilePic,
    required this.uid,
    required this.followers,
    required this.following,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? profilePic,
    String? uid,
    List? followers,
    List? following,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'profilePic': profilePic,
      'uid': uid,
      'followers': followers,
      'following': following,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      profilePic: map['profilePic'] as String,
      uid: map['uid'] as String,
      followers: List.from((map['followers'] as List)),
      following: List.from((map['following'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, profilePic: $profilePic, uid: $uid, followers: $followers, following: $following)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.profilePic == profilePic &&
        other.uid == uid &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following);
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        profilePic.hashCode ^
        uid.hashCode ^
        followers.hashCode ^
        following.hashCode;
  }
}
