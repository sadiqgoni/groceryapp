import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../component/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>
            const CartPage()
        )
        );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag_outlined),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Good Morning"),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Let\'s order fresh items for you ',
                      style: GoogleFonts.notoSerif(
                          fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Fresh Items",
                      style: TextStyle(fontSize: 16),
                    ),

                  ],
                ),
              ),
              Expanded(
                  child: Consumer<CartModel>(builder: (context,value,child)=>
                      GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.4,
                          ),
                          itemCount: value.shopItems.length,
                          padding: const EdgeInsets.all(12),
                          itemBuilder: (context, index) {
                            return GroceryItemTile(
                              itemName: value.shopItems[index][0],
                              itemPrice: value.shopItems[index][1],
                              itemPath:value.shopItems[index][2],
                              color: value.shopItems[index][3],
                              onPressed: () {
                                Provider.of<CartModel> (context, listen:false).addItemToCart(index);
                              },
                            );
                          })
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
