import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'global.dart';

void pdfGenerate() async{
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (ConText) {
        return pw.Column(
          children: [
            pw.Center(
                child: pw.Text("Janta Bazar",
                    style: pw.TextStyle(
                        fontSize: 25, fontWeight: pw.FontWeight.bold))),
            pw.Divider(height: 10, thickness: 3),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                "Central Seles Depo : plot # 11 , Block # ka, main Road-1,Section # 6, Mirpur, Dhaka 1216, Bangladesh",
                style: const pw.TextStyle(fontSize: 17),
              ),
            ),
            pw.Text(
              "Tel : 8160085327",
              style: const pw.TextStyle(fontSize: 20),
            ),
            pw.Text(
              "Mobile : 8160085327",
              style: const pw.TextStyle(fontSize: 20),
            ),
            pw.Divider(height: 10),
            pw.Column(
              children: [
                pw.Text(
                  "Customer Name : Janak",
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  "Customer Address : Varachha ",
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  "Area Name : A.k.road ",
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold),
                ),
                pw.Divider(
                  height: 15,
                ),
                pw.Column(
                  children: [
                    pw.Row(
                      children: [
                        pw.Text(
                          "Product Name",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 16),
                        ),
                        pw.Spacer(),
                        pw.Text(
                          "Quantity",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 15),
                        ),
                        pw.Spacer(),
                        pw.Text(
                          "Price",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 15),
                        ),
                        pw.Spacer(),
                        pw.Text(
                          "Total Amount",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    pw.Column(
                      children: Global.g1.invoicelist
                          .map(
                            (e) => pw.Row(
                              children: [
                                pw.Text(
                                  "${e['Product']}",
                                  style: const pw.TextStyle(fontSize: 18),
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  "${e['Qa']}",
                                  style: const pw.TextStyle(fontSize: 18),
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  "${e['Price']}",
                                  style: const pw.TextStyle(fontSize: 18),
                                ),
                                pw.Spacer(),
                                pw.Text(
                                  "${e['Total']}",
                                  style: const pw.TextStyle(fontSize: 18),
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
        );
      }));
  await Printing.layoutPdf(onLayout: (Formate) async => pdf.save());
}
