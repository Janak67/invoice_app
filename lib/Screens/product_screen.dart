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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: Global.g1.invoicelist
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("${e['Quantity']}"),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text("${e['Name']}"),
                            const SizedBox(
                              width: 60,
                            ),
                            Text("${e['Total']}"),
                            Row(
                              children: [
                                const Text("Pcs"),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text("${e['Product']}")
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Global.g1.invoicelist.remove(e);
                                  });
                                },
                                icon: const Icon(Icons.delete)),
                          ],
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
