import 'dart:async';

import 'package:epson_epos_printer/epson_epos_printer.dart';
import 'package:flutter/material.dart';

class AddPrinterScreen extends StatefulWidget {
  const AddPrinterScreen({Key? key}) : super(key: key);

  @override
  _AddPrinterState createState() => _AddPrinterState();
}

class _AddPrinterState extends State<AddPrinterScreen> {
  final List<Epos2Device> _printers = [];
  String? _error;
  StreamSubscription<Epos2Device>? _subscription;
  Epos2Series series = Epos2Series.TM_T88;
  Epos2Model model = Epos2Model.ANK;

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
            ListTile(
              title: Text(series.toString()),
              onTap: _selectSeries,
            ),
            ListTile(
              title: Text(model.toString()),
            ),
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

  Future<void> _selectSeries() async {
    final series = await showDialog(
        context: context,
        builder: (c) => SimpleDialog(
              title: const Text("Series"),
              children: [
                SimpleDialogOption(
                  child: Text(Epos2Series.TM_T88.toString()),
                  onPressed: () => Navigator.pop(c, Epos2Series.TM_T88),
                ),
                SimpleDialogOption(
                  child: Text(Epos2Series.TM_U220.toString()),
                  onPressed: () => Navigator.pop(c, Epos2Series.TM_U220),
                ),
              ],
            ));

    if (series == null) return;

    setState(() {
      this.series = series;
    });
  }

  Widget _buildItem(BuildContext context, Epos2Device printer) => ListTile(
      title: Text(printer.target),
      subtitle: Text(printer.deviceName),
      onTap: () {
        final options = Epos2PrinterCreationOptions(
          series: series,
          model: model,
          target: printer.target,
        );

        Navigator.pop(context, options.toConnectionString());
      });
}
