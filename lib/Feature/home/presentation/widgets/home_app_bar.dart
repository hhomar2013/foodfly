import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/components/components.dart';
import 'package:foodfly/Feature/home/logic/cubit/cart_cubit.dart';
import 'package:foodfly/Feature/home/presentation/screens/cart_screen.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[100],
            child: Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Iconsax.clock, color: Colors.black),
                );
              },
            ),
          ),
          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DELIVER TO',
                  style: TextStyle(
                    color: Colors.orange[800], // أو ColorManagement.orange
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Mtg Office',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),

          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              var cubit = CartCubit.get(context);
              int itemCount = cubit.cartItems.length;

              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: ColorManagement.darkBlue,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => {navigateTo(context, const CartScreen())},
                      icon: Icon(
                        Iconsax.shopping_bag,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(minWidth: 18, minHeight: 18),
                      child: Text(
                        "$itemCount",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
