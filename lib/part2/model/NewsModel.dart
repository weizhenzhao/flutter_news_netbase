import 'dart:convert';

NewsModel newsModuleFromJson(String str) =>
    NewsModel.fromJson(json.decode(str));

class NewsModel {
  List<Data> data;

  NewsModel({this.data});

//  NewsModel.fromJson(Map<String, dynamic> json) {
//    if (json['data'] != null) {
//      data = new List<Data>();
//      json['data'].forEach((v) {
//        data.add(new Data.fromJson(v));
//      });
//    }
//  }

  //改造成factory函数
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      data: List<Data>.from(
        json['data'].map((x) => Data.fromJson(x)),
      ),
    );
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
  String infos;
  String subtitle;
  String source;
  String tag;
  String type;
  String thumb;
  List<Images> images;
  String postid;
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
      this.infos,
      this.subtitle,
      this.source,
      this.tag,
      this.type,
      this.thumb,
      this.images,
      this.postid,
      this.commentCount,
      this.votecount,
      this.replyCount});

//  Data.fromJson(Map<String, dynamic> json) {
//    sourceId = json['sourceId'];
//    articleId = json['article_id'];
//    updateTime = json['update_time'];
//    modifyTime = json['modify_time'];
//    url = json['url'];
//    title = json['title'];
//    infos = json['infos'];
//    subtitle = json['subtitle'];
//    source = json['source'];
//    tag = json['tag'];
//    type = json['type'];
//    thumb = json['thumb'];
//    if (json['images'] != null) {
//      images = new List<Images>();
//      json['images'].forEach((v) {
//        images.add(new Images.fromJson(v));
//      });
//    }
//    postid = json['postid'];
//    commentCount = json['commentCount'];
//    votecount = json['votecount'];
//    replyCount = json['replyCount'];
//  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        sourceId: json['sourceId'],
        articleId: json['article_id'],
        updateTime: json['update_time'],
        modifyTime: json['modify_time'],
        url: json['url'],
        title: json['title'],
        infos: json['infos'],
        subtitle: json['subtitle'],
        source: json['source'],
        tag: json['tag'],
        type: json['type'],
        thumb: json['thumb'],
        images: List<Images>.from(
          json['images'].map((x) {
            return Images.fromJson(x);
          }),
        ),
        postid: json['postid'],
        commentCount: json['commentCount'],
        votecount: json['votecount'],
        replyCount: json['replyCount']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourceId'] = this.sourceId;
    data['article_id'] = this.articleId;
    data['update_time'] = this.updateTime;
    data['modify_time'] = this.modifyTime;
    data['url'] = this.url;
    data['title'] = this.title;
    data['infos'] = this.infos;
    data['subtitle'] = this.subtitle;
    data['source'] = this.source;
    data['tag'] = this.tag;
    data['type'] = this.type;
    data['thumb'] = this.thumb;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['postid'] = this.postid;
    data['commentCount'] = this.commentCount;
    data['votecount'] = this.votecount;
    data['replyCount'] = this.replyCount;
    return data;
  }
}

class Images {
  String imgsrc;

  Images({this.imgsrc});

//  Images.fromJson(Map<String, dynamic> json) {
//    imgsrc = json['imgsrc'];
//  }

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      imgsrc: json['imgsrc'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgsrc'] = this.imgsrc;
    return data;
  }
}
