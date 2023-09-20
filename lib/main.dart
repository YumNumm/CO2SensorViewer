import 'dart:async';
import 'dart:typed_data';

import 'package:co2_sensor_viewer/app.dart';
import 'package:flutter/material.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

void main() => runApp(const App());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UsbPort? _port;
  String _status = 'Idle';
  List<Widget> _ports = [];
  final List<Widget> _serialData = [];

  StreamSubscription<String>? _subscription;
  Transaction<String>? _transaction;
  UsbDevice? _device;

  final TextEditingController _textController = TextEditingController();

  Future<bool> _connectTo(UsbDevice? device) async {
    _serialData.clear();

    if (_subscription != null) {
      await _subscription!.cancel();
      _subscription = null;
    }

    if (_transaction != null) {
      _transaction!.dispose();
      _transaction = null;
    }

    if (_port != null) {
      await _port!.close();
      _port = null;
    }

    if (device == null) {
      _device = null;
      setState(() {
        _status = 'Disconnected';
      });
      return true;
    }

    _port = await device.create();
    if (!(await _port!.open())) {
      setState(() {
        _status = 'Failed to open port';
      });
      return false;
    }
    _device = device;

    await _port!.setDTR(true);
    await _port!.setRTS(true);
    await _port!.setPortParameters(
      115200,
      UsbPort.DATABITS_8,
      UsbPort.STOPBITS_1,
      UsbPort.PARITY_NONE,
    );

    _transaction = Transaction.stringTerminated(
      _port!.inputStream!,
      Uint8List.fromList([13, 10]),
    );

    _subscription = _transaction!.stream.listen((String line) {
      setState(() {
        _serialData.add(Text(line));
        if (_serialData.length > 20) {
          _serialData.removeAt(0);
        }
      });
    });

    setState(() {
      _status = 'Connected';
    });
    return true;
  }

  Future<void> _getPorts() async {
    _ports = [];
    final devices = await UsbSerial.listDevices();
    if (!devices.contains(_device)) {
      await _connectTo(null);
    }
    print(devices);

    for (final device in devices) {
      _ports.add(
        ListTile(
          leading: const Icon(Icons.usb),
          title: Text(device.productName!),
          subtitle: Text(device.manufacturerName!),
          trailing: ElevatedButton(
            child: Text(_device == device ? 'Disconnect' : 'Connect'),
            onPressed: () {
              _connectTo(_device == device ? null : device).then((res) {
                _getPorts();
              });
            },
          ),
        ),
      );
    }

    setState(() {
      print(_ports);
    });
  }

  @override
  void initState() {
    super.initState();

    UsbSerial.usbEventStream!.listen((UsbEvent event) {
      _getPorts();
    });

    _getPorts();
  }

  @override
  void dispose() {
    super.dispose();
    _connectTo(null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('USB Serial Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                _ports.isNotEmpty
                    ? 'Available Serial Ports'
                    : 'No serial devices available',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ..._ports,
              Text('Status: $_status\n'),
              Text('info: $_port\n'),
              ListTile(
                title: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Text To Send',
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: _port == null
                      ? null
                      : () async {
                          if (_port == null) {
                            return;
                          }
                          final data = '${_textController.text}\r\n';
                          await _port!
                              .write(Uint8List.fromList(data.codeUnits));
                          _textController.text = '';
                        },
                  child: const Text('Send'),
                ),
              ),
              Text(
                'Result Data',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ..._serialData,
            ],
          ),
        ),
      ),
    );
  }
}
