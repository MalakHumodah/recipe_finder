import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? radius;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height ?? 100,
      width: width ?? 100,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 0),
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.fill,
            ),
          ),
        );
      },
      placeholder: (context, url) => LinearProgressIndicator(value: 1,),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
