import 'package:flutter/material.dart';
import 'package:shoes_shop/data/local/data.dart';

import '../widget/nike_shoes_item_widget.dart';
import 'nike_shoes_details_page.dart';

class NikeShoesStoreHome extends StatelessWidget {
  NikeShoesStoreHome({Key? key}) : super(key: key);

  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  Future<void> _onShoesPressed(NikeShoes shoes, BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context)
        .push(PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
      return FadeTransition(
        opacity: animation1,
        child: NikeShoesDetails(
          shoes: shoes,
        ),
      );
    }));

    notifierBottomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/nike_logo.png",
                  height: 40,
                ),
                Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 50),
                        physics: BouncingScrollPhysics(),
                        itemCount: Data().shoes.length,
                        itemBuilder: (context, index) {
                          final shoes = Data().shoes[index];
                          return NikeShoesItem(
                            shoesItem: shoes,
                            onTap: () {
                              _onShoesPressed(shoes, context);
                            },
                          );
                        }))
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: notifierBottomBarVisible,
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: Row(
                  children: [
                    Expanded(child: Icon(Icons.home)),
                    Expanded(child: Icon(Icons.search)),
                    Expanded(child: Icon(Icons.favorite_border)),
                    Expanded(child: Icon(Icons.shopping_cart)),
                  ],
                ),
              ),
              builder: (context, value, child) {
                return AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: 0,
                    right: 0,
                    bottom: value ? 0.0 : -kToolbarHeight,
                    height: kToolbarHeight,
                    child: child!);
              })
        ],
      ),
    );
  }
}
