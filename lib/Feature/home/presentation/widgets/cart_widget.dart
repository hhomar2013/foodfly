import 'package:flutter/material.dart';
import 'package:foodfly/Feature/home/presentation/widgets/cart_body.dart';
import 'package:foodfly/Feature/home/presentation/widgets/scaffold_cart.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCart(CartBody());
  }
}
