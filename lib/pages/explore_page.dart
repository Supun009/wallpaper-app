import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper/pages/utills/widgest/image_ti.dart';

const double firstAppbarheight = 320;

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: firstAppbarheight,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    "https://picsum.photos/500/500?random=$index"),
                            Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      stops: [
                                    0.01,
                                    1
                                  ],
                                      colors: [
                                    Colors.black,
                                    Colors.transparent
                                  ])),
                            )
                          ],
                        );
                      },
                      itemCount: 5,
                    ),
                    Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: List.generate(
                            5,
                            (index) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ))
                  ],
                ),
              ),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: false,
              child: SliverAppBar(
                floating: true,
                snap: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12))),
                centerTitle: true,
                title: TextButton.icon(
                  onPressed: () {},
                  label: const Text("Search"),
                  icon: const Icon(Icons.search),
                  style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black),
                      iconSize: WidgetStatePropertyAll(24),
                      textStyle:
                          WidgetStatePropertyAll(TextStyle(fontSize: 20))),
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: Colors.white,
          child: MasonryGridView.count(
            padding: const EdgeInsets.all(12),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemBuilder: (context, index) {
              return ImageTi(
                  imageUrl: "https://picsum.photos/500/1000?random=$index",
                  index: index,
                  extent: (index % 2) == 0 ? 300 : 150);
            },
          ),
        ),
      ),
    );
  }
}
