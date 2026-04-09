import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Feature/home/logic/cubit/cart_cubit.dart';
import 'package:foodfly/Feature/home/presentation/widgets/cart_widget.dart';
import 'package:foodfly/Feature/home/presentation/widgets/scaffold_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CartWidget();
  }
}
