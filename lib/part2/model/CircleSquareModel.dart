import 'dart:convert';

CircleSquareModel circleSquareModelFromJson(String str)=>
CircleSquareModel.fromJson(json.decode(str));


class CircleSquareModel {
  List<Data> data;

  CircleSquareModel({this.data});

  CircleSquareModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
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
  String counts;
  String infos;
  List<Contents> contents;
  String totalCounts;

  Data({this.type, this.counts, this.infos, this.contents, this.totalCounts});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        type: json['type'],
        counts: json['counts'],
        infos: json['infos'],
        totalCounts: json['totalCounts'],
        contents: List<Contents>.from(
          json["contents"].map((x) => Contents.fromJson(x)),
        ));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['counts'] = this.counts;
    data['infos'] = this.infos;
    if (this.contents != null) {
      data['contents'] = this.contents.map((v) => v.toJson()).toList();
    }
    data['totalCounts'] = this.totalCounts;
    return data;
  }
}

class Contents {
  String sourceId;
  String articleId;
  String updateTime;
  String modifyTime;
  String url;
  String title;
  String img;
  String postid;
  String followCount;

  Contents(
      {this.sourceId,
      this.articleId,
      this.updateTime,
      this.modifyTime,
      this.url,
      this.title,
      this.img,
      this.postid,
      this.followCount});


  factory Contents.fromJson(Map<String, dynamic> json) {
    return Contents(
        sourceId: json['sourceId'],
        articleId: json['articleId'],
        updateTime: json['updateTime'],
        modifyTime: json['modifyTime'],
        url: json['url'],
        title: json['title'],
        img: json['img'],
        postid: json['postid'],
        followCount: json['followCount']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourceId'] = this.sourceId;
    data['article_id'] = this.articleId;
    data['update_time'] = this.updateTime;
    data['modify_time'] = this.modifyTime;
    data['url'] = this.url;
    data['title'] = this.title;
    data['img'] = this.img;
    data['postid'] = this.postid;
    data['followCount'] = this.followCount;
    return data;
  }
}
