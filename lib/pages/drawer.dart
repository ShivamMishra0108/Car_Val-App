
import 'package:car_val/components/listTile.dart';
import 'package:car_val/components/logout.dart';
import 'package:car_val/pages/prediction.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                child: Center(
                  child: Image.asset('assets/images/swiftcar.webp'),
                ),
              ),

              const SizedBox(height: 25),

              // shop tile
              Listtile(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // cart tile
              Listtile(
                text: "Ask AI",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);

                  // goint to the cart
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => PredictionPage()),
                  // );
                },
              ),
            ],
          ),

          
          Padding(
            padding: const EdgeInsets.all(25),
            child: Listtile(
              text: "Logout",
              icon: Icons.logout,
              onTap: () {
                logout(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
