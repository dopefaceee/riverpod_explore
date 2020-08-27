class Chapters {
  List<Items> items;

  Chapters({this.items});

  Chapters.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int id;
  String chapter;
  String title;

  Items({this.id, this.chapter, this.title});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapter = json['chapter'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chapter'] = this.chapter;
    data['title'] = this.title;
    return data;
  }
}
