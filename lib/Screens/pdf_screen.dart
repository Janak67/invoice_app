import 'package:flutter/material.dart';

import '../Utills/global.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({Key? key}) : super(key: key);

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "PDF",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Center(
                    child: Text("Janta Bazar",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                const Divider(height: 10, thickness: 3),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Central Seles Depo : plot # 11 , Block # ka, main Road-1,Section # 6, Mirpur, Dhaka 1216, Bangladesh",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const Text(
                  "Tel : 8160085327",
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  "Mobile : 8160085327",
                  style: TextStyle(fontSize: 20),
                ),
                const Divider(height: 10),
                Column(
                  children: [
                    const Text(
                      "Customer Name : Janak",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Customer Address : Varachha ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Area Name : A.k.road ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      height: 15,
                    ),
                    Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Product Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Spacer(),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Spacer(),
                            Text(
                              "Price",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Spacer(),
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                        Column(
                          children: Global.g1.invoicelist
                              .map(
                                (e) => Row(
                                  children: [
                                    Text(
                                      "${e['Product']}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${e['Qa']}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                   const Spacer(),
                                    Text(
                                      "${e['Price']}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${e['Total']}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
