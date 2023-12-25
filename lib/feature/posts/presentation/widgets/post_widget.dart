import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/post_with_images.dart';

class PostWidget extends StatelessWidget {
  final PostWithImage postWithImage;

  const PostWidget({Key? key, required this.postWithImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 2, offset: Offset(1, 1))]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  postWithImage.post.title,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                )),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    height: 100,
                    width: 100,
                    child: postWithImage.imageLoaded
                        ? CachedNetworkImage(
                            imageUrl: postWithImage.imageUrl,
                            progressIndicatorBuilder: (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ))
                        : const Icon(Icons.not_interested)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(postWithImage.post.body, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 20,
            ),
            const Text("READ MORE", style: TextStyle(fontSize: 19, color: Colors.blue, fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
