import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  final int index;
  final double height;
  const CollectionTile({
    super.key,
    required this.index,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 25,
            right: 25,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 8,
                      spreadRadius: -6,
                      offset: Offset(0, 10)),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                  imageUrl: "https://picsum.photos/500/500?random=img"),
            ),
          ),
          Positioned(
            bottom: 14,
            left: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 8,
                      spreadRadius: -6,
                      offset: Offset(0, 10)),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                  imageUrl: "https://picsum.photos/500/500?random=imgg"),
            ),
          ),
          Positioned(
            bottom: 28,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 8,
                      spreadRadius: -6,
                      offset: Offset(0, 10)),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: "https://picsum.photos/500/500?random=img$index"),
            ),
          ),
          const Positioned(
            bottom: 35,
            left: 10,
            child: Icon(
              Icons.star_border_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
