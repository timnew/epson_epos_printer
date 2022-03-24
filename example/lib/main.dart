import 'dart:async';

import 'package:flutter/material.dart';

import 'package:epson_epos_printer/epson_epos_printer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Epos2Device> _printers = [];
  String? _error;
  StreamSubscription<Epos2Device>? _subscription;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
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
              ListView.builder(
                itemCount: _printers.length,
                itemBuilder: (c, i) => _buildItem(c, _printers[i]),
              ),
            ],
          ),
        ),
      );

  Widget _buildItem(BuildContext context, Epos2Device printer) => ListTile(
        title: Text(printer.target),
        subtitle: Text(printer.deviceName),
      );

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
}
