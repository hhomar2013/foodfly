import 'package:flutter/material.dart';
import 'package:foodfly/Core/Constants/color_management.dart';
import 'package:foodfly/Core/components/components.dart';
import 'package:iconsax/iconsax.dart';

class HomeV1Screen extends StatelessWidget {
  const HomeV1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(children: [

          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homeAppBar(),

                const SizedBox(height: 20),

                const Text.rich(
                  TextSpan(
                    text: 'Hey Omar, ',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    children: [
                      TextSpan(
                        text: 'Good Afternoon!',
                        style: TextStyle(
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
                    itemBuilder: (context, index) =>
                        buildCategoryItem(), // هنعمله ويدجت
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

Widget homeAppBar() => Padding(
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
              icon: const Icon(Iconsax.menu_board, color: Colors.black),
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
                  'Halal Lab office',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ],
        ),
      ),

      // 3. أيقونة الشنطة مع الـ Badge (على اليمين)
      Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: ColorManagement.darkBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Iconsax.shopping_bag,
              color: Colors.white,
              size: 28,
            ),
          ),
          // الـ Badge البرتقالي
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: const Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);
// ويدجت المطعم الواحد

// ويدجت الكاتيجوري الواحد
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
