import 'package:flutter/material.dart';
import 'package:epson_epos_printer/epson_epos_printer.dart';

import 'add_printer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Epos2Printer> _printers = [];
  String? _error;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ..._buildPrinters(),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _searchPrinter,
              child: const Text("Add Printer"),
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(
                _error!,
                style: TextStyle(color: Theme.of(context).errorColor),
              ),
            ],
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _printReceipt,
              child: const Text("Print Receipt"),
            ),
          ],
        ),
      );

  Iterable<Widget> _buildPrinters() sync* {
    for (final printer in _printers) {
      yield ListTile(
        title: Text("[${printer.id}]: ${printer.series}"),
        subtitle: Text(printer.target),
        trailing: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => setState(() {
            if (_printers.remove(printer)) {
              printer.dispose();
            }
          }),
        ),
      );
    }
  }

  Future<void> _searchPrinter() async {
    final connectionString = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const AddPrinterScreen()),
    );

    if (connectionString == null) return;

    try {
      final options = Epos2PrinterCreationOptions.from(connectionString);
      final printer = await Epos2Printer.createFromOptions(options);
      setState(() {
        _printers.add(printer);
      });
    } catch (error) {
      setState(() {
        _error = error.toString();
      });
    }
  }

  void _printReceipt() {
    if (_printers.isEmpty) {
      setState(() {
        _error = "No printer selected";
      });
      return;
    }

    for (final printer in _printers) {
      printReceipt(printer);
    }
  }

  Future<void> printReceipt(Epos2Printer printer) async {
    setState(() {
      _error = null;
    });

    try {
      await printer.connect();

      // await _useLargeText(printer);

      await printer.addTextLn(DateTime.now().toIso8601String());
      await printer.addTextLn(
          "From printer ${printer.series.name} ${printer.model.name}");
      await printer.addTextLn("Target: ${printer.target}");

      // await _useNormalText(printer);

      // await printer.addTextLn(printer.toString());

      // await printer.addTextLines([
      //   "------------------------------------------",
      //   "Name:  John Smith",
      //   "Phone: (123) 456-7890",
      // ]);

      // await _useLargeText(printer);

      // await printer.addTextLn("Type:  dine-in");
      // await printer.addTextLn("Table: 18");

      // await _useNormalText(printer);

      // await printer.addTextLines([
      //   "------------------------------------------",
      //   "- Popular Bakery Set -",
      // ]);

      // await _useLargeText(printer);

      // await printer.addTextLines([
      //   "2x Mahoushoujo's Cake",
      // ]);

      // await _useNormalText(printer);
      // await _beginBold(printer);

      // await printer.addTextLines([
      //   "+ Chocolate Base",
      //   "+ Mango Jelly",
      //   "+ Strawberry Icing",
      //   "+ Magic Case",
      //   "",
      // ]);

      // await _endBold(printer);

      // await printer.addTextLn("------------------------------------------");
      // await printer.addTextAlign(Epos2Alignment.CENTER);

      // await printer.addTextLines([
      //   "Gütiokipänja Bakery",
      //   "2021-03-21 11:35 AM",
      //   "Powered by Kiki's Delivery Service",
      // ]);

      await printer.addCut(Epos2Cut.CUT_FEED);

      final status = await printer.sendData();

      setState(() {
        _error = [
          "THIS IS NO AN ERROR\n",
          status.toString(),
        ].join("\n");
      });

      await printer.disconnect();
    } catch (error, stackTrace) {
      await printer.clearCommandBuffer();
      final errorMessage = "$error\n$stackTrace";
      print("Error: $errorMessage");
      setState(() {
        _error = errorMessage;
      });
    }
  }

  Future<void> _useLargeText(Epos2Printer printer) async {
    await printer.addTextSize(width: 2, height: 2);
    await printer.addLineSpace(100);
  }

  Future<void> _useNormalText(Epos2Printer printer) async {
    await printer.addTextSize(width: 1, height: 1);
    await printer.addLineSpace(30);
  }

  Future<void> _beginBold(Epos2Printer printer) async {
    await printer.addTextStyle(bold: true);
    await printer.addLineSpace(50);
  }

  Future<void> _endBold(Epos2Printer printer) async {
    await printer.addTextStyle(bold: false);
    await printer.addLineSpace(30);
  }
}
