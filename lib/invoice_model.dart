import 'package:flutter/cupertino.dart';
import 'invoice.dart';

class InvoiceModel extends ChangeNotifier {
  int _selectedIndex = 0;
  List<Invoice> _invoices = [];
  void addInvoice(Invoice invoice) {
    _invoices.add(invoice);
    notifyListeners();
  }
  int get length => _invoices.length;
  Invoice getInvoice(int index) => _invoices[index];


  set selectedIndex(int value) => _selectedIndex = value;

  Invoice get selectedInvoice => _invoices[_selectedIndex];

}