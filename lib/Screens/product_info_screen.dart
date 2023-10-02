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
  TextEditingController txtDiscount = TextEditingController();
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text("Invoice Generator",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                textTile(txtName, "Customer Name", TextInputType.name),
                const SizedBox(
                  height: 10,
                ),
                textTile(txtInvoice, "Invoice Number", TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                textTile(txtProduct, "Choose Product", TextInputType.name),
                const SizedBox(
                  height: 10,
                ),
                textTile(txtDiscount, "Discount", TextInputType.number),
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
                      setState(() {
                        total = double.parse(txtPrice.text) *
                            double.parse(txtQuantity.text);
                      });
                      Map m1 = {
                        "Name": txtName.text,
                        "Invoice": txtInvoice.text,
                        "Product": txtProduct.text,
                        "Discount": txtDiscount.text,
                        "Qa": txtQuantity.text,
                        "Price": txtPrice.text,
                        "Total": total,
                      };
                      Global.g1.invoicelist.add(m1);
                      Navigator.pop(context);
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

  TextField textTile(
      TextEditingController controller, String hint, TextInputType keyboard) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
        label: Text(hint),
      ),
    );
  }
}
