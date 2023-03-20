import 'package:flutter/material.dart';
import 'package:shoes_shop/widget/shake_transition.dart';
import 'package:shoes_shop/widget/shoes_size_item_widget.dart';

import '../data/local/data.dart';

class NikeShoesDetails extends StatelessWidget {
  final NikeShoes shoes;

  final ValueNotifier<bool> notifierBottomVisible = ValueNotifier(false);

  NikeShoesDetails({Key? key, required this.shoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierBottomVisible.value = true;
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/nike_logo.png",
          height: 40,
          color: Colors.black,
        ),
        actions: const [
          BackButton(
            color: Colors.black,
          )
        ],
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Column(
              children: [
                _buildCarousel(shoes: shoes, size: size),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ShakeTransition(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              shoes.model,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            Spacer(),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$" + shoes.oldPrice.toString(),
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 13,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  Text(
                                    "\$" + shoes.currentPrice.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ShakeTransition(
                        duration: Duration(milliseconds: 1100),
                        child: Text(
                          'AVAILABLE SIZES',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ShakeTransition(
                        duration: Duration(milliseconds: 1100),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            ShoesSizeItem(text: "6"),
                            ShoesSizeItem(text: "7"),
                            ShoesSizeItem(text: "8"),
                            ShoesSizeItem(text: "9"),
                            ShoesSizeItem(text: "10"),
                            ShoesSizeItem(text: "11"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'DESCRUPTION',
                        style: TextStyle(fontSize: 11),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: notifierBottomVisible,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "fave_1",
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    FloatingActionButton(
                      heroTag: "fave_2",
                      backgroundColor: Colors.black,
                      onPressed: () {},
                      child: Icon(Icons.shopping_cart),
                    )
                  ],
                ),
              ),
              builder: (context, value, child) {
                return AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: 0,
                    right: 0,
                    bottom: value ? 0.0 : -kToolbarHeight,
                    child: child!);
              })
        ],
      ),
    );
  }

  Widget _buildCarousel({required NikeShoes shoes, required Size size}) {
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: shoes.color,
              child: Container(
                color: shoes.color,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 20,
            child: Hero(
              tag: shoes.model,
              child: ShakeTransition(
                offset: 30,
                axis: Axis.vertical,
                duration: Duration(milliseconds: 1400),
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(
                      shoes.modelNumber.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.05)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: shoes.images.length,
              itemBuilder: (context, index) {
                final tag = index == 0 ? "${shoes.images.first}" : "";
                return Container(
                  alignment: Alignment.center,
                  child: ShakeTransition(
                    axis: Axis.vertical,
                    offset: 10,
                    duration: index==0?Duration(milliseconds: 900):Duration.zero,
                    child: Hero(
                      tag: tag,
                      child: Image.asset(
                        shoes.images[index],
                        height: size.height * 0.4,
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
