import 'package:flutter/material.dart';
import 'package:provider1/invoice_model.dart';
import 'invoice.dart';
import 'package:provider/provider.dart';
class DetailsPage extends StatelessWidget {

  int totalQuantity = 0;
  double totalPrice = 0;
  void calc(BuildContext context) {
    Invoice inv = context.read<InvoiceModel>().selectedInvoice;
    //or
    //Invoice inv = Provider.of<InvoiceModel>(context,listen: false).selectedInvoice;
    inv.products.forEach((element) {
      totalQuantity += element.quantity;
      totalPrice += element.quantity*element.price;
    });
  }
  @override
  Widget build(BuildContext context) {
    calc(context);
    return Consumer<InvoiceModel>(
      builder: (context, value, child) =>
          Scaffold(
            appBar: AppBar(
              title: Text(value.selectedInvoice.customerName),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Invoice# ${value.selectedInvoice.invoiceNo}\n Products:',style: TextStyle(fontSize: 25.0)),
                SizedBox(height: 15.0,),
                Container(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: value.selectedInvoice.products.length,
                    itemBuilder: (context, index) {
                      return Text(
                          '${index+1}- ${value.selectedInvoice.products[index].pname}, '
                              'Price: ${value.selectedInvoice.products[index].price}, '
                              'Quantity: ${value.selectedInvoice.products[index].quantity}',
                          style: TextStyle(fontSize: 18.0));
                    },
                  ),
                ),
                Text('Total price: $totalPrice\n'
                    'Total Quantity: $totalQuantity',
                    style: TextStyle(fontSize: 25.0)),
              ],
            ),
          )
    );
  }
}
