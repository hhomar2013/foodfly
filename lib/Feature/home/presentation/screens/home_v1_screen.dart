import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/components/components.dart';
import 'package:foodfly/Core/util/size_config.dart';
import 'package:foodfly/Feature/home/logic/cubit/cart_cubit.dart';
import 'package:foodfly/Feature/home/presentation/screens/cart_screen.dart';
import 'package:foodfly/Feature/home/presentation/widgets/home_app_bar.dart';
import 'package:foodfly/Feature/home/presentation/widgets/offer_widget.dart';
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
                        text: period == 'AM'
                            ? 'Good Morning!'
                            : 'Good Afternoon!',
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
                    itemBuilder: (context, index) => index == 0
                        ? buildCategoryItem("All", ColorManagement.yellow)
                        : buildCategoryItem("Pizza", ColorManagement.white),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: 6,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: SizeConfig.defaultSize * 5,
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.72,
                    ),
                    itemCount: CartCubit.get(context).cartItems.length,
                    itemBuilder: (context, index) {
                      final product = CartCubit.get(context).cartItems[index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  'assets/images/Foodfly3.png',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  child: Text(
                                    "${product.price} \$",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    navigateTo(context, const CartScreen());
                                  },
                                  icon: const Icon(
                                    Iconsax.shopping_bag,
                                    color: Colors.orange,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildCategoryItem(String text, Color backGroundColor) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  decoration: BoxDecoration(
    color: backGroundColor,
    borderRadius: BorderRadius.circular(50),
    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10)],
  ),
  child: Row(
    children: [
      CircleAvatar(
        radius: 15,
        // backgroundColor: ColorManagement.gray,
        backgroundImage:
            AssetImage('assets/images/Foodfly.png') as ImageProvider,
      ),
      const SizedBox(width: 10),
      Text(
        text ?? 'Hot dog',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
          fontSize: 16,
        ),
      ),
    ],
  ),
);

Widget buildItemCard() => Container(
  margin: const EdgeInsets.only(bottom: 15),
  padding: const EdgeInsets.all(15),
  height: 100,
  decoration: BoxDecoration(
    color: ColorManagement.yellow,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10)],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: SizeConfig.defaultSize * 1,
        width: SizeConfig.defaultSize * 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManagement.orange,
        ),
      ),
      defaultLabel(
        text: 'Item Name',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: ColorManagement.darkBlue,
      ),

      // defaultLabel(text: 'info', fontSize:13,fontWeight: FontWeight.bold ,color: ColorManagement.darkBlue ),
    ],
  ),
);
