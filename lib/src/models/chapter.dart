class Chapter {
  int id;
  String title;
  String chapter;
  String coverImages;
  String summary;
  String characters;
  String coverCharacters;
  String publish;
  String explanation;
  String createdAt;
  String updatedAt;
  List<Theories> theories;

  Chapter(
      {this.id,
      this.title,
      this.chapter,
      this.coverImages,
      this.summary,
      this.characters,
      this.coverCharacters,
      this.publish,
      this.explanation,
      this.createdAt,
      this.updatedAt,
      this.theories});

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    chapter = json['chapter'];
    coverImages = json['cover_images'];
    summary = json['summary'];
    characters = json['characters'];
    coverCharacters = json['cover_characters'];
    publish = json['publish'];
    explanation = json['explanation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['theories'] != null) {
      theories = new List<Theories>();
      json['theories'].forEach((v) {
        theories.add(new Theories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['chapter'] = this.chapter;
    data['cover_images'] = this.coverImages;
    data['summary'] = this.summary;
    data['characters'] = this.characters;
    data['cover_characters'] = this.coverCharacters;
    data['publish'] = this.publish;
    data['explanation'] = this.explanation;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.theories != null) {
      data['theories'] = this.theories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Theories {
  int id;
  int chapterId;
  String headline;
  String theory;
  String createdAt;
  String updatedAt;
  String byAlias;
  Null byGroup;
  int status;

  Theories(
      {this.id,
      this.chapterId,
      this.headline,
      this.theory,
      this.createdAt,
      this.updatedAt,
      this.byAlias,
      this.byGroup,
      this.status});

  Theories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterId = json['chapter_id'];
    headline = json['headline'];
    theory = json['theory'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    byAlias = json['by_alias'];
    byGroup = json['by_group'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chapter_id'] = this.chapterId;
    data['headline'] = this.headline;
    data['theory'] = this.theory;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['by_alias'] = this.byAlias;
    data['by_group'] = this.byGroup;
    data['status'] = this.status;
    return data;
  }
}
