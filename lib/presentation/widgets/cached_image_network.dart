import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget(
      {super.key,
      required this.imgUrl,
      this.imgHeight,
      this.imgWidth,
      this.boxFit});
  final String imgUrl;
  final double? imgHeight;
  final double? imgWidth;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      height: imgHeight ?? size.height,
      width: imgWidth ?? size.width,
      imageUrl: imgUrl, //?? ,
      fit: boxFit ?? BoxFit.cover,
      filterQuality: FilterQuality.high,
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
