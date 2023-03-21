import 'package:flutter/material.dart';
import 'package:shoes_shop/data/local/data.dart';

const _buttonSize = 160.0;
const _buttonCircularSize = 60.0;

class NikeShoppingCart extends StatefulWidget {
  final NikeShoes shoes;

  const NikeShoppingCart({Key? key, required this.shoes}) : super(key: key);

  @override
  State<NikeShoppingCart> createState() => _NikeShoppingCartState();
}

class _NikeShoppingCartState extends State<NikeShoppingCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animationButton1;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animationButton1 = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(curve: const Interval(0.0, 0.2), parent: _controller));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      color: Colors.black87,
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Stack(
                      children: [
                        _buildPanel(context),
                        Positioned(
                          bottom: 40,
                          left: size.width * 0.27,
                          child: TweenAnimationBuilder(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                            tween: Tween(begin: 1.0, end: 0.0),
                            builder: (context, value, child) {
                              return Transform.translate(
                                offset: Offset(0.0, value * size.height * 0.6),
                                child: child,
                              );
                            },
                            child: GestureDetector(
                              onTap: () {
                                _controller.forward();
                              },
                              child: Container(
                                width: (_buttonSize * _animationButton1.value)
                                    .clamp(_buttonCircularSize, _buttonSize),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "ADD TO CART",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            );
          }),
    );
  }

  Widget _buildPanel(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, value * size.height * 0.6),
          child: child,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        height: size.height * .6,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image.asset(
                    widget.shoes.images.first,
                    height: size.width * 0.5,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(widget.shoes.model,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10)),
                      Text(
                        "\$" + widget.shoes.currentPrice.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
