import 'package:flutter/material.dart';

import '../Utills/global.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Manage Products",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                )
              ],
            ),
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'pdf');
                },
                icon: const Icon(Icons.picture_as_pdf))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: Global.g1.invoicelist
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Customer Name : ${e['Name']}"),
                              Text("Invoice No : ${e['Invoice']}"),
                              Text("Product Name : ${e['Product']}"),
                              Text("Discount : ${e['Discount']}%"),
                              Text("Quantity : ${e['Qa']}"),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Product Price : ${e['Price']}"),
                                  Text("Total:${e['Total']}"),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          Global.g1.invoicelist.remove(e);
                                        });
                                      },
                                      icon: const Icon(Icons.delete)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'productInfo').then((value) {
              setState(() {});
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
