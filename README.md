# epson_epos_printer (WIP)

Yet another Flutter plugin for EPSON ePOS API, which enable flutter app to discover and interact with Epson ePOS compatible printers and other peripherals

## Why another Epson ePOS plugin?

Compare to [Epson ePOS plugin](https://pub.dev/packages/epson_epos):

* `epson_epos` only support Android (for now), and this plugin supports iOS
* Different philosophy behind the API design:
  * This plugin API follows the standard OO based design, you will have a `Epos2Printer` object, and you can call method on it, you know the common thing.
  * This plugin follows standard async pattern, stream for discovery result, stream for status monitoring, async action as future (not via callback)

## Platform Support

- iOS
- Android (yet to come)

## Supported Printer Models

- Single-function models
  - TM-m10
  - TM-m30
  - TM-m30II
  - TM-m30II-H
  - TM-m30II-NT
  - TM-m30II-S
  - TM-m30II-SL
  - TM-m50
  - TM-T20
  - TM-T20II
  - TM-T20III
  - TM-T20IIIL
  - TM-T20X
  - TM-T60
  - TM-T70
  - TM-T70II
  - TM-T81II
  - TM-T81III
  - TM-T82
  - TM-T82II
  - TM-T82III
  - TM-T82IIIL
  - TM-T82X
  - TM-T83III
  - TM-T88V
  - TM-T88VI
  - TM-T88VII
  - TM-T100
  - TM-L90 Liner-Free Label Printer Model
  - TM-L100
  - TM-U220
  - TM-U330
- Mobile models
  - TM-P20
  - TM-P60
- Hybrid models [NOT SUPPORTED]
  - TM-H6000V [NOT SUPPORTED]
- TM-i Series
  - TM-T20II-i
  - TM-T70-i (TM-i firmware Ver. 4.0 or later)
  - TM-T82II-i
  - TM-T83II-i
- TM-DT Series
  - TM-T70II-DT
  - TM-T70II-DT2
  - TM-T88V-DT
  - TM-P60II
  - TM-P80
  - TM-T88V-i (TM-i firmware Ver. 4.0 or later)
  - TM-T88VI-iHUB
  - TM-U220-i
  - TM-T88VI-DT2
  - TM-H6000IV-DT

## Usage

### Find printer

```dart
  final discoveryStream = discoverEpos2Devices(
    const Epos2FilterOption() // Hard coded to find printer via TCP for now
  );
  discoveryStream.listen(
    (Epos2Device printer) {
      // Dos something to new printer
      // printer.target is used to connect to the printer.
      final creationOptions = Epos2PrinterCreationOptions(
          series: Epos2Series.TM_T88,
          model: Epos2Model.ANK,
          target: printer.target,
      );

      final connectionString = creationOptions.toConnectionString(); // Can be saved and used to connect to printer in the future

      Navigator.pop(context, connectionString);
    },
    onError: (Object error, StackTrace stackTrace) {
      print(error);
    }
  );
```

### Control printer

```dart
  final options = Epos2PrinterCreationOptions.from(connectionString);
  final printer = await Epos2Printer.createFromOptions(options);

  try {
    await printer.connect(); // Connect to printer, it would wait until timeout or connected

    await printer.addTextStyle(bold: true);
    await printer.addTextSize(width: 2, height: 2);

    await printer.addTextLn("Hello Epson");

    await printer.addCut(Epos2Cut.CUT_FEED); // Add paper cut

    final status = await printer.sendData(); // Future is only resolved after the printing job is done or failed

    print(status); // find out the printer status after print.

    await printer.disconnect(); // Disconnect after done (disconnect while printing in progress would cause error)
  } catch (error, stackTrace) {
      await printer.clearCommandBuffer(); // Clear buffer to reset the printer state

      final errorMessage = "$error\n$stackTrace";

      print("Error: $errorMessage");
  }

  printer.dispose(); // Properly release the native resource
```

## ROADMAP

iOS

[ ] Discovery
  [x] TCP
  [ ] Bluetooth
  [ ] USB

[ ] Printer Control
  [x] Multiple printer control
  [ ] Threading issue

  [x] connect
  [x] disconnect

  [x] sendData (async status returned via Future not callback!)
  [x] clearCommandBuffer

  [x] addTextAlign
  [x] addLineSpace
  [x] addTextRotate
  [x] addText
  [x] addTextLang
  [x] addTextFont
  [x] addTextSmooth
  [x] addTextSize
  [x] addTextStyle
  [x] addHPosition

  [x] addFeedUnit
  [x] addFeedLine

  [x] addCut

  [x] statusStream

Android
[ ] Yet to come
