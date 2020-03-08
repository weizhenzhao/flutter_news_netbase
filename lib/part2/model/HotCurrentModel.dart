import 'package:flutter/material.dart';
import 'dart:convert';

//封装解析json 只需要传入json字符串即可
HotCurrentModel videoModuleFromJson(String str) =>
    HotCurrentModel.fromJson(json.decode(str));

class HotCurrentModel {
  List<Data> data;

  HotCurrentModel({this.data});

//  HotCurrent.fromJson(Map<String, dynamic> json) {
//    if (json['data'] != null) {
//      data = new List<Data>();
//      json['data'].forEach((v) {
//        data.add(new Data.fromJson(v));
//      });
//    }
//  }

  //改造成factory函数
  factory HotCurrentModel.fromJson(Map<String, dynamic> json) {
    return HotCurrentModel(
        data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String type;
  String sourceId;
  String articleId;
  String updateTime;
  String modifyTime;
  String url;
  String title;
  String source;
  String img;
  String postid;
  String hotPoints;
  String commentCount;
  String votecount;
  String replyCount;

  Data(
      {this.type,
      this.sourceId,
      this.articleId,
      this.updateTime,
      this.modifyTime,
      this.url,
      this.title,
      this.source,
      this.img,
      this.postid,
      this.hotPoints,
      this.commentCount,
      this.votecount,
      this.replyCount});

//  Data.fromJson(Map<String, dynamic> json) {
//    type = json['type'];
//    sourceId = json['sourceId'];
//    articleId = json['article_id'];
//    updateTime = json['update_time'];
//    modifyTime = json['modify_time'];
//    url = json['url'];
//    title = json['title'];
//    source = json['source'];
//    img = json['img'];
//    postid = json['postid'];
//    hotPoints = json['hotPoints'];
//    commentCount = json['commentCount'];
//    votecount = json['votecount'];
//    replyCount = json['replyCount'];
//  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      type: json['type'],
      sourceId: json['sourceId'],
      articleId: json['article_id'],
      updateTime: json['update_time'],
      modifyTime: json['modify_time'],
      url: json['url'],
      title: json['title'],
      source: json['source'],
      img: json['img'],
      postid: json['postid'],
      hotPoints: json['hotPoints'],
      commentCount: json['commentCount'],
      votecount: json['votecount'],
      replyCount: json['replyCount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['sourceId'] = this.sourceId;
    data['article_id'] = this.articleId;
    data['update_time'] = this.updateTime;
    data['modify_time'] = this.modifyTime;
    data['url'] = this.url;
    data['title'] = this.title;
    data['source'] = this.source;
    data['img'] = this.img;
    data['postid'] = this.postid;
    data['hotPoints'] = this.hotPoints;
    data['commentCount'] = this.commentCount;
    data['votecount'] = this.votecount;
    data['replyCount'] = this.replyCount;
    return data;
  }
}
