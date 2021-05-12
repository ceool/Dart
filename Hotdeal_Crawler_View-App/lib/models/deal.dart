class Deal {
  String link;
  String imageUrl;
  String title;
  int replyCount;
  int upCount;
  String createdAt;

  Deal(
      {this.link,
      this.imageUrl,
      this.title,
      this.replyCount,
      this.upCount,
      this.createdAt});

  Deal.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    imageUrl = json['image_url'];
    title = json['title'];
    replyCount = json['reply_count'];
    upCount = json['up_count'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['reply_count'] = this.replyCount;
    data['up_count'] = this.upCount;
    data['created_at'] = this.createdAt;
    return data;
  }
}
