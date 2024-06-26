import 'dart:async';
import 'dart:typed_data';

import 'package:ledger_flutter/src/ledger.dart';
import 'package:ledger_flutter/src/ledger/ledger_operation.dart';
import 'package:ledger_flutter/src/models/ledger_device.dart';
import 'package:ledger_flutter/src/utils/buffer.dart';

Timer? _ledgerExchangeTimer;

void enableLedgerExchange() {
  _ledgerExchangeTimer = Timer.periodic(Duration(milliseconds: 1), (_) {
    // ToDo: Check incoming Pointer
  });
}

void disableLedgerExchange() {
  _ledgerExchangeTimer?.cancel();
}

Future<Uint8List> exchange(
    Ledger ledger, LedgerDevice device, Uint8List data) async {
  return ledger.sendOperation<Uint8List>(
    device,
    ExchangeOperation(
      cla: 0x00,
      ins: 0x00,
      p1: 0x00,
      p2: 0x00,
      inputData: Uint8List.fromList([]),
    ),
  );
}

class ExchangeOperation extends LedgerOperation<Uint8List> {
  final int cla;
  final int ins;
  final int p1;
  final int p2;
  final Uint8List inputData;

  ExchangeOperation({
    required this.cla,
    required this.ins,
    required this.p1,
    required this.p2,
    required this.inputData,
  });

  @override
  Future<Uint8List> read(ByteDataReader reader) async =>
      reader.read(reader.remainingLength);

  @override
  Future<List<Uint8List>> write(ByteDataWriter writer) async {
    writer
      ..writeUint8(cla)
      ..writeUint8(ins)
      ..writeUint8(p1)
      ..writeUint8(p2)
      ..writeUint8(inputData.length)
      ..write(inputData);

    return [writer.toBytes()];
  }
}
