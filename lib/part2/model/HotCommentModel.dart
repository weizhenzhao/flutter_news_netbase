import 'dart:convert';

HotCommentModel hotCommentModelFromJson(String str) =>
    HotCommentModel.fromJson(json.decode(str));

class HotCommentModel {
  List<Data> data;

  HotCommentModel({this.data});

  //改造成factory函数
  factory HotCommentModel.fromJson(Map<String, dynamic> json) {
    return HotCommentModel(
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
  List<HotcommontImages> hotcommontImages;
  String hotCommontPost;
  String commentCount;
  String votecount;
  String replyCount;

  Data(
      {this.sourceId,
      this.articleId,
      this.updateTime,
      this.modifyTime,
      this.url,
      this.title,
      this.source,
      this.img,
      this.postid,
      this.hotPoints,
      this.hotcommontImages,
      this.hotCommontPost,
      this.commentCount,
      this.votecount,
      this.replyCount});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
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
        hotcommontImages: List<HotcommontImages>.from(
          json["hotcommontImages"].map((x) => HotcommontImages.fromJson(x)),
        ),
        commentCount: json['commentCount'],
        votecount: json['votecount'],
        replyCount: json['replyCount'],
        hotCommontPost: json['hotCommontPost']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.hotcommontImages != null) {
      data['hotcommontImages'] =
          this.hotcommontImages.map((v) => v.toJson()).toList();
    }
    data['hotCommontPost'] = this.hotCommontPost;
    data['commentCount'] = this.commentCount;
    data['votecount'] = this.votecount;
    data['replyCount'] = this.replyCount;
    return data;
  }
}

class HotcommontImages {
  String avatar;

  HotcommontImages({this.avatar});

//  HotcommontImages.fromJson(Map<String, dynamic> json) {
//    avatar = json['avatar'];
//  }

  factory HotcommontImages.fromJson(Map<String, dynamic> json) {
    return HotcommontImages(avatar: json['avatar']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    return data;
  }
}
