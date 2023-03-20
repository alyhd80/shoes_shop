import 'package:flutter/material.dart';
import 'package:shoes_shop/data/local/data.dart';

class NikeShoesItem extends StatelessWidget {
  final NikeShoes shoesItem;
  final VoidCallback? onTap;

  const NikeShoesItem({Key? key, required this.shoesItem, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: size.height * 0.4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                  child: Hero(
                tag: shoesItem.color,
                child: Container(
                  decoration: BoxDecoration(
                    color: shoesItem.color,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )),
              Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: shoesItem.model,
                    child: Material(
                      color: Colors.transparent,
                      child: SizedBox(
                          height: size.height * 0.4,
                          child: FittedBox(
                            child: Text(
                              shoesItem.modelNumber.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.05),
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  )),
              Positioned(
                  height: size.height * 0.25,
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Hero(
                    tag: shoesItem.images.first,
                    child: Image.asset(
                      shoesItem.images.first,
                      fit: BoxFit.contain,
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  )),
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.grey,
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        shoesItem.model,
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$${shoesItem.oldPrice}",
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$${shoesItem.currentPrice}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
