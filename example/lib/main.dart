import 'dart:async';

import 'package:flutter/material.dart';

import 'package:epson_epos_printer/epson_epos_printer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: HomeScreen(),
      );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _target;
  String? _error;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Printer: $_target"),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _searchPrinter,
              child: const Text("Search for Printer"),
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

  Future<void> _searchPrinter() async {
    final target = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const SearchPrinterScreen()),
    );

    if (target != _target) {
      setState(() {
        _target = target;
      });
    }
  }

  Future<void> _printReceipt() async {
    late final Epos2Printer printer;

    if (_target == null) {
      setState(() {
        _error = "No printer selected";
      });
      return;
    }

    setState(() {
      _error = null;
    });

    try {
      printer = await Epos2Printer.create(
        series: Epos2Series.TM_T88,
        model: Epos2Model.ANK,
      );

      await printer.connect(_target!);

      await _useLargeText(printer);

      await printer.addTextLn("11:35 AM");

      await _useNormalText(printer);

      await printer.addTextLines([
        "------------------------------------------",
        "Name:  Tim WEN",
        "Phone: +61 456 789 123",
      ]);

      await _useLargeText(printer);

      await printer.addTextLn("Type:  dine-in");
      await printer.addTextLn("Table: 18");

      await _useNormalText(printer);

      await printer.addTextLines([
        "------------------------------------------",
        "- Test Food -",
      ]);

      await _useLargeText(printer);

      await printer.addTextLines([
        "2x Test Set",
      ]);

      await _useNormalText(printer);
      await _beginBold(printer);

      await printer.addTextLines([
        "+ Pickle",
        "+ Wings",
        "+ Pork",
        "+ Whole Meal",
        "+ Drink with no ice",
        "",
      ]);

      await _endBold(printer);

      await printer.addTextLn("------------------------------------------");
      await printer.addTextAlign(Epos2Alignment.CENTER);

      await printer.addTextLines([
        "Tim's Test Home Kitchen",
        "2021-03-21 11:35 AM",
        "Powered by MrYum.com",
      ]);

      await printer.addCut(Epos2Cut.CUT_FEED);

      await printer.sendData();

      await printer.disconnect();
    } catch (error, stackTrace) {
      await printer.clearCommandBuffer();
      final errorMessage = "$error\n$stackTrace";
      print("Error: $errorMessage");
      setState(() {
        _error = errorMessage;
      });
    } finally {
      printer.dispose();
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

class SearchPrinterScreen extends StatefulWidget {
  const SearchPrinterScreen({Key? key}) : super(key: key);

  @override
  _SearchPrinterState createState() => _SearchPrinterState();
}

class _SearchPrinterState extends State<SearchPrinterScreen> {
  final List<Epos2Device> _printers = [];
  String? _error;
  StreamSubscription<Epos2Device>? _subscription;

  @override
  void initState() {
    super.initState();
    startQuery();
  }

  void startQuery() => setState(() {
        _printers.clear();
        _error = null;
        _subscription = discoverEpos2Devices(const Epos2FilterOption())
            .listen(_onDeviceDiscovered, onError: _onError);
      });

  void stopQuery() => setState(() {
        _subscription?.cancel().onError(_onError);
        _subscription = null;
      });

  void _onDeviceDiscovered(Epos2Device event) => setState(() {
        print(event);
        _printers.add(event);
      });

  void _onError(Object error, StackTrace stackTrace) {
    setState(() {
      _error = '$error\n$stackTrace';
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Search for Printer'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_subscription == null)
              ElevatedButton(
                onPressed: startQuery,
                child: const Text("Start Search"),
              )
            else
              ElevatedButton(
                onPressed: stopQuery,
                child: const Text("Stop Searching"),
              ),
            if (_error != null) Text(_error!),
            Expanded(
              child: ListView.builder(
                itemCount: _printers.length,
                itemBuilder: (c, i) => _buildItem(c, _printers[i]),
              ),
            ),
          ],
        ),
      );

  Widget _buildItem(BuildContext context, Epos2Device printer) => ListTile(
        title: Text(printer.target),
        subtitle: Text(printer.deviceName),
        onTap: () => Navigator.pop(context, printer.target),
      );
}
