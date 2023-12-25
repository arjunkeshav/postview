
import 'dart:convert';

PostImage postImageFromJson(String str) => PostImage.fromJson(json.decode(str));

String postImageToJson(PostImage data) => json.encode(data.toJson());

class PostImage {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PostImage({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PostImage.fromJson(Map<String, dynamic> json) => PostImage(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
