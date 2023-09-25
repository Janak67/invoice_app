import 'package:flutter/material.dart';
import 'package:invoice_app/Utills/global.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({super.key});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtInvoice = TextEditingController();
  TextEditingController txtProduct = TextEditingController();
  TextEditingController txtQuantity = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text(
            "Invoice Generator",
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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextField(
                    controller: txtName,
                    decoration: const InputDecoration(
                      hintText: "Choose Customer Name",
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      label: Text("Customer Name"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtInvoice,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Invoice No.",
                    label: Text("Invoice Number"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtProduct,
                  decoration: const InputDecoration(
                    hintText: "Choose Product",
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 160,
                      child: TextField(
                        controller: txtQuantity,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Quantity",
                          label: Text("Quantity"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 160,
                      child: TextField(
                        controller: txtPrice,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Price",
                          label: Text("Price"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Map m1 = {
                        "Name": txtName.text,
                        "Invoice":txtInvoice.text,
                        "Product":txtProduct.text,
                        "Qa":txtQuantity.text,
                        "Price":txtPrice.text,
                      };
                     Global.g1.invoicelist.add(m1);
                     Navigator.pop(context);
                      setState(() {
                        total = double.parse(txtPrice.text) *
                            double.parse(txtQuantity.text);
                      });
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                const Divider(),
                Text(
                  "Total Payble : ${total}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
