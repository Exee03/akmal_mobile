import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.parallax,
              // title: Text(
              //   'Aplikasi Utama',
              //   textAlign: ,
              //   style: Theme.of(context).textTheme.headline5?.copyWith(
              //         color: Colors.white,
              //       ),
              // ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12,
              ),
              child: Text(
                'Aplikasi Utama',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              thickness: 2,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 12),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: controller.menus.length,
                (BuildContext context, int index) {
                  final menu = controller.menus[index];
                  final size =
                      (Theme.of(context).textTheme.headline3?.fontSize ?? 80) +
                          30;

                  return Column(
                    children: [
                      Card(
                        child: InkWell(
                          onTap: menu.onPressed,
                          child: SizedBox.square(
                            dimension: size,
                            child: Center(
                              child: Icon(
                                menu.icon,
                                color: Colors.black54,
                                size: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.fontSize,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          menu.title,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
