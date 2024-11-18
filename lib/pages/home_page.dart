import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper/pages/utills/widgest/collection_tile.dart';
import 'package:wallpaper/pages/utills/widgest/image_ti.dart';

class MyHomePage extends StatefulWidget {
  final Function(bool) onScroll;
  const MyHomePage({
    super.key,
    required this.onScroll,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) {
          _isVisible = false;
          widget.onScroll(_isVisible);
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          _isVisible = true;
          widget.onScroll(_isVisible);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [Text("Suggested"), Text("New"), Text("Populer")],
                indicatorColor: Colors.red,
                indicatorWeight: 4,
              ),
            )
          ];
        },
        body: TabBarView(
          children: [
            MasonryGridView.count(
              padding: const EdgeInsets.all(12),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemBuilder: (context, index) {
                return (index % 2) == 0
                    ? ImageTi(
                        imageUrl: "https://picsum.photos/500/1000?$index",
                        index: index,
                        extent: 300)
                    : CollectionTile(index: index, height: 150);
              },
            ),
            const SizedBox(),
            const SizedBox(),
          ],
        ),
      ),
    ));
  }
}
