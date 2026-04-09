import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/components/components.dart';
import 'package:foodfly/Feature/home/logic/cubit/cart_cubit.dart';
import 'package:foodfly/Feature/home/presentation/screens/cart_screen.dart';
import 'package:foodfly/Feature/home/presentation/widgets/home_app_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class HomeV1Screen extends StatelessWidget {
  const HomeV1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var period = DateFormat('a').format(DateTime.now());
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(children: []),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                const SizedBox(height: 20),

                Text.rich(
                  TextSpan(
                    text: 'Hey Omar, ',
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                    children: [
                      TextSpan(
                        text: period == 'AM' ? 'Good Morning!' : 'Good Afternoon!',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                defaultTextField(
                  controller: TextEditingController(),
                  type: TextInputType.text,
                  hintText: 'Search dishes, restaurants',
                  prefix: Icons.search,
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All >',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildCategoryItem(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: 5,
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget homeAppBar(BuildContext context) => Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//   child: Row(
//     children: [
//       CircleAvatar(
//         radius: 25,
//         backgroundColor: Colors.grey[100],
//         child: Builder(
//           builder: (context) {
//             return IconButton(
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               icon: const Icon(Iconsax.menu_board, color: Colors.black),
//             );
//           },
//         ),
//       ),
//       const SizedBox(width: 15),
//
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'DELIVER TO',
//               style: TextStyle(
//                 color: Colors.orange[800], // أو ColorManagement.orange
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12,
//               ),
//             ),
//             Row(
//               children: [
//                 const Text(
//                   'Halal Lab office',
//                   style: TextStyle(color: Colors.grey, fontSize: 16),
//                 ),
//                 const Icon(Icons.arrow_drop_down, color: Colors.black),
//               ],
//             ),
//           ],
//         ),
//       ),
//
//       BlocBuilder<CartCubit, CartState>(
//         builder: (context, state) {
//           var cubit = CartCubit.get(context);
//           int itemCount = cubit.cartItems.length;
//
//           return Stack(
//             alignment: Alignment.topRight,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: const BoxDecoration(
//                   color: ColorManagement.darkBlue,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   onPressed: () => {navigateTo(context, const CartScreen())},
//                   icon: Icon(
//                     Iconsax.shopping_bag,
//                     color: Colors.white,
//                     size: 28,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: const BoxDecoration(
//                     color: Colors.orange,
//                     shape: BoxShape.circle,
//                   ),
//                   constraints: BoxConstraints(minWidth: 18, minHeight: 18),
//                   child: Text(
//                     "$itemCount",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     ],
//   ),
// );

Widget buildCategoryItem() => Container(
  padding: const EdgeInsets.symmetric(horizontal: 15),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)],
  ),
  child: Row(
    children: [
      CircleAvatar(
        radius: 15,
        backgroundColor: Colors.orange[100],
        child: Text('🍕'),
      ),
      const SizedBox(width: 10),
      const Text('Hot Dog', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  ),
);
