import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black)),
        body: Consumer<CartModel>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                              leading: Image.asset(value.cartItems[index][2]),
                              title: Text(value.cartItems[index][0]),
                              subtitle:
                                  Text('\$ ' + value.cartItems[index][1]),
                              trailing: IconButton(
                                icon: const Icon(Icons.cancel),
                                onPressed: () {
                                  Provider.of<CartModel>(context,
                                          listen: false)
                                      .removeItemFromCart(index);
                                },
                              )),
                        ),
                      );
                    }),
              ),
              Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green[600],
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(color: Colors.green[100]),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                               '\$${value.calculateTotal()}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green.shade100),
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                const Text(
                                  "Pay Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
