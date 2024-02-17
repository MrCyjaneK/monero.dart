// Wrapper around generated_bindings.g.dart - to provide easy access to the
// underlying functions, feel free to not use it at all.

// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:monero/src/generated_bindings.g.dart';

typedef MONERO_PendingTransaction = Pointer<Void>;

MoneroC? lib;
String libPath = 'libwallet2_api_c.so';

Map<String, List<int>> debugCallLength = {};

final defaultSeparatorStr = ";";
final defaultSeparator = defaultSeparatorStr.toNativeUtf8().cast<Char>();

final Stopwatch sw = Stopwatch()..start();

bool printStarts = false;

void Function(String call)? debugStart = (call) {
  if (printStarts) print("MONERO: $call");
  debugCallLength[call] ??= <int>[];
  debugCallLength[call]!.add(sw.elapsedMicroseconds);
};
void Function(String call)? debugEnd = (call) {
  final id = debugCallLength[call]!.length - 1;
  debugCallLength[call]![id] =
      sw.elapsedMicroseconds - debugCallLength[call]![id];
};
void Function(String call, dynamic error)? errorHandler = (call, error) {
  print("$call: $error");
};

int MONERO_PendingTransaction_status(MONERO_PendingTransaction ptr) {
  debugStart?.call('MONERO_PendingTransaction_status');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_PendingTransaction_status(ptr);
  debugEnd?.call('MONERO_PendingTransaction_status');
  return status;
}

String MONERO_PendingTransaction_errorString(MONERO_PendingTransaction ptr) {
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  debugStart?.call('MONERO_PendingTransaction_errorString');
  try {
    final errorString = lib!
        .MONERO_PendingTransaction_errorString(ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_PendingTransaction_errorString');
    return errorString;
  } catch (e) {
    errorHandler?.call('MONERO_PendingTransaction_errorString', e);
    debugEnd?.call('MONERO_PendingTransaction_errorString');
    return "";
  }
}

bool MONERO_PendingTransaction_commit(MONERO_PendingTransaction ptr,
    {required String filename, required bool overwrite}) {
  debugStart?.call('MONERO_PendingTransaction_commit');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final filename_ = filename.toNativeUtf8().cast<Char>();
  final result =
      lib!.MONERO_PendingTransaction_commit(ptr, filename_, overwrite);
  calloc.free(filename_);
  debugEnd?.call('MONERO_PendingTransaction_commit');
  return result;
}

int MONERO_PendingTransaction_amount(MONERO_PendingTransaction ptr) {
  debugStart?.call('MONERO_PendingTransaction_amount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final amount = lib!.MONERO_PendingTransaction_amount(ptr);
  debugStart?.call('MONERO_PendingTransaction_amount');
  return amount;
}

int MONERO_PendingTransaction_dust(MONERO_PendingTransaction ptr) {
  debugStart?.call('MONERO_PendingTransaction_dust');

  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final dust = lib!.MONERO_PendingTransaction_dust(ptr);
  debugStart?.call('MONERO_PendingTransaction_dust');
  return dust;
}

int MONERO_PendingTransaction_fee(MONERO_PendingTransaction ptr) {
  debugStart?.call('MONERO_PendingTransaction_fee');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final fee = lib!.MONERO_PendingTransaction_fee(ptr);
  debugEnd?.call('MONERO_PendingTransaction_fee');
  return fee;
}

String MONERO_PendingTransaction_txid(
    MONERO_PendingTransaction ptr, String separator) {
  debugStart?.call('MONERO_PendingTransaction_txid');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final separator_ = separator.toNativeUtf8().cast<Char>();
  final txid = lib!.MONERO_PendingTransaction_txid(ptr, separator_);
  calloc.free(separator_);
  debugEnd?.call('MONERO_PendingTransaction_txid');
  try {
    final label = txid.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_PendingTransaction_txid');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_PendingTransaction_txid', e);
    debugEnd?.call('MONERO_PendingTransaction_txid');
    return "";
  }
}

int MONERO_PendingTransaction_txCount(MONERO_PendingTransaction ptr) {
  debugStart?.call('MONERO_PendingTransaction_txCount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final txCount = lib!.MONERO_PendingTransaction_txCount(ptr);
  debugEnd?.call('MONERO_PendingTransaction_txCount');
  return txCount;
}

String MONERO_PendingTransaction_subaddrAccount(
    MONERO_PendingTransaction ptr, String separator) {
  debugStart?.call('MONERO_PendingTransaction_subaddrAccount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final separator_ = separator.toNativeUtf8().cast<Char>();
  final txid = lib!.MONERO_PendingTransaction_subaddrAccount(ptr, separator_);
  calloc.free(separator_);
  debugEnd?.call('MONERO_PendingTransaction_subaddrAccount');
  try {
    final label = txid.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_PendingTransaction_subaddrAccount');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_PendingTransaction_subaddrAccount', e);
    debugEnd?.call('MONERO_PendingTransaction_subaddrAccount');
    return "";
  }
}

String MONERO_PendingTransaction_subaddrIndices(
    MONERO_PendingTransaction ptr, String separator) {
  debugStart?.call('MONERO_PendingTransaction_subaddrIndices');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final separator_ = separator.toNativeUtf8().cast<Char>();
  final txid = lib!.MONERO_PendingTransaction_subaddrIndices(ptr, separator_);
  calloc.free(separator_);
  debugEnd?.call('MONERO_PendingTransaction_subaddrIndices');
  try {
    final label = txid.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_PendingTransaction_subaddrIndices');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_PendingTransaction_subaddrIndices', e);
    debugEnd?.call('MONERO_PendingTransaction_subaddrIndices');
    return "";
  }
}

String MONERO_PendingTransaction_multisigSignData(
    MONERO_PendingTransaction ptr) {
  debugStart?.call('MONERO_PendingTransaction_multisigSignData');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final txid = lib!.MONERO_PendingTransaction_multisigSignData(ptr);
  debugEnd?.call('MONERO_PendingTransaction_multisigSignData');
  try {
    final label = txid.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_PendingTransaction_multisigSignData');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_PendingTransaction_multisigSignData', e);
    debugEnd?.call('MONERO_PendingTransaction_multisigSignData');
    return "";
  }
}

void MONERO_PendingTransaction_signMultisigTx(MONERO_PendingTransaction ptr) {
  debugStart?.call('MONERO_PendingTransaction_signMultisigTx');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final ret = lib!.MONERO_PendingTransaction_signMultisigTx(ptr);
  debugEnd?.call('MONERO_PendingTransaction_signMultisigTx');
  return ret;
}

String MONERO_PendingTransaction_signersKeys(
    MONERO_PendingTransaction ptr, String separator) {
  debugStart?.call('MONERO_PendingTransaction_signersKeys');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final separator_ = separator.toNativeUtf8().cast<Char>();
  final txid = lib!.MONERO_PendingTransaction_signersKeys(ptr, separator_);
  calloc.free(separator_);
  debugEnd?.call('MONERO_PendingTransaction_signersKeys');
  try {
    final label = txid.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_PendingTransaction_signersKeys');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_PendingTransaction_signersKeys', e);
    debugEnd?.call('MONERO_PendingTransaction_signersKeys');
    return "";
  }
}

// UnsignedTransaction

typedef MONERO_UnsignedTransaction = Pointer<Void>;

int MONERO_UnsignedTransaction_status(MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_status');

  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final dust = lib!.MONERO_UnsignedTransaction_status(ptr);
  debugStart?.call('MONERO_UnsignedTransaction_status');
  return dust;
}

String MONERO_UnsignedTransaction_errorString(MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_errorString');

  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final errorString = lib!.MONERO_UnsignedTransaction_errorString(ptr);
  try {
    final label = errorString.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_UnsignedTransaction_errorString');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_UnsignedTransaction_errorString', e);
    debugEnd?.call('MONERO_UnsignedTransaction_errorString');
    return "";
  }
}

String MONERO_UnsignedTransaction_amount(MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_amount');

  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final errorString =
      lib!.MONERO_UnsignedTransaction_amount(ptr, defaultSeparator);
  try {
    final label = errorString.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_UnsignedTransaction_amount');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_UnsignedTransaction_amount', e);
    debugEnd?.call('MONERO_UnsignedTransaction_amount');
    return "";
  }
}

String MONERO_UnsignedTransaction_fee(MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_fee');

  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final errorString =
      lib!.MONERO_UnsignedTransaction_fee(ptr, defaultSeparator);
  try {
    final label = errorString.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_UnsignedTransaction_fee');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_UnsignedTransaction_fee', e);
    debugEnd?.call('MONERO_UnsignedTransaction_fee');
    return "";
  }
}

String MONERO_UnsignedTransaction_mixin(MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_mixin');

  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final errorString =
      lib!.MONERO_UnsignedTransaction_mixin(ptr, defaultSeparator);
  try {
    final label = errorString.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_UnsignedTransaction_mixin');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_UnsignedTransaction_mixin', e);
    debugEnd?.call('MONERO_UnsignedTransaction_mixin');
    return "";
  }
}

String MONERO_UnsignedTransaction_confirmationMessage(
    MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_confirmationMessage');

  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final errorString = lib!.MONERO_UnsignedTransaction_confirmationMessage(ptr);
  try {
    final label = errorString.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_UnsignedTransaction_confirmationMessage');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_UnsignedTransaction_confirmationMessage', e);
    debugEnd?.call('MONERO_UnsignedTransaction_confirmationMessage');
    return "";
  }
}

String MONERO_UnsignedTransaction_paymentId(MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_paymentId');

  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final errorString =
      lib!.MONERO_UnsignedTransaction_paymentId(ptr, defaultSeparator);
  try {
    final label = errorString.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_UnsignedTransaction_paymentId');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_UnsignedTransaction_paymentId', e);
    debugEnd?.call('MONERO_UnsignedTransaction_paymentId');
    return "";
  }
}

String MONERO_UnsignedTransaction_recipientAddress(
    MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_recipientAddress');

  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final errorString =
      lib!.MONERO_UnsignedTransaction_recipientAddress(ptr, defaultSeparator);
  try {
    final label = errorString.cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_UnsignedTransaction_recipientAddress');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_UnsignedTransaction_recipientAddress', e);
    debugEnd?.call('MONERO_UnsignedTransaction_recipientAddress');
    return "";
  }
}

int MONERO_UnsignedTransaction_minMixinCount(MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_minMixinCount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_UnsignedTransaction_minMixinCount(ptr);
  debugStart?.call('MONERO_UnsignedTransaction_minMixinCount');
  return v;
}

int MONERO_UnsignedTransaction_txCount(MONERO_UnsignedTransaction ptr) {
  debugStart?.call('MONERO_UnsignedTransaction_txCount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_UnsignedTransaction_txCount(ptr);
  debugStart?.call('MONERO_UnsignedTransaction_txCount');
  return v;
}

bool MONERO_UnsignedTransaction_sign(
    MONERO_UnsignedTransaction ptr, String signedFileName) {
  debugStart?.call('MONERO_UnsignedTransaction_sign');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final signedFileName_ = signedFileName.toNativeUtf8().cast<Char>();
  final v = lib!.MONERO_UnsignedTransaction_sign(ptr, signedFileName_);
  calloc.free(signedFileName_);
  debugStart?.call('MONERO_UnsignedTransaction_sign');
  return v;
}
// TransactionInfo

typedef MONERO_TransactionInfo = Pointer<Void>;

enum TransactionInfo_Direction { In, Out }

TransactionInfo_Direction MONERO_TransactionInfo_direction(
    MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_direction');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final tiDir = TransactionInfo_Direction
      .values[lib!.MONERO_TransactionInfo_direction(ptr)];
  debugEnd?.call('MONERO_TransactionInfo_direction');
  return tiDir;
}

bool MONERO_TransactionInfo_isPending(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_isPending');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final isPending = lib!.MONERO_TransactionInfo_isPending(ptr);
  debugEnd?.call('MONERO_TransactionInfo_isPending');

  return isPending;
}

bool MONERO_TransactionInfo_isFailed(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_isFailed');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final isFailed = lib!.MONERO_TransactionInfo_isFailed(ptr);
  debugEnd?.call('MONERO_TransactionInfo_isFailed');
  return isFailed;
}

bool MONERO_TransactionInfo_isCoinbase(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_isCoinbase');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final isCoinbase = lib!.MONERO_TransactionInfo_isCoinbase(ptr);
  debugEnd?.call('MONERO_TransactionInfo_isCoinbase');
  return isCoinbase;
}

int MONERO_TransactionInfo_amount(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_amount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final amount = lib!.MONERO_TransactionInfo_amount(ptr);
  debugEnd?.call('MONERO_TransactionInfo_amount');
  return amount;
}

int MONERO_TransactionInfo_fee(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_fee');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final fee = lib!.MONERO_TransactionInfo_fee(ptr);
  debugEnd?.call('MONERO_TransactionInfo_fee');
  return fee;
}

int MONERO_TransactionInfo_blockHeight(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_blockHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final blockHeight = lib!.MONERO_TransactionInfo_blockHeight(ptr);
  debugEnd?.call('MONERO_TransactionInfo_blockHeight');
  return blockHeight;
}

String MONERO_TransactionInfo_description(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_description');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final str = lib!
        .MONERO_TransactionInfo_description(ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_TransactionInfo_description');
    return str;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_description', e);
    return "";
  }
}

String MONERO_TransactionInfo_subaddrIndex(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_subaddrIndex');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final str = lib!
        .MONERO_TransactionInfo_subaddrIndex(ptr, defaultSeparator)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_TransactionInfo_subaddrIndex');
    return str;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_subaddrIndex', e);
    return "";
  }
}

int MONERO_TransactionInfo_subaddrAccount(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_subaddrAccount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final subaddrAccount = lib!.MONERO_TransactionInfo_subaddrAccount(ptr);
  debugEnd?.call('MONERO_TransactionInfo_subaddrAccount');
  return subaddrAccount;
}

String MONERO_TransactionInfo_label(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_label');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final label =
        lib!.MONERO_TransactionInfo_label(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_TransactionInfo_label');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_label', e);
    debugEnd?.call('MONERO_TransactionInfo_label');
    return "";
  }
}

int MONERO_TransactionInfo_confirmations(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_confirmations');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final confirmations = lib!.MONERO_TransactionInfo_confirmations(ptr);
  debugEnd?.call('MONERO_TransactionInfo_confirmations');
  return confirmations;
}

int MONERO_TransactionInfo_unlockTime(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_unlockTime');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final unlockTime = lib!.MONERO_TransactionInfo_unlockTime(ptr);
  debugEnd?.call('MONERO_TransactionInfo_unlockTime');
  return unlockTime;
}

String MONERO_TransactionInfo_hash(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_hash');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final hash =
        lib!.MONERO_TransactionInfo_hash(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_TransactionInfo_hash');
    return hash;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_hash', e);
    debugEnd?.call('MONERO_TransactionInfo_hash');
    return "";
  }
}

int MONERO_TransactionInfo_timestamp(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_timestamp');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final timestamp = lib!.MONERO_TransactionInfo_timestamp(ptr);
  debugEnd?.call('MONERO_TransactionInfo_timestamp');
  return timestamp;
}

String MONERO_TransactionInfo_paymentId(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_paymentId');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final paymentId =
        lib!.MONERO_TransactionInfo_paymentId(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_TransactionInfo_paymentId');
    return paymentId;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_paymentId', e);
    debugEnd?.call('MONERO_TransactionInfo_paymentId');
    return "";
  }
}

int MONERO_TransactionInfo_transfers_count(MONERO_TransactionInfo ptr) {
  debugStart?.call('MONERO_TransactionInfo_transfers_count');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_TransactionInfo_transfers_count(ptr);
  debugEnd?.call('MONERO_TransactionInfo_transfers_count');
  return v;
}

int MONERO_TransactionInfo_transfers_amount(
    MONERO_TransactionInfo ptr, int index) {
  debugStart?.call('MONERO_TransactionInfo_transfers_amount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_TransactionInfo_transfers_amount(ptr, index);
  debugEnd?.call('MONERO_TransactionInfo_transfers_amount');
  return v;
}

String MONERO_TransactionInfo_transfers_address(
    MONERO_TransactionInfo ptr, int index) {
  debugStart?.call('MONERO_TransactionInfo_transfers_address');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_TransactionInfo_transfers_address(ptr, index)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_TransactionInfo_transfers_address');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_transfers_address', e);
    debugEnd?.call('MONERO_TransactionInfo_transfers_address');
    return "";
  }
}

// TransactionHistory

typedef MONERO_TransactionHistory = Pointer<Void>;

int MONERO_TransactionHistory_count(MONERO_TransactionHistory txHistory_ptr) {
  debugStart?.call('MONERO_TransactionHistory_count');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final count = lib!.MONERO_TransactionHistory_count(txHistory_ptr);
  debugEnd?.call('MONERO_TransactionHistory_count');
  return count;
}

MONERO_TransactionInfo MONERO_TransactionHistory_transaction(
    MONERO_TransactionHistory txHistory_ptr,
    {required int index}) {
  debugStart?.call('MONERO_TransactionHistory_transaction');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final transaction =
      lib!.MONERO_TransactionHistory_transaction(txHistory_ptr, index);
  debugEnd?.call('MONERO_TransactionHistory_transaction');
  return transaction;
}

MONERO_TransactionInfo MONERO_TransactionHistory_transactionById(
    MONERO_TransactionHistory txHistory_ptr,
    {required String txid}) {
  debugStart?.call('MONERO_TransactionHistory_transactionById');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final txid_ = txid.toNativeUtf8().cast<Char>();
  final transaction =
      lib!.MONERO_TransactionHistory_transactionById(txHistory_ptr, txid_);
  calloc.free(txid_);
  debugEnd?.call('MONERO_TransactionHistory_transactionById');
  return transaction;
}

void MONERO_TransactionHistory_refresh(
    MONERO_TransactionHistory txHistory_ptr) {
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  return lib!.MONERO_TransactionHistory_refresh(txHistory_ptr);
}

void MONERO_TransactionHistory_setTxNote(
    MONERO_TransactionHistory txHistory_ptr,
    {required String txid,
    required String note}) {
  debugStart?.call('MONERO_TransactionHistory_setTxNote');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final txid_ = txid.toNativeUtf8().cast<Char>();
  final note_ = note.toNativeUtf8().cast<Char>();
  final s =
      lib!.MONERO_TransactionHistory_setTxNote(txHistory_ptr, txid_, note_);
  calloc.free(txid_);
  calloc.free(note_);
  debugEnd?.call('MONERO_TransactionHistory_setTxNote');
  return s;
}

// AddresBookRow

typedef MONERO_AddressBookRow = Pointer<Void>;

String MONERO_AddressBookRow_extra(MONERO_AddressBookRow addressBookRow_ptr) {
  debugStart?.call('MONERO_AddressBookRow_extra');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_AddressBookRow_extra(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_AddressBookRow_extra');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_AddressBookRow_extra', e);
    debugEnd?.call('MONERO_AddressBookRow_extra');
    return "";
  }
}

String MONERO_AddressBookRow_getAddress(
    MONERO_AddressBookRow addressBookRow_ptr) {
  debugStart?.call('MONERO_AddressBookRow_getAddress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_AddressBookRow_getAddress(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_AddressBookRow_getAddress');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_AddressBookRow_getAddress', e);
    debugEnd?.call('MONERO_AddressBookRow_getAddress');
    return "";
  }
}

String MONERO_AddressBookRow_getDescription(
    MONERO_AddressBookRow addressBookRow_ptr) {
  debugStart?.call('MONERO_AddressBookRow_getDescription');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_AddressBookRow_getDescription(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_AddressBookRow_getDescription');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_AddressBookRow_getDescription', e);
    debugEnd?.call('MONERO_AddressBookRow_getDescription');
    return "";
  }
}

String MONERO_AddressBookRow_getPaymentId(
    MONERO_AddressBookRow addressBookRow_ptr) {
  debugStart?.call('MONERO_AddressBookRow_getPaymentId');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_AddressBookRow_getPaymentId(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_AddressBookRow_getPaymentId');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_AddressBookRow_getPaymentId', e);
    debugEnd?.call('MONERO_AddressBookRow_getPaymentId');
    return "";
  }
}

int MONERO_AddressBookRow_getRowId(MONERO_AddressBookRow addressBookRow_ptr) {
  debugStart?.call('MONERO_AddressBookRow_getRowId');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_AddressBookRow_getRowId(addressBookRow_ptr);
  debugEnd?.call('MONERO_AddressBookRow_getRowId');
  return v;
}

// AddressBook

typedef MONERO_AddressBook = Pointer<Void>;

int MONERO_AddressBook_getAll_size(MONERO_AddressBook addressBook_ptr) {
  debugStart?.call('MONERO_AddressBook_getAll_size');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_AddressBook_getAll_size(addressBook_ptr);
  debugEnd?.call('MONERO_AddressBook_getAll_size');
  return v;
}

MONERO_AddressBookRow MONERO_AddressBook_getAll_byIndex(
    MONERO_AddressBook addressBook_ptr,
    {required int index}) {
  debugStart?.call('MONERO_AddressBook_getAll_byIndex');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_AddressBook_getAll_byIndex(addressBook_ptr, index);
  debugEnd?.call('MONERO_AddressBook_getAll_byIndex');
  return v;
}

bool MONERO_AddressBook_addRow(
  MONERO_AddressBook addressBook_ptr, {
  required String dstAddr,
  required String paymentId,
  required String description,
}) {
  debugStart?.call('MONERO_AddressBook_addRow');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final dst_addr_ = dstAddr.toNativeUtf8().cast<Char>();
  final payment_id_ = paymentId.toNativeUtf8().cast<Char>();
  final description_ = description.toNativeUtf8().cast<Char>();
  final v = lib!.MONERO_AddressBook_addRow(
      addressBook_ptr, dst_addr_, payment_id_, description_);
  calloc.free(dst_addr_);
  calloc.free(payment_id_);
  calloc.free(description_);
  debugEnd?.call('MONERO_AddressBook_addRow');
  return v;
}

bool MONERO_AddressBook_deleteRow(MONERO_AddressBook addressBook_ptr,
    {required int rowId}) {
  debugStart?.call('MONERO_AddressBook_deleteRow');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_AddressBook_deleteRow(addressBook_ptr, rowId);
  debugEnd?.call('MONERO_AddressBook_deleteRow');
  return v;
}

bool MONERO_AddressBook_setDescription(
  MONERO_AddressBook addressBook_ptr, {
  required int rowId,
  required String description,
}) {
  debugStart?.call('MONERO_AddressBook_setDescription');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final description_ = description.toNativeUtf8().cast<Char>();
  final v = lib!
      .MONERO_AddressBook_setDescription(addressBook_ptr, rowId, description_);
  calloc.free(description_);
  debugEnd?.call('MONERO_AddressBook_setDescription');
  return v;
}

void MONERO_AddressBook_refresh(MONERO_AddressBook addressBook_ptr) {
  debugStart?.call('MONERO_AddressBook_refresh');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_AddressBook_refresh(addressBook_ptr);
  debugEnd?.call('MONERO_AddressBook_refresh');
  return v;
}

int MONERO_AddressBook_errorCode(MONERO_AddressBook addressBook_ptr) {
  debugStart?.call('MONERO_AddressBook_errorCode');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_AddressBook_errorCode(addressBook_ptr);
  debugEnd?.call('MONERO_AddressBook_errorCode');
  return v;
}

int MONERO_AddressBook_lookupPaymentID(MONERO_AddressBook addressBook_ptr,
    {required String paymentId}) {
  debugStart?.call('MONERO_AddressBook_lookupPaymentID');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final paymentId_ = paymentId.toNativeUtf8().cast<Char>();
  final v =
      lib!.MONERO_AddressBook_lookupPaymentID(addressBook_ptr, paymentId_);
  calloc.free(paymentId_);
  debugEnd?.call('MONERO_AddressBook_lookupPaymentID');
  return v;
}

// CoinsInfo
typedef MONERO_CoinsInfo = Pointer<Void>;

int MONERO_CoinsInfo_blockHeight(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_blockHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_blockHeight(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_blockHeight');
  return v;
}

String MONERO_CoinsInfo_hash(MONERO_CoinsInfo addressBookRow_ptr) {
  debugStart?.call('MONERO_CoinsInfo_hash');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_CoinsInfo_hash(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_CoinsInfo_hash');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_CoinsInfo_hash', e);
    debugEnd?.call('MONERO_CoinsInfo_hash');
    return "";
  }
}

int MONERO_CoinsInfo_internalOutputIndex(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_internalOutputIndex');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_internalOutputIndex(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_internalOutputIndex');
  return v;
}

int MONERO_CoinsInfo_globalOutputIndex(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_globalOutputIndex');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_globalOutputIndex(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_globalOutputIndex');
  return v;
}

bool MONERO_CoinsInfo_spent(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_spent');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_spent(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_spent');
  return v;
}

bool MONERO_CoinsInfo_frozen(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_frozen');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_frozen(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_frozen');
  return v;
}

int MONERO_CoinsInfo_spentHeight(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_spentHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_spentHeight(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_spentHeight');
  return v;
}

int MONERO_CoinsInfo_amount(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_amount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_amount(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_amount');
  return v;
}

bool MONERO_CoinsInfo_rct(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_rct');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_rct(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_rct');
  return v;
}

bool MONERO_CoinsInfo_keyImageKnown(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_keyImageKnown');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_keyImageKnown(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_keyImageKnown');
  return v;
}

int MONERO_CoinsInfo_pkIndex(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_pkIndex');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_pkIndex(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_pkIndex');
  return v;
}

int MONERO_CoinsInfo_subaddrIndex(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_subaddrIndex');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_subaddrIndex(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_subaddrIndex');
  return v;
}

int MONERO_CoinsInfo_subaddrAccount(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_subaddrAccount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_subaddrAccount(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_subaddrAccount');
  return v;
}

String MONERO_CoinsInfo_address(MONERO_CoinsInfo addressBookRow_ptr) {
  debugStart?.call('MONERO_CoinsInfo_address');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_CoinsInfo_address(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_CoinsInfo_address');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_CoinsInfo_address', e);
    debugEnd?.call('MONERO_CoinsInfo_address');
    return "";
  }
}

String MONERO_CoinsInfo_addressLabel(MONERO_CoinsInfo addressBookRow_ptr) {
  debugStart?.call('MONERO_CoinsInfo_addressLabel');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_CoinsInfo_addressLabel(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_CoinsInfo_addressLabel');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_CoinsInfo_addressLabel', e);
    debugEnd?.call('MONERO_CoinsInfo_addressLabel');
    return "";
  }
}

String MONERO_CoinsInfo_keyImage(MONERO_CoinsInfo addressBookRow_ptr) {
  debugStart?.call('MONERO_CoinsInfo_keyImage');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_CoinsInfo_keyImage(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_CoinsInfo_keyImage');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_CoinsInfo_keyImage', e);
    debugEnd?.call('MONERO_CoinsInfo_keyImage');
    return "";
  }
}

int MONERO_CoinsInfo_unlockTime(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_unlockTime');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_unlockTime(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_unlockTime');
  return v;
}

bool MONERO_CoinsInfo_unlocked(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_unlocked');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_unlocked(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_unlocked');
  return v;
}

String MONERO_CoinsInfo_pubKey(MONERO_CoinsInfo addressBookRow_ptr) {
  debugStart?.call('MONERO_CoinsInfo_pubKey');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_CoinsInfo_pubKey(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_CoinsInfo_pubKey');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_CoinsInfo_pubKey', e);
    debugEnd?.call('MONERO_CoinsInfo_pubKey');
    return "";
  }
}

bool MONERO_CoinsInfo_coinbase(MONERO_CoinsInfo addressBook_ptr) {
  debugStart?.call('MONERO_CoinsInfo_coinbase');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_CoinsInfo_coinbase(addressBook_ptr);
  debugEnd?.call('MONERO_CoinsInfo_coinbase');
  return v;
}

String MONERO_CoinsInfo_description(MONERO_CoinsInfo addressBookRow_ptr) {
  debugStart?.call('MONERO_CoinsInfo_description');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_CoinsInfo_description(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_CoinsInfo_description');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_CoinsInfo_description', e);
    debugEnd?.call('MONERO_CoinsInfo_description');
    return "";
  }
}

typedef MONERO_Coins = Pointer<Void>;

int MONERO_Coins_count(MONERO_Coins addressBook_ptr) {
  debugStart?.call('MONERO_Coins_count');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Coins_count(addressBook_ptr);
  debugEnd?.call('MONERO_Coins_count');
  return v;
}

MONERO_CoinsInfo MONERO_Coins_coin(MONERO_Coins addressBook_ptr, int index) {
  debugStart?.call('MONERO_Coins_coin');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Coins_coin(addressBook_ptr, index);
  debugEnd?.call('MONERO_Coins_coin');
  return v;
}

int MONERO_Coins_getAll_size(MONERO_Coins addressBook_ptr) {
  debugStart?.call('MONERO_Coins_getAll_size');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Coins_getAll_size(addressBook_ptr);
  debugEnd?.call('MONERO_Coins_getAll_size');
  return v;
}

MONERO_CoinsInfo MONERO_Coins_getAll_byIndex(
    MONERO_Coins addressBook_ptr, int index) {
  debugStart?.call('MONERO_Coins_getAll_byIndex');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Coins_getAll_byIndex(addressBook_ptr, index);
  debugEnd?.call('MONERO_Coins_getAll_byIndex');
  return v;
}

void MONERO_Coins_refresh(MONERO_Coins addressBook_ptr) {
  debugStart?.call('MONERO_Coins_refresh');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Coins_refresh(addressBook_ptr);
  debugEnd?.call('MONERO_Coins_refresh');
  return v;
}

void MONERO_Coins_setFrozenByPublicKey(MONERO_Coins addressBook_ptr,
    {required String publicKey}) {
  debugStart?.call('MONERO_Coins_setFrozenByPublicKey');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final publicKey_ = publicKey.toNativeUtf8().cast<Char>();
  final v = lib!.MONERO_Coins_setFrozenByPublicKey(addressBook_ptr, publicKey_);
  calloc.free(publicKey_);
  debugEnd?.call('MONERO_Coins_setFrozenByPublicKey');
  return v;
}

void MONERO_Coins_setFrozen(MONERO_Coins addressBook_ptr,
    {required int index}) {
  debugStart?.call('MONERO_Coins_setFrozen');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Coins_setFrozen(addressBook_ptr, index);
  debugEnd?.call('MONERO_Coins_setFrozen');
  return v;
}

void MONERO_Coins_thaw(MONERO_Coins addressBook_ptr, {required int index}) {
  debugStart?.call('MONERO_Coins_thaw');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Coins_thaw(addressBook_ptr, index);
  debugEnd?.call('MONERO_Coins_thaw');
  return v;
}

void MONERO_Coins_thawByPublicKey(MONERO_Coins addressBook_ptr,
    {required String publicKey}) {
  debugStart?.call('MONERO_Coins_thawByPublicKey');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final publicKey_ = publicKey.toNativeUtf8().cast<Char>();
  final v = lib!.MONERO_Coins_thawByPublicKey(addressBook_ptr, publicKey_);
  calloc.free(publicKey_);
  debugEnd?.call('MONERO_Coins_thawByPublicKey');
  return v;
}

bool MONERO_Coins_isTransferUnlocked(
  MONERO_Coins addressBook_ptr, {
  required int unlockTime,
  required int blockHeight,
}) {
  debugStart?.call('MONERO_Coins_isTransferUnlocked');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Coins_isTransferUnlocked(
      addressBook_ptr, unlockTime, blockHeight);
  debugEnd?.call('MONERO_Coins_isTransferUnlocked');
  return v;
}

// SubaddressRow

typedef MONERO_SubaddressRow = Pointer<Void>;

String MONERO_SubaddressRow_extra(MONERO_SubaddressRow addressBookRow_ptr) {
  debugStart?.call('MONERO_SubaddressRow_extra');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_SubaddressRow_extra(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_SubaddressRow_extra');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_SubaddressRow_extra', e);
    debugEnd?.call('MONERO_SubaddressRow_extra');
    return "";
  }
}

String MONERO_SubaddressRow_getAddress(
    MONERO_SubaddressRow addressBookRow_ptr) {
  debugStart?.call('MONERO_SubaddressRow_getAddress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_SubaddressRow_getAddress(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_SubaddressRow_getAddress');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_SubaddressRow_getAddress', e);
    debugEnd?.call('MONERO_SubaddressRow_getAddress');
    return "";
  }
}

String MONERO_SubaddressRow_getLabel(MONERO_SubaddressRow addressBookRow_ptr) {
  debugStart?.call('MONERO_SubaddressRow_getLabel');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_SubaddressRow_getLabel(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_SubaddressRow_getLabel');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_SubaddressRow_getLabel', e);
    debugEnd?.call('MONERO_SubaddressRow_getLabel');
    return "";
  }
}

int MONERO_SubaddressRow_getRowId(MONERO_SubaddressRow ptr) {
  debugStart?.call('MONERO_SubaddressRow_getRowId');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_SubaddressRow_getRowId(ptr);
  debugEnd?.call('MONERO_SubaddressRow_getRowId');
  return status;
}

// Subaddress

typedef MONERO_Subaddress = Pointer<Void>;

int MONERO_Subaddress_getAll_size(MONERO_SubaddressRow ptr) {
  debugStart?.call('MONERO_Subaddress_getAll_size');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_Subaddress_getAll_size(ptr);
  debugEnd?.call('MONERO_Subaddress_getAll_size');
  return status;
}

MONERO_SubaddressRow MONERO_Subaddress_getAll_byIndex(MONERO_Subaddress ptr,
    {required int index}) {
  debugStart?.call('MONERO_Subaddress_getAll_byIndex');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_Subaddress_getAll_byIndex(ptr, index);
  debugEnd?.call('MONERO_Subaddress_getAll_byIndex');
  return status;
}

void MONERO_Subaddress_addRow(MONERO_Subaddress ptr,
    {required int accountIndex, required String label}) {
  debugStart?.call('MONERO_Subaddress_addRow');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final label_ = label.toNativeUtf8().cast<Char>();
  final status = lib!.MONERO_Subaddress_addRow(ptr, accountIndex, label_);
  calloc.free(label_);
  debugEnd?.call('MONERO_Subaddress_addRow');
  return status;
}

void MONERO_Subaddress_setLabel(MONERO_Subaddress ptr,
    {required int accountIndex,
    required int addressIndex,
    required String label}) {
  debugStart?.call('MONERO_Subaddress_setLabel');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final label_ = label.toNativeUtf8().cast<Char>();
  final status =
      lib!.MONERO_Subaddress_setLabel(ptr, accountIndex, addressIndex, label_);
  calloc.free(label_);
  debugEnd?.call('MONERO_Subaddress_setLabel');
  return status;
}

void MONERO_Subaddress_refresh(MONERO_Subaddress ptr,
    {required int accountIndex, required String label}) {
  debugStart?.call('MONERO_Subaddress_refresh');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final label_ = label.toNativeUtf8().cast<Char>();
  final status = lib!.MONERO_Subaddress_refresh(ptr, accountIndex);
  calloc.free(label_);
  debugEnd?.call('MONERO_Subaddress_refresh');
  return status;
}

typedef MONERO_SubaddressAccountRow = Pointer<Void>;

String MONERO_SubaddressAccountRow_extra(
    MONERO_SubaddressAccountRow addressBookRow_ptr) {
  debugStart?.call('MONERO_SubaddressAccountRow_extra');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_SubaddressAccountRow_extra(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_SubaddressAccountRow_extra');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_SubaddressAccountRow_extra', e);
    debugEnd?.call('MONERO_SubaddressAccountRow_extra');
    return "";
  }
}

String MONERO_SubaddressAccountRow_getAddress(
    MONERO_SubaddressAccountRow addressBookRow_ptr) {
  debugStart?.call('MONERO_SubaddressAccountRow_getAddress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_SubaddressAccountRow_getAddress(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_SubaddressAccountRow_getAddress');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_SubaddressAccountRow_getAddress', e);
    debugEnd?.call('MONERO_SubaddressAccountRow_getAddress');
    return "";
  }
}

String MONERO_SubaddressAccountRow_getLabel(
    MONERO_SubaddressAccountRow addressBookRow_ptr) {
  debugStart?.call('MONERO_SubaddressAccountRow_getLabel');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_SubaddressAccountRow_getLabel(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_SubaddressAccountRow_getLabel');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_SubaddressAccountRow_getLabel', e);
    debugEnd?.call('MONERO_SubaddressAccountRow_getLabel');
    return "";
  }
}

String MONERO_SubaddressAccountRow_getBalance(
    MONERO_SubaddressAccountRow addressBookRow_ptr) {
  debugStart?.call('MONERO_SubaddressAccountRow_getBalance');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_SubaddressAccountRow_getBalance(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_SubaddressAccountRow_getBalance');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_SubaddressAccountRow_getBalance', e);
    debugEnd?.call('MONERO_SubaddressAccountRow_getBalance');
    return "";
  }
}

String MONERO_SubaddressAccountRow_getUnlockedBalance(
    MONERO_SubaddressAccountRow addressBookRow_ptr) {
  debugStart?.call('MONERO_SubaddressAccountRow_getUnlockedBalance');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_SubaddressAccountRow_getUnlockedBalance(addressBookRow_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_SubaddressAccountRow_getUnlockedBalance');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_SubaddressAccountRow_getUnlockedBalance', e);
    debugEnd?.call('MONERO_SubaddressAccountRow_getUnlockedBalance');
    return "";
  }
}

int MONERO_SubaddressAccountRow_getRowId(MONERO_SubaddressAccountRow ptr) {
  debugStart?.call('MONERO_SubaddressAccountRow_getRowId');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_SubaddressAccountRow_getRowId(ptr);
  debugEnd?.call('MONERO_SubaddressAccountRow_getRowId');
  return status;
}

typedef MONERO_SubaddressAccount = Pointer<Void>;

int MONERO_SubaddressAccount_getAll_size(MONERO_SubaddressAccount ptr) {
  debugStart?.call('MONERO_SubaddressAccount_getAll_size');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_SubaddressAccount_getAll_size(ptr);
  debugEnd?.call('MONERO_SubaddressAccount_getAll_size');
  return status;
}

MONERO_SubaddressAccountRow MONERO_SubaddressAccount_getAll_byIndex(
    MONERO_SubaddressAccount ptr,
    {required int index}) {
  debugStart?.call('MONERO_SubaddressAccount_getAll_byIndex');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_SubaddressAccount_getAll_byIndex(ptr, index);
  debugEnd?.call('MONERO_SubaddressAccount_getAll_byIndex');
  return status;
}

void MONERO_SubaddressAccount_addRow(MONERO_SubaddressAccount ptr,
    {required String label}) {
  debugStart?.call('MONERO_SubaddressAccount_addRow');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final label_ = label.toNativeUtf8().cast<Char>();
  final status = lib!.MONERO_SubaddressAccount_addRow(ptr, label_);
  calloc.free(label_);
  debugEnd?.call('MONERO_SubaddressAccount_addRow');
  return status;
}

void MONERO_SubaddressAccount_setLabel(MONERO_SubaddressAccount ptr,
    {required int accountIndex, required String label}) {
  debugStart?.call('MONERO_SubaddressAccount_setLabel');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final label_ = label.toNativeUtf8().cast<Char>();
  final status =
      lib!.MONERO_SubaddressAccount_setLabel(ptr, accountIndex, label_);
  calloc.free(label_);
  debugEnd?.call('MONERO_SubaddressAccount_setLabel');
  return status;
}

void MONERO_SubaddressAccount_refresh(MONERO_SubaddressAccount ptr) {
  debugStart?.call('MONERO_SubaddressAccount_refresh');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_SubaddressAccount_refresh(ptr);
  debugEnd?.call('MONERO_SubaddressAccount_refresh');
  return status;
}

// MultisigState

typedef MONERO_MultisigState = Pointer<Void>;

bool MONERO_MultisigState_isMultisig(MONERO_MultisigState ptr) {
  debugStart?.call('MONERO_MultisigState_isMultisig');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_MultisigState_isMultisig(ptr);
  debugEnd?.call('MONERO_MultisigState_isMultisig');
  return status;
}

bool MONERO_MultisigState_isReady(MONERO_MultisigState ptr) {
  debugStart?.call('MONERO_MultisigState_isReady');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_MultisigState_isReady(ptr);
  debugEnd?.call('MONERO_MultisigState_isReady');
  return status;
}

int MONERO_MultisigState_threshold(MONERO_MultisigState ptr) {
  debugStart?.call('MONERO_MultisigState_threshold');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_MultisigState_threshold(ptr);
  debugEnd?.call('MONERO_MultisigState_threshold');
  return status;
}

int MONERO_MultisigState_total(MONERO_MultisigState ptr) {
  debugStart?.call('MONERO_MultisigState_total');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_MultisigState_total(ptr);
  debugEnd?.call('MONERO_MultisigState_total');
  return status;
}

// DeviceProgress

typedef MONERO_DeviceProgress = Pointer<Void>;

bool MONERO_DeviceProgress_progress(MONERO_DeviceProgress ptr) {
  debugStart?.call('MONERO_DeviceProgress_progress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_DeviceProgress_progress(ptr);
  debugEnd?.call('MONERO_DeviceProgress_progress');
  return status;
}

bool MONERO_DeviceProgress_indeterminate(MONERO_DeviceProgress ptr) {
  debugStart?.call('MONERO_DeviceProgress_indeterminate');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_DeviceProgress_indeterminate(ptr);
  debugEnd?.call('MONERO_DeviceProgress_indeterminate');
  return status;
}
// Wallet

typedef MONERO_wallet = Pointer<Void>;

String MONERO_Wallet_seed(MONERO_wallet ptr, {required String seedOffset}) {
  debugStart?.call('MONERO_Wallet_seed');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final seedOffset_ = seedOffset.toNativeUtf8().cast<Char>();
    final seed =
        lib!.MONERO_Wallet_seed(ptr, seedOffset_).cast<Utf8>().toDartString();
    calloc.free(seedOffset_);
    debugEnd?.call('MONERO_Wallet_seed');
    return seed;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_seed', e);
    debugEnd?.call('MONERO_Wallet_seed');
    return "";
  }
}

String MONERO_Wallet_getSeedLanguage(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_getSeedLanguage');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v =
        lib!.MONERO_Wallet_getSeedLanguage(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_getSeedLanguage');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_getSeedLanguage', e);
    debugEnd?.call('MONERO_Wallet_getSeedLanguage');
    return "";
  }
}

void MONERO_Wallet_setSeedLanguage(MONERO_wallet ptr,
    {required String language}) {
  debugStart?.call('MONERO_Wallet_setSeedLanguage');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final language_ = language.toNativeUtf8().cast<Char>();
  final status = lib!.MONERO_Wallet_setSeedLanguage(ptr, language_);
  calloc.free(language_);
  debugEnd?.call('MONERO_Wallet_setSeedLanguage');
  return status;
}

int MONERO_Wallet_status(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_status');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_Wallet_status(ptr);
  debugEnd?.call('MONERO_Wallet_status');
  return status;
}

String MONERO_Wallet_errorString(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_errorString');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final errorString =
        lib!.MONERO_Wallet_errorString(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_errorString');
    return errorString;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_errorString', e);
    debugEnd?.call('MONERO_Wallet_errorString');
    return "";
  }
}

bool MONERO_Wallet_setPassword(MONERO_wallet ptr, {required String password}) {
  debugStart?.call('MONERO_Wallet_setPassword');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final password_ = password.toNativeUtf8().cast<Char>();
  final status = lib!.MONERO_Wallet_setPassword(ptr, password_);
  calloc.free(password_);
  debugEnd?.call('MONERO_Wallet_setPassword');
  return status;
}

String MONERO_Wallet_getPassword(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_getPassword');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final errorString =
        lib!.MONERO_Wallet_getPassword(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_getPassword');
    return errorString;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_getPassword', e);
    debugEnd?.call('MONERO_Wallet_getPassword');
    return "";
  }
}

bool MONERO_Wallet_setDevicePin(MONERO_wallet ptr,
    {required String passphrase}) {
  debugStart?.call('MONERO_Wallet_setDevicePin');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final passphrase_ = passphrase.toNativeUtf8().cast<Char>();
  final status = lib!.MONERO_Wallet_setDevicePin(ptr, passphrase_);
  calloc.free(passphrase_);
  debugEnd?.call('MONERO_Wallet_setDevicePin');
  return status;
}

String MONERO_Wallet_address(MONERO_wallet ptr,
    {int accountIndex = 0, int addressIndex = 0}) {
  debugStart?.call('MONERO_Wallet_address');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final address = lib!
        .MONERO_Wallet_address(ptr, accountIndex, addressIndex)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_Wallet_address');
    return address;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_address', e);
    debugEnd?.call('MONERO_Wallet_address');
    return "";
  }
}

String MONERO_Wallet_path(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_path');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final errorString =
        lib!.MONERO_Wallet_path(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_path');
    return errorString;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_path', e);
    debugEnd?.call('MONERO_Wallet_path');
    return "";
  }
}

int MONERO_Wallet_nettype(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_nettype');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_Wallet_nettype(ptr);
  debugEnd?.call('MONERO_Wallet_nettype');
  return status;
}

int MONERO_Wallet_useForkRules(
  MONERO_wallet ptr, {
  required int version,
  required int earlyBlocks,
}) {
  debugStart?.call('MONERO_Wallet_useForkRules');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_Wallet_useForkRules(ptr, version, earlyBlocks);
  debugEnd?.call('MONERO_Wallet_useForkRules');
  return status;
}

String MONERO_Wallet_integratedAddress(MONERO_wallet ptr,
    {required String paymentId}) {
  debugStart?.call('MONERO_Wallet_integratedAddress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final paymentId_ = paymentId.toNativeUtf8().cast<Char>();
    final errorString = lib!
        .MONERO_Wallet_integratedAddress(ptr, paymentId_)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_Wallet_integratedAddress');
    calloc.free(paymentId_);
    return errorString;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_integratedAddress', e);
    debugEnd?.call('MONERO_Wallet_integratedAddress');
    return "";
  }
}

String MONERO_Wallet_secretViewKey(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_secretViewKey');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final secretViewKey =
        lib!.MONERO_Wallet_secretViewKey(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_secretViewKey');
    return secretViewKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_secretViewKey', e);
    debugEnd?.call('MONERO_Wallet_secretViewKey');
    return "";
  }
}

String MONERO_Wallet_publicViewKey(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_publicViewKey');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final publicViewKey =
        lib!.MONERO_Wallet_publicViewKey(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_publicViewKey');
    return publicViewKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_publicViewKey', e);
    debugEnd?.call('MONERO_Wallet_publicViewKey');
    return "";
  }
}

String MONERO_Wallet_secretSpendKey(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_secretSpendKey');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final secretSpendKey =
        lib!.MONERO_Wallet_secretSpendKey(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_secretSpendKey');
    return secretSpendKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_secretSpendKey', e);
    debugEnd?.call('MONERO_Wallet_secretSpendKey');
    return "";
  }
}

String MONERO_Wallet_publicSpendKey(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_publicSpendKey');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final publicSpendKey =
        lib!.MONERO_Wallet_publicSpendKey(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_publicSpendKey');
    return publicSpendKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_publicSpendKey', e);
    debugEnd?.call('MONERO_Wallet_publicSpendKey');
    return "";
  }
}

String MONERO_Wallet_publicMultisigSignerKey(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_publicMultisigSignerKey');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final publicSpendKey = lib!
        .MONERO_Wallet_publicMultisigSignerKey(ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_Wallet_publicMultisigSignerKey');
    return publicSpendKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_publicMultisigSignerKey', e);
    debugEnd?.call('MONERO_Wallet_publicMultisigSignerKey');
    return "";
  }
}

void MONERO_Wallet_stop(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_stop');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final stop = lib!.MONERO_Wallet_stop(ptr);
  debugEnd?.call('MONERO_Wallet_stop');
  return stop;
}

bool MONERO_Wallet_store(MONERO_wallet ptr, {String path = ""}) {
  debugStart?.call('MONERO_Wallet_store');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final path_ = path.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_store(ptr, path_);
  calloc.free(path_);
  debugEnd?.call('MONERO_Wallet_store');
  return s;
}

String MONERO_Wallet_filename(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_filename');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final publicSpendKey =
        lib!.MONERO_Wallet_filename(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_filename');
    return publicSpendKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_filename', e);
    debugEnd?.call('MONERO_Wallet_filename');
    return "";
  }
}

String MONERO_Wallet_keysFilename(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_keysFilename');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final publicSpendKey =
        lib!.MONERO_Wallet_keysFilename(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_keysFilename');
    return publicSpendKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_keysFilename', e);
    debugEnd?.call('MONERO_Wallet_keysFilename');
    return "";
  }
}

bool MONERO_Wallet_init(
  MONERO_wallet ptr, {
  required String daemonAddress,
  int upperTransacationSizeLimit = 0,
  String daemonUsername = "",
  String daemonPassword = "",
  bool useSsl = false,
  bool lightWallet = false,
  String proxyAddress = "",
}) {
  debugStart?.call('MONERO_Wallet_init');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final daemonAddress_ = daemonAddress.toNativeUtf8().cast<Char>();
  final daemonUsername_ = daemonUsername.toNativeUtf8().cast<Char>();
  final daemonPassword_ = daemonPassword.toNativeUtf8().cast<Char>();
  final proxyAddress_ = proxyAddress.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_init(
      ptr,
      daemonAddress_,
      upperTransacationSizeLimit,
      daemonUsername_,
      daemonPassword_,
      useSsl,
      lightWallet,
      proxyAddress_);

  calloc.free(daemonAddress_);
  calloc.free(daemonUsername_);
  calloc.free(daemonPassword_);
  calloc.free(proxyAddress_);
  debugEnd?.call('MONERO_Wallet_init');
  return s;
}

bool MONERO_Wallet_createWatchOnly(
  MONERO_wallet ptr, {
  required String path,
  required String password,
  required String language,
}) {
  debugStart?.call('MONERO_Wallet_createWatchOnly');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final language_ = language.toNativeUtf8().cast<Char>();
  final getRefreshFromBlockHeight =
      lib!.MONERO_Wallet_createWatchOnly(ptr, path_, password_, language_);
  calloc.free(path_);
  calloc.free(password_);
  calloc.free(language_);
  debugEnd?.call('MONERO_Wallet_createWatchOnly');
  return getRefreshFromBlockHeight;
}

void MONERO_Wallet_setRefreshFromBlockHeight(MONERO_wallet ptr,
    {required int refresh_from_block_height}) {
  debugStart?.call('MONERO_Wallet_setRefreshFromBlockHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!
      .MONERO_Wallet_setRefreshFromBlockHeight(ptr, refresh_from_block_height);
  debugEnd?.call('MONERO_Wallet_setRefreshFromBlockHeight');
  return status;
}

int MONERO_Wallet_getRefreshFromBlockHeight(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_getRefreshFromBlockHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final getRefreshFromBlockHeight =
      lib!.MONERO_Wallet_getRefreshFromBlockHeight(ptr);
  debugEnd?.call('MONERO_Wallet_getRefreshFromBlockHeight');
  return getRefreshFromBlockHeight;
}

void MONERO_Wallet_setRecoveringFromSeed(MONERO_wallet ptr,
    {required bool recoveringFromSeed}) {
  debugStart?.call('MONERO_Wallet_setRecoveringFromSeed');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status =
      lib!.MONERO_Wallet_setRecoveringFromSeed(ptr, recoveringFromSeed);
  debugEnd?.call('MONERO_Wallet_setRecoveringFromSeed');
  return status;
}

void MONERO_Wallet_setRecoveringFromDevice(MONERO_wallet ptr,
    {required bool recoveringFromDevice}) {
  debugStart?.call('MONERO_Wallet_setRecoveringFromDevice');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status =
      lib!.MONERO_Wallet_setRecoveringFromDevice(ptr, recoveringFromDevice);
  debugEnd?.call('MONERO_Wallet_setRecoveringFromDevice');
  return status;
}

void MONERO_Wallet_setSubaddressLookahead(MONERO_wallet ptr,
    {required int major, required int minor}) {
  debugStart?.call('MONERO_Wallet_setSubaddressLookahead');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_Wallet_setSubaddressLookahead(ptr, major, minor);
  debugEnd?.call('MONERO_Wallet_setSubaddressLookahead');
  return status;
}

bool MONERO_Wallet_connectToDaemon(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_connectToDaemon');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final connectToDaemon = lib!.MONERO_Wallet_connectToDaemon(ptr);
  debugEnd?.call('MONERO_Wallet_connectToDaemon');
  return connectToDaemon;
}

int MONERO_Wallet_connected(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_connected');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final connected = lib!.MONERO_Wallet_connected(ptr);
  debugEnd?.call('MONERO_Wallet_connected');
  return connected;
}

void MONERO_Wallet_setTrustedDaemon(MONERO_wallet ptr, {required bool arg}) {
  debugStart?.call('MONERO_Wallet_setTrustedDaemon');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_Wallet_setTrustedDaemon(ptr, arg);
  debugEnd?.call('MONERO_Wallet_setTrustedDaemon');
  return status;
}

bool MONERO_Wallet_trustedDaemon(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_trustedDaemon');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final status = lib!.MONERO_Wallet_trustedDaemon(ptr);
  debugEnd?.call('MONERO_Wallet_trustedDaemon');
  return status;
}

bool MONERO_Wallet_setProxy(MONERO_wallet ptr, {required String address}) {
  debugStart?.call('MONERO_Wallet_setProxy');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_setProxy(ptr, address_);
  calloc.free(address_);
  debugEnd?.call('MONERO_Wallet_setProxy');
  return s;
}

int MONERO_Wallet_balance(MONERO_wallet ptr, {required int accountIndex}) {
  debugStart?.call('MONERO_Wallet_balance');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final balance = lib!.MONERO_Wallet_balance(ptr, accountIndex);
  debugEnd?.call('MONERO_Wallet_balance');
  return balance;
}

int MONERO_Wallet_unlockedBalance(MONERO_wallet ptr,
    {required int accountIndex}) {
  debugStart?.call('MONERO_Wallet_unlockedBalance');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final unlockedBalance = lib!.MONERO_Wallet_unlockedBalance(ptr, accountIndex);
  debugEnd?.call('MONERO_Wallet_unlockedBalance');
  return unlockedBalance;
}

int MONERO_Wallet_viewOnlyBalance(MONERO_wallet ptr,
    {required int accountIndex}) {
  debugStart?.call('MONERO_Wallet_viewOnlyBalance');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final unlockedBalance = lib!.MONERO_Wallet_viewOnlyBalance(ptr, accountIndex);
  debugEnd?.call('MONERO_Wallet_viewOnlyBalance');
  return unlockedBalance;
}

bool MONERO_Wallet_watchOnly(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_watchOnly');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final watchOnly = lib!.MONERO_Wallet_watchOnly(ptr);
  debugEnd?.call('MONERO_Wallet_watchOnly');
  return watchOnly;
}

int MONERO_Wallet_blockChainHeight(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_blockChainHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final blockChainHeight = lib!.MONERO_Wallet_blockChainHeight(ptr);
  debugEnd?.call('MONERO_Wallet_blockChainHeight');
  return blockChainHeight;
}

int MONERO_Wallet_approximateBlockChainHeight(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_approximateBlockChainHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final approximateBlockChainHeight =
      lib!.MONERO_Wallet_approximateBlockChainHeight(ptr);
  debugEnd?.call('MONERO_Wallet_approximateBlockChainHeight');
  return approximateBlockChainHeight;
}

int MONERO_Wallet_estimateBlockChainHeight(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_estimateBlockChainHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final estimateBlockChainHeight =
      lib!.MONERO_Wallet_estimateBlockChainHeight(ptr);
  debugEnd?.call('MONERO_Wallet_estimateBlockChainHeight');
  return estimateBlockChainHeight;
}

int MONERO_Wallet_daemonBlockChainHeight(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_daemonBlockChainHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final daemonBlockChainHeight = lib!.MONERO_Wallet_daemonBlockChainHeight(ptr);
  debugEnd?.call('MONERO_Wallet_daemonBlockChainHeight');
  return daemonBlockChainHeight;
}

int MONERO_Wallet_daemonBlockChainHeight_cached(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_daemonBlockChainHeight_cached');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final daemonBlockChainHeight =
      lib!.MONERO_Wallet_daemonBlockChainHeight_cached(ptr);
  debugEnd?.call('MONERO_Wallet_daemonBlockChainHeight_cached');
  return daemonBlockChainHeight;
}

void MONERO_Wallet_daemonBlockChainHeight_runThread(
    MONERO_wallet ptr, int seconds) {
  debugStart?.call('MONERO_Wallet_daemonBlockChainHeight_enableRefresh');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final ret = lib!.MONERO_Wallet_daemonBlockChainHeight_runThread(ptr, seconds);
  debugEnd?.call('MONERO_Wallet_daemonBlockChainHeight_enableRefresh');
  return ret;
}

bool MONERO_Wallet_synchronized(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_synchronized');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final synchronized = lib!.MONERO_Wallet_synchronized(ptr);
  debugEnd?.call('MONERO_Wallet_synchronized');
  return synchronized;
}

String MONERO_Wallet_displayAmount(int amount) {
  debugStart?.call('MONERO_Wallet_displayAmount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final displayAmount =
        lib!.MONERO_Wallet_displayAmount(amount).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_displayAmount');
    return displayAmount;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_displayAmount', e);
    debugEnd?.call('MONERO_Wallet_displayAmount');
    return "";
  }
}

int MONERO_Wallet_amountFromString(String amount) {
  debugStart?.call('MONERO_Wallet_amountFromString');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final amount_ = amount.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_amountFromString(amount_);
  calloc.free(amount_);
  debugEnd?.call('MONERO_Wallet_amountFromString');
  return s;
}

int MONERO_Wallet_amountFromDouble(double amount) {
  debugStart?.call('MONERO_Wallet_amountFromDouble');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final s = lib!.MONERO_Wallet_amountFromDouble(amount);
  debugEnd?.call('MONERO_Wallet_amountFromDouble');
  return s;
}

String MONERO_Wallet_genPaymentId() {
  debugStart?.call('MONERO_Wallet_genPaymentId');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final displayAmount =
        lib!.MONERO_Wallet_genPaymentId().cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_genPaymentId');
    return displayAmount;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_genPaymentId', e);
    debugEnd?.call('MONERO_Wallet_genPaymentId');
    return "";
  }
}

bool MONERO_Wallet_paymentIdValid(String paymentId) {
  debugStart?.call('MONERO_Wallet_paymentIdValid');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final paymentId_ = paymentId.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_paymentIdValid(paymentId_);
  calloc.free(paymentId_);
  debugEnd?.call('MONERO_Wallet_paymentIdValid');
  return s;
}

bool MONERO_Wallet_addressValid(String address, int networkType) {
  debugStart?.call('MONERO_Wallet_addressValid');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_addressValid(address_, networkType);
  calloc.free(address_);
  debugEnd?.call('MONERO_Wallet_addressValid');
  return s;
}

bool MONERO_Wallet_keyValid(
    {required String secret_key_string,
    required String address_string,
    required bool isViewKey,
    required int nettype}) {
  debugStart?.call('MONERO_Wallet_keyValid');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final secret_key_string_ = secret_key_string.toNativeUtf8().cast<Char>();
  final address_string_ = address_string.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_keyValid(
      secret_key_string_, address_string_, isViewKey, nettype);
  calloc.free(secret_key_string_);
  calloc.free(address_string_);
  debugEnd?.call('MONERO_Wallet_keyValid');
  return s;
}

String MONERO_Wallet_keyValid_error(
    {required String secret_key_string,
    required String address_string,
    required bool isViewKey,
    required int nettype}) {
  debugStart?.call('MONERO_Wallet_keyValid_error');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final secret_key_string_ = secret_key_string.toNativeUtf8().cast<Char>();
    final address_string_ = address_string.toNativeUtf8().cast<Char>();
    final s = lib!
        .MONERO_Wallet_keyValid_error(
            secret_key_string_, address_string_, isViewKey, nettype)
        .cast<Utf8>()
        .toDartString();
    calloc.free(secret_key_string_);
    calloc.free(address_string_);
    return s;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_keyValid_error', e);
    debugEnd?.call('MONERO_Wallet_keyValid_error');
    return "";
  }
}

String MONERO_Wallet_paymentIdFromAddress(
    {required String strarg, required int nettype}) {
  debugStart?.call('MONERO_Wallet_paymentIdFromAddress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final strarg_ = strarg.toNativeUtf8().cast<Char>();
    final s = lib!
        .MONERO_Wallet_paymentIdFromAddress(strarg_, nettype)
        .cast<Utf8>()
        .toDartString();
    calloc.free(strarg_);
    return s;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_paymentIdFromAddress', e);
    debugEnd?.call('MONERO_Wallet_paymentIdFromAddress');
    return "";
  }
}

int MONERO_Wallet_maximumAllowedAmount() {
  debugStart?.call('MONERO_Wallet_maximumAllowedAmount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final s = lib!.MONERO_Wallet_maximumAllowedAmount();
  debugEnd?.call('MONERO_Wallet_maximumAllowedAmount');
  return s;
}

void MONERO_Wallet_init3(
  MONERO_wallet ptr, {
  required String argv0,
  required String defaultLogBaseName,
  required String logPath,
  required bool console,
}) {
  debugStart?.call('MONERO_Wallet_init3');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final argv0_ = argv0.toNativeUtf8().cast<Char>();
  final defaultLogBaseName_ = defaultLogBaseName.toNativeUtf8().cast<Char>();
  final logPath_ = logPath.toNativeUtf8().cast<Char>();
  final s = lib!
      .MONERO_Wallet_init3(ptr, argv0_, defaultLogBaseName_, logPath_, console);
  calloc.free(argv0_);
  calloc.free(defaultLogBaseName_);
  calloc.free(logPath_);
  debugEnd?.call('MONERO_Wallet_init3');
  return s;
}

String MONERO_Wallet_getPolyseed(MONERO_wallet ptr,
    {required String passphrase}) {
  debugStart?.call('MONERO_Wallet_getPolyseed');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final passphrase_ = passphrase.toNativeUtf8().cast<Char>();
    final seed = lib!
        .MONERO_Wallet_getPolyseed(ptr, passphrase_)
        .cast<Utf8>()
        .toDartString();
    calloc.free(passphrase_);
    debugEnd?.call('MONERO_Wallet_getPolyseed');
    return seed;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_getPolyseed', e);
    debugEnd?.call('MONERO_Wallet_getPolyseed');
    return "";
  }
}

String MONERO_Wallet_createPolyseed() {
  debugStart?.call('MONERO_Wallet_createPolyseed');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final seed =
        lib!.MONERO_Wallet_createPolyseed().cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_createPolyseed');
    return seed;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_createPolyseed', e);
    debugEnd?.call('MONERO_Wallet_createPolyseed');
    return "";
  }
}

void MONERO_Wallet_startRefresh(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_startRefresh');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final startRefresh = lib!.MONERO_Wallet_startRefresh(ptr);
  debugEnd?.call('MONERO_Wallet_startRefresh');
  return startRefresh;
}

void MONERO_Wallet_pauseRefresh(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_pauseRefresh');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final pauseRefresh = lib!.MONERO_Wallet_pauseRefresh(ptr);
  debugEnd?.call('MONERO_Wallet_pauseRefresh');
  return pauseRefresh;
}

bool MONERO_Wallet_refresh(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_refresh');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final refresh = lib!.MONERO_Wallet_refresh(ptr);
  debugEnd?.call('MONERO_Wallet_refresh');
  return refresh;
}

void MONERO_Wallet_refreshAsync(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_refreshAsync');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final refreshAsync = lib!.MONERO_Wallet_refreshAsync(ptr);
  debugEnd?.call('MONERO_Wallet_refreshAsync');
  return refreshAsync;
}

bool MONERO_Wallet_rescanBlockchain(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_rescanBlockchain');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final rescanBlockchain = lib!.MONERO_Wallet_rescanBlockchain(ptr);
  debugEnd?.call('MONERO_Wallet_rescanBlockchain');
  return rescanBlockchain;
}

void MONERO_Wallet_rescanBlockchainAsync(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_rescanBlockchainAsync');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final rescanBlockchainAsync = lib!.MONERO_Wallet_rescanBlockchainAsync(ptr);
  debugEnd?.call('MONERO_Wallet_rescanBlockchainAsync');
  return rescanBlockchainAsync;
}

void MONERO_Wallet_setAutoRefreshInterval(MONERO_wallet ptr,
    {required int millis}) {
  debugStart?.call('MONERO_Wallet_setAutoRefreshInterval');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final setAutoRefreshInterval =
      lib!.MONERO_Wallet_setAutoRefreshInterval(ptr, millis);
  debugEnd?.call('MONERO_Wallet_setAutoRefreshInterval');
  return setAutoRefreshInterval;
}

int MONERO_Wallet_autoRefreshInterval(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_autoRefreshInterval');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final autoRefreshInterval = lib!.MONERO_Wallet_autoRefreshInterval(ptr);
  debugEnd?.call('MONERO_Wallet_autoRefreshInterval');
  return autoRefreshInterval;
}

void MONERO_Wallet_addSubaddress(MONERO_wallet ptr,
    {required int accountIndex, String label = ""}) {
  debugStart?.call('MONERO_Wallet_addSubaddress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final label_ = label.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_addSubaddress(ptr, accountIndex, label_);
  calloc.free(label_);
  debugEnd?.call('MONERO_Wallet_addSubaddress');
  return s;
}

void MONERO_Wallet_addSubaddressAccount(MONERO_wallet ptr,
    {String label = ""}) {
  debugStart?.call('MONERO_Wallet_addSubaddressAccount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final label_ = label.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_addSubaddressAccount(ptr, label_);
  calloc.free(label_);
  debugEnd?.call('MONERO_Wallet_addSubaddressAccount');
  return s;
}

int MONERO_Wallet_numSubaddressAccounts(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_numSubaddressAccounts');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final numSubaddressAccounts = lib!.MONERO_Wallet_numSubaddressAccounts(ptr);
  debugEnd?.call('MONERO_Wallet_numSubaddressAccounts');
  return numSubaddressAccounts;
}

int MONERO_Wallet_numSubaddresses(MONERO_wallet ptr,
    {required int accountIndex}) {
  debugStart?.call('MONERO_Wallet_numSubaddresses');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final numSubaddresses = lib!.MONERO_Wallet_numSubaddresses(ptr, accountIndex);
  debugEnd?.call('MONERO_Wallet_numSubaddresses');
  return numSubaddresses;
}

String MONERO_Wallet_getSubaddressLabel(MONERO_wallet ptr,
    {required int accountIndex, required int addressIndex}) {
  debugStart?.call('MONERO_Wallet_getSubaddressLabel');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final getSubaddressLabel = lib!
        .MONERO_Wallet_getSubaddressLabel(ptr, accountIndex, addressIndex)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_Wallet_getSubaddressLabel');
    return getSubaddressLabel;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_getSubaddressLabel', e);
    debugEnd?.call('MONERO_Wallet_getSubaddressLabel');
    return "";
  }
}

void MONERO_Wallet_setSubaddressLabel(MONERO_wallet ptr,
    {required int accountIndex,
    required int addressIndex,
    required String label}) {
  debugStart?.call('MONERO_Wallet_setSubaddressLabel');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final label_ = label.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_setSubaddressLabel(
      ptr, accountIndex, addressIndex, label_);
  calloc.free(label_);
  debugEnd?.call('MONERO_Wallet_setSubaddressLabel');
  return s;
}

String MONERO_Wallet_getMultisigInfo(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_getMultisigInfo');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final getMultisigInfo =
        lib!.MONERO_Wallet_getMultisigInfo(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_getMultisigInfo');
    return getMultisigInfo;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_getMultisigInfo', e);
    debugEnd?.call('MONERO_Wallet_getMultisigInfo');
    return "";
  }
}

MONERO_PendingTransaction MONERO_Wallet_createTransaction(MONERO_wallet ptr,
    {required String dst_addr,
    required String payment_id,
    required int amount,
    required int mixin_count,
    required int pendingTransactionPriority,
    required int subaddr_account,
    List<String> preferredInputs = const []}) {
  debugStart?.call('MONERO_Wallet_createTransaction');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final dst_addr_ = dst_addr.toNativeUtf8().cast<Char>();
  final payment_id_ = payment_id.toNativeUtf8().cast<Char>();
  final preferredInputs_ =
      preferredInputs.join(defaultSeparatorStr).toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_createTransaction(
    ptr,
    dst_addr_,
    payment_id_,
    amount,
    mixin_count,
    pendingTransactionPriority,
    subaddr_account,
    preferredInputs_,
    defaultSeparator,
  );
  calloc.free(dst_addr_);
  calloc.free(payment_id_);
  debugEnd?.call('MONERO_Wallet_createTransaction');
  return s;
}

MONERO_UnsignedTransaction MONERO_Wallet_loadUnsignedTx(MONERO_wallet ptr,
    {required String unsigned_filename}) {
  debugStart?.call('MONERO_Wallet_loadUnsignedTx');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final unsigned_filename_ = unsigned_filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_loadUnsignedTx(ptr, unsigned_filename_);
  calloc.free(unsigned_filename_);
  debugEnd?.call('MONERO_Wallet_loadUnsignedTx');
  return s;
}

bool MONERO_Wallet_submitTransaction(MONERO_wallet ptr, String filename) {
  debugStart?.call('MONERO_Wallet_submitTransaction');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_submitTransaction(ptr, filename_);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_submitTransaction');
  return s;
}

bool MONERO_Wallet_hasUnknownKeyImages(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_hasUnknownKeyImages');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final s = lib!.MONERO_Wallet_hasUnknownKeyImages(ptr);
  debugEnd?.call('MONERO_Wallet_hasUnknownKeyImages');
  return s;
}

bool MONERO_Wallet_exportKeyImages(MONERO_wallet ptr, String filename,
    {required bool all}) {
  debugStart?.call('MONERO_Wallet_exportKeyImages');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_exportKeyImages(ptr, filename_, all);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_exportKeyImages');
  return s;
}

bool MONERO_Wallet_importKeyImages(MONERO_wallet ptr, String filename) {
  debugStart?.call('MONERO_Wallet_importKeyImages');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_importKeyImages(ptr, filename_);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_importKeyImages');
  return s;
}

bool MONERO_Wallet_exportOutputs(MONERO_wallet ptr, String filename,
    {required bool all}) {
  debugStart?.call('MONERO_Wallet_exportOutputs');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_exportOutputs(ptr, filename_, all);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_exportOutputs');
  return s;
}

bool MONERO_Wallet_importOutputs(MONERO_wallet ptr, String filename) {
  debugStart?.call('MONERO_Wallet_importOutputs');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_importOutputs(ptr, filename_);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_importOutputs');
  return s;
}

bool MONERO_Wallet_setupBackgroundSync(
  MONERO_wallet ptr, {
  required int backgroundSyncType,
  required String walletPassword,
  required String backgroundCachePassword,
}) {
  debugStart?.call('MONERO_Wallet_setupBackgroundSync');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final walletPassword_ = walletPassword.toNativeUtf8().cast<Char>();
  final backgroundCachePassword_ =
      backgroundCachePassword.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_setupBackgroundSync(
      ptr, backgroundSyncType, walletPassword_, backgroundCachePassword_);
  calloc.free(walletPassword_);
  calloc.free(backgroundCachePassword_);
  debugEnd?.call('MONERO_Wallet_setupBackgroundSync');
  return s;
}

int MONERO_Wallet_getBackgroundSyncType(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_getBackgroundSyncType');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_getBackgroundSyncType(ptr);
  debugEnd?.call('MONERO_Wallet_getBackgroundSyncType');
  return v;
}

bool MONERO_Wallet_startBackgroundSync(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_startBackgroundSync');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_startBackgroundSync(ptr);
  debugEnd?.call('MONERO_Wallet_startBackgroundSync');
  return v;
}

bool MONERO_Wallet_stopBackgroundSync(
    MONERO_wallet ptr, String walletPassword) {
  debugStart?.call('MONERO_Wallet_stopBackgroundSync');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final walletPassword_ = walletPassword.toNativeUtf8().cast<Char>();
  final v = lib!.MONERO_Wallet_stopBackgroundSync(ptr, walletPassword_);
  calloc.free(walletPassword_);
  debugEnd?.call('MONERO_Wallet_stopBackgroundSync');
  return v;
}

bool MONERO_Wallet_isBackgroundSyncing(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_isBackgroundSyncing');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_isBackgroundSyncing(ptr);
  debugEnd?.call('MONERO_Wallet_isBackgroundSyncing');
  return v;
}

bool MONERO_Wallet_isBackgroundWallet(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_isBackgroundWallet');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_isBackgroundWallet(ptr);
  debugEnd?.call('MONERO_Wallet_isBackgroundWallet');
  return v;
}

MONERO_TransactionHistory MONERO_Wallet_history(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_history');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final history = lib!.MONERO_Wallet_history(ptr);
  debugEnd?.call('MONERO_Wallet_history');
  return history;
}

MONERO_AddressBook MONERO_Wallet_addressBook(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_addressBook');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final history = lib!.MONERO_Wallet_addressBook(ptr);
  debugEnd?.call('MONERO_Wallet_addressBook');
  return history;
}

MONERO_AddressBook MONERO_Wallet_coins(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_coins');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final history = lib!.MONERO_Wallet_coins(ptr);
  debugEnd?.call('MONERO_Wallet_coins');
  return history;
}

MONERO_AddressBook MONERO_Wallet_subaddress(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_subaddress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final history = lib!.MONERO_Wallet_subaddress(ptr);
  debugEnd?.call('MONERO_Wallet_subaddress');
  return history;
}

MONERO_AddressBook MONERO_Wallet_subaddressAccount(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_subaddressAccount');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final history = lib!.MONERO_Wallet_subaddressAccount(ptr);
  debugEnd?.call('MONERO_Wallet_subaddressAccount');
  return history;
}

int MONERO_Wallet_defaultMixin(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_defaultMixin');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_defaultMixin(ptr);
  debugEnd?.call('MONERO_Wallet_defaultMixin');
  return v;
}

void MONERO_Wallet_setDefaultMixin(MONERO_wallet ptr, int arg) {
  debugStart?.call('MONERO_Wallet_setDefaultMixin');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_setDefaultMixin(ptr, arg);
  debugEnd?.call('MONERO_Wallet_setDefaultMixin');
  return v;
}

bool MONERO_Wallet_setCacheAttribute(MONERO_wallet ptr,
    {required String key, required String value}) {
  debugStart?.call('MONERO_Wallet_setCacheAttribute');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final key_ = key.toNativeUtf8().cast<Char>();
  final value_ = value.toNativeUtf8().cast<Char>();
  final v = lib!.MONERO_Wallet_setCacheAttribute(ptr, key_, value_);
  calloc.free(key_);
  calloc.free(value_);
  debugEnd?.call('MONERO_Wallet_setCacheAttribute');
  return v;
}

String MONERO_Wallet_getCacheAttribute(MONERO_wallet ptr,
    {required String key}) {
  debugStart?.call('MONERO_Wallet_getCacheAttribute');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final key_ = key.toNativeUtf8().cast<Char>();
    final v = lib!
        .MONERO_Wallet_getCacheAttribute(ptr, key_)
        .cast<Utf8>()
        .toDartString();
    calloc.free(key_);
    debugEnd?.call('MONERO_Wallet_getCacheAttribute');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_getCacheAttribute', e);
    debugEnd?.call('MONERO_Wallet_getCacheAttribute');
    return "";
  }
}

bool MONERO_Wallet_setUserNote(MONERO_wallet ptr,
    {required String txid, required String note}) {
  debugStart?.call('MONERO_Wallet_setUserNote');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final txid_ = txid.toNativeUtf8().cast<Char>();
  final note_ = note.toNativeUtf8().cast<Char>();
  final v = lib!.MONERO_Wallet_setUserNote(ptr, txid_, note_);
  calloc.free(txid_);
  calloc.free(note_);
  debugEnd?.call('MONERO_Wallet_setUserNote');
  return v;
}

String MONERO_Wallet_getUserNote(MONERO_wallet ptr, {required String txid}) {
  debugStart?.call('MONERO_Wallet_getUserNote');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final txid_ = txid.toNativeUtf8().cast<Char>();
    final v =
        lib!.MONERO_Wallet_getUserNote(ptr, txid_).cast<Utf8>().toDartString();
    calloc.free(txid_);
    debugEnd?.call('MONERO_Wallet_getUserNote');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_getUserNote', e);
    debugEnd?.call('MONERO_Wallet_getUserNote');
    return "";
  }
}

String MONERO_Wallet_getTxKey(MONERO_wallet ptr, {required String txid}) {
  debugStart?.call('MONERO_Wallet_getTxKey');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final txid_ = txid.toNativeUtf8().cast<Char>();
    final v =
        lib!.MONERO_Wallet_getTxKey(ptr, txid_).cast<Utf8>().toDartString();
    calloc.free(txid_);
    debugEnd?.call('MONERO_Wallet_getTxKey');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_getTxKey', e);
    debugEnd?.call('MONERO_Wallet_getTxKey');
    return "";
  }
}

String MONERO_Wallet_signMessage(
  MONERO_wallet ptr, {
  required String message,
  required String address,
}) {
  debugStart?.call('MONERO_Wallet_signMessage');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final message_ = message.toNativeUtf8().cast<Char>();
    final address_ = address.toNativeUtf8().cast<Char>();
    final v = lib!
        .MONERO_Wallet_signMessage(ptr, message_, address_)
        .cast<Utf8>()
        .toDartString();
    calloc.free(message_);
    calloc.free(address_);
    debugEnd?.call('MONERO_Wallet_signMessage');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_signMessage', e);
    debugEnd?.call('MONERO_Wallet_signMessage');
    return "";
  }
}

bool MONERO_Wallet_verifySignedMessage(
  MONERO_wallet ptr, {
  required String message,
  required String address,
  required String signature,
}) {
  debugStart?.call('MONERO_Wallet_verifySignedMessage');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final message_ = message.toNativeUtf8().cast<Char>();
  final address_ = address.toNativeUtf8().cast<Char>();
  final signature_ = signature.toNativeUtf8().cast<Char>();
  final v = lib!
      .MONERO_Wallet_verifySignedMessage(ptr, message_, address_, signature_);
  calloc.free(message_);
  calloc.free(address_);
  calloc.free(signature_);
  debugEnd?.call('MONERO_Wallet_verifySignedMessage');
  return v;
}

bool MONERO_Wallet_rescanSpent(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_rescanSpent');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_rescanSpent(ptr);
  debugEnd?.call('MONERO_Wallet_rescanSpent');
  return v;
}

void MONERO_Wallet_setOffline(MONERO_wallet ptr, {required bool offline}) {
  debugStart?.call('MONERO_Wallet_setOffline');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final setOffline = lib!.MONERO_Wallet_setOffline(ptr, offline);
  debugEnd?.call('MONERO_Wallet_setOffline');
  return setOffline;
}

bool MONERO_Wallet_isOffline(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_isOffline');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final isOffline = lib!.MONERO_Wallet_isOffline(ptr);
  debugEnd?.call('MONERO_Wallet_isOffline');
  return isOffline;
}

void MONERO_Wallet_segregatePreForkOutputs(MONERO_wallet ptr,
    {required bool segregate}) {
  debugStart?.call('MONERO_Wallet_segregatePreForkOutputs');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_segregatePreForkOutputs(ptr, segregate);
  debugEnd?.call('MONERO_Wallet_segregatePreForkOutputs');
  return v;
}

void MONERO_Wallet_segregationHeight(MONERO_wallet ptr, {required int height}) {
  debugStart?.call('MONERO_Wallet_segregationHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_segregationHeight(ptr, height);
  debugEnd?.call('MONERO_Wallet_segregationHeight');
  return v;
}

void MONERO_Wallet_keyReuseMitigation2(MONERO_wallet ptr,
    {required bool mitigation}) {
  debugStart?.call('MONERO_Wallet_keyReuseMitigation2');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_keyReuseMitigation2(ptr, mitigation);
  debugEnd?.call('MONERO_Wallet_keyReuseMitigation2');
  return v;
}

bool MONERO_Wallet_lockKeysFile(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_lockKeysFile');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_lockKeysFile(ptr);
  debugEnd?.call('MONERO_Wallet_lockKeysFile');
  return v;
}

bool MONERO_Wallet_unlockKeysFile(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_unlockKeysFile');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_unlockKeysFile(ptr);
  debugEnd?.call('MONERO_Wallet_unlockKeysFile');
  return v;
}

bool MONERO_Wallet_isKeysFileLocked(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_isKeysFileLocked');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_isKeysFileLocked(ptr);
  debugEnd?.call('MONERO_Wallet_isKeysFileLocked');
  return v;
}

int MONERO_Wallet_getDeviceType(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_getDeviceType');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_getDeviceType(ptr);
  debugEnd?.call('MONERO_Wallet_getDeviceType');
  return v;
}

int MONERO_Wallet_coldKeyImageSync(MONERO_wallet ptr,
    {required int spent, required int unspent}) {
  debugStart?.call('MONERO_Wallet_coldKeyImageSync');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final v = lib!.MONERO_Wallet_coldKeyImageSync(ptr, spent, unspent);
  debugEnd?.call('MONERO_Wallet_coldKeyImageSync');
  return v;
}

String MONERO_Wallet_deviceShowAddress(MONERO_wallet ptr,
    {required int accountIndex, required int addressIndex}) {
  debugStart?.call('MONERO_Wallet_deviceShowAddress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v = lib!
        .MONERO_Wallet_deviceShowAddress(ptr, accountIndex, addressIndex)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_Wallet_deviceShowAddress');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_deviceShowAddress', e);
    debugEnd?.call('MONERO_Wallet_deviceShowAddress');
    return "";
  }
}

String MONERO_Wallet_reconnectDevice(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_reconnectDevice');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final v =
        lib!.MONERO_Wallet_reconnectDevice(ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_reconnectDevice');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_reconnectDevice', e);
    debugEnd?.call('MONERO_Wallet_reconnectDevice');
    return "";
  }
}

int MONERO_Wallet_getBytesReceived(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_getBytesReceived');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final getBytesReceived = lib!.MONERO_Wallet_getBytesReceived(ptr);
  debugEnd?.call('MONERO_Wallet_getBytesReceived');
  return getBytesReceived;
}

int MONERO_Wallet_getBytesSent(MONERO_wallet ptr) {
  debugStart?.call('MONERO_Wallet_getBytesReceived');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final getBytesSent = lib!.MONERO_Wallet_getBytesSent(ptr);
  debugEnd?.call('MONERO_Wallet_getBytesReceived');
  return getBytesSent;
}

// WalletManager

typedef MONERO_WalletManager = Pointer<Void>;

MONERO_wallet MONERO_WalletManager_createWallet(
  MONERO_WalletManager wm_ptr, {
  required String path,
  required String password,
  String language = "English",
  int networkType = 0,
}) {
  debugStart?.call('MONERO_WalletManager_createWallet');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final language_ = language.toNativeUtf8().cast<Char>();
  final w = lib!.MONERO_WalletManager_createWallet(
      wm_ptr, path_, password_, language_, networkType);
  calloc.free(path_);
  calloc.free(password_);
  calloc.free(language_);
  debugEnd?.call('MONERO_WalletManager_createWallet');
  return w;
}

MONERO_wallet MONERO_WalletManager_openWallet(
  MONERO_WalletManager wm_ptr, {
  required String path,
  required String password,
  int networkType = 0,
}) {
  debugStart?.call('MONERO_WalletManager_openWallet');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final w = lib!
      .MONERO_WalletManager_openWallet(wm_ptr, path_, password_, networkType);
  calloc.free(path_);
  calloc.free(password_);
  debugEnd?.call('MONERO_WalletManager_openWallet');
  return w;
}

MONERO_wallet MONERO_WalletManager_recoveryWallet(
  MONERO_WalletManager wm_ptr, {
  required String path,
  required String password,
  required String mnemonic,
  int networkType = 0,
  required int restoreHeight,
  int kdfRounds = 0,
  required String seedOffset,
}) {
  debugStart?.call('MONERO_WalletManager_recoveryWallet');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final mnemonic_ = mnemonic.toNativeUtf8().cast<Char>();
  final seedOffset_ = seedOffset.toNativeUtf8().cast<Char>();
  final w = lib!.MONERO_WalletManager_recoveryWallet(wm_ptr, path_, password_,
      mnemonic_, networkType, restoreHeight, kdfRounds, seedOffset_);
  calloc.free(path_);
  calloc.free(password_);
  calloc.free(mnemonic_);
  calloc.free(seedOffset_);
  debugEnd?.call('MONERO_WalletManager_recoveryWallet');
  return w;
}

MONERO_wallet MONERO_WalletManager_createWalletFromKeys(
  MONERO_WalletManager wm_ptr, {
  required String path,
  required String password,
  String language = "English",
  int nettype = 1,
  required int restoreHeight,
  required String addressString,
  required String viewKeyString,
  required String spendKeyString,
  int kdf_rounds = 1,
}) {
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  debugStart?.call('MONERO_WalletManager_createWalletFromKeys');

  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final language_ = language.toNativeUtf8().cast<Char>();
  final addressString_ = addressString.toNativeUtf8().cast<Char>();
  final viewKeyString_ = viewKeyString.toNativeUtf8().cast<Char>();
  final spendKeyString_ = spendKeyString.toNativeUtf8().cast<Char>();

  final w = lib!.MONERO_WalletManager_createWalletFromKeys(
    wm_ptr,
    path_,
    password_,
    language_,
    nettype,
    restoreHeight,
    addressString_,
    viewKeyString_,
    spendKeyString_,
    kdf_rounds,
  );
  calloc.free(path_);
  calloc.free(password_);
  calloc.free(language_);
  calloc.free(addressString_);
  calloc.free(viewKeyString_);
  calloc.free(spendKeyString_);
  debugEnd?.call('MONERO_WalletManager_createWalletFromKeys');
  return w;
}

MONERO_wallet MONERO_WalletManager_createWalletFromPolyseed(
  MONERO_WalletManager wm_ptr, {
  required String path,
  required String password,
  int networkType = 0,
  required String mnemonic,
  required String seedOffset,
  required bool newWallet,
  required int restoreHeight,
  required int kdfRounds,
}) {
  debugStart?.call('MONERO_WalletManager_createWalletFromPolyseed');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final mnemonic_ = mnemonic.toNativeUtf8().cast<Char>();
  final seedOffset_ = seedOffset.toNativeUtf8().cast<Char>();
  final w = lib!.MONERO_WalletManager_createWalletFromPolyseed(
      wm_ptr,
      path_,
      password_,
      networkType,
      mnemonic_,
      seedOffset_,
      newWallet,
      restoreHeight,
      kdfRounds);
  calloc.free(path_);
  calloc.free(password_);
  calloc.free(mnemonic_);
  calloc.free(seedOffset_);
  debugEnd?.call('MONERO_WalletManager_createWalletFromPolyseed');
  return w;
}

bool MONERO_WalletManager_closeWallet(
    MONERO_WalletManager wm_ptr, MONERO_wallet ptr, bool store) {
  debugStart?.call('MONERO_WalletManager_closeWallet');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final closeWallet = lib!.MONERO_WalletManager_closeWallet(wm_ptr, ptr, store);
  debugEnd?.call('MONERO_WalletManager_closeWallet');
  return closeWallet;
}

bool MONERO_WalletManager_walletExists(
    MONERO_WalletManager wm_ptr, String path) {
  debugStart?.call('MONERO_WalletManager_walletExists');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final path_ = path.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManager_walletExists(wm_ptr, path_);
  calloc.free(path_);
  debugEnd?.call('MONERO_WalletManager_walletExists');
  return s;
}

bool MONERO_WalletManager_verifyWalletPassword(
  MONERO_WalletManager wm_ptr, {
  required String keysFileName,
  required String password,
  required bool noSpendKey,
  required int kdfRounds,
}) {
  debugStart?.call('MONERO_WalletManager_verifyWalletPassword');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final keysFileName_ = keysFileName.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManager_verifyWalletPassword(
      wm_ptr, keysFileName_, password_, noSpendKey, kdfRounds);
  calloc.free(keysFileName_);
  calloc.free(password_);
  debugEnd?.call('MONERO_WalletManager_verifyWalletPassword');
  return s;
}

String MONERO_WalletManager_findWallets(MONERO_WalletManager wm_ptr,
    {required String path}) {
  debugStart?.call('MONERO_WalletManager_findWallets');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final path_ = path.toNativeUtf8().cast<Char>();
    final v = lib!
        .MONERO_WalletManager_findWallets(wm_ptr, path_, defaultSeparator)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_WalletManager_findWallets');
    return v;
  } catch (e) {
    errorHandler?.call('MONERO_WalletManager_findWallets', e);
    debugEnd?.call('MONERO_WalletManager_findWallets');
    return "";
  }
}

String MONERO_WalletManager_errorString(MONERO_WalletManager wm_ptr) {
  debugStart?.call('MONERO_WalletManager_errorString');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final errorString = lib!
        .MONERO_WalletManager_errorString(wm_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_WalletManager_errorString');
    return errorString;
  } catch (e) {
    errorHandler?.call('MONERO_WalletManager_errorString', e);
    debugEnd?.call('MONERO_WalletManager_errorString');
    return "";
  }
}

void MONERO_WalletManager_setDaemonAddress(
    MONERO_WalletManager wm_ptr, String address) {
  debugStart?.call('MONERO_WalletManager_setDaemonAddress');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManager_setDaemonAddress(wm_ptr, address_);
  calloc.free(address_);
  debugEnd?.call('MONERO_WalletManager_setDaemonAddress');
  return s;
}

int MONERO_WalletManager_blockchainHeight(MONERO_WalletManager wm_ptr) {
  debugStart?.call('MONERO_WalletManager_blockchainHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final s = lib!.MONERO_WalletManager_blockchainHeight(wm_ptr);
  debugEnd?.call('MONERO_WalletManager_blockchainHeight');
  return s;
}

int MONERO_WalletManager_blockchainTargetHeight(MONERO_WalletManager wm_ptr) {
  debugStart?.call('MONERO_WalletManager_blockchainTargetHeight');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final s = lib!.MONERO_WalletManager_blockchainTargetHeight(wm_ptr);
  debugEnd?.call('MONERO_WalletManager_blockchainTargetHeight');
  return s;
}

int MONERO_WalletManager_networkDifficulty(MONERO_WalletManager wm_ptr) {
  debugStart?.call('MONERO_WalletManager_networkDifficulty');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final s = lib!.MONERO_WalletManager_networkDifficulty(wm_ptr);
  debugEnd?.call('MONERO_WalletManager_networkDifficulty');
  return s;
}

double MONERO_WalletManager_miningHashRate(MONERO_WalletManager wm_ptr) {
  debugStart?.call('MONERO_WalletManager_miningHashRate');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final s = lib!.MONERO_WalletManager_miningHashRate(wm_ptr);
  debugEnd?.call('MONERO_WalletManager_miningHashRate');
  return s;
}

int MONERO_WalletManager_blockTarget(MONERO_WalletManager wm_ptr) {
  debugStart?.call('MONERO_WalletManager_blockTarget');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final s = lib!.MONERO_WalletManager_blockTarget(wm_ptr);
  debugEnd?.call('MONERO_WalletManager_blockTarget');
  return s;
}

bool MONERO_WalletManager_isMining(MONERO_WalletManager wm_ptr) {
  debugStart?.call('MONERO_WalletManager_isMining');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final s = lib!.MONERO_WalletManager_isMining(wm_ptr);
  debugEnd?.call('MONERO_WalletManager_isMining');
  return s;
}

bool MONERO_WalletManager_startMining(
  MONERO_WalletManager wm_ptr, {
  required String address,
  required int threads,
  required bool backgroundMining,
  required bool ignoreBattery,
}) {
  debugStart?.call('MONERO_WalletManager_startMining');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManager_startMining(
      wm_ptr, address_, threads, backgroundMining, ignoreBattery);
  calloc.free(address_);
  debugEnd?.call('MONERO_WalletManager_startMining');
  return s;
}

bool MONERO_WalletManager_stopMining(
    MONERO_WalletManager wm_ptr, String address) {
  debugStart?.call('MONERO_WalletManager_stopMining');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManager_stopMining(wm_ptr, address_);
  calloc.free(address_);
  debugEnd?.call('MONERO_WalletManager_stopMining');
  return s;
}

String MONERO_WalletManager_resolveOpenAlias(
  MONERO_WalletManager wm_ptr, {
  required String address,
  required bool dnssecValid,
}) {
  debugStart?.call('MONERO_WalletManager_resolveOpenAlias');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  try {
    final address_ = address.toNativeUtf8().cast<Char>();
    final errorString = lib!
        .MONERO_WalletManager_resolveOpenAlias(wm_ptr, address_, dnssecValid)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_WalletManager_resolveOpenAlias');
    calloc.free(address_);
    return errorString;
  } catch (e) {
    errorHandler?.call('MONERO_WalletManager_resolveOpenAlias', e);
    debugEnd?.call('MONERO_WalletManager_resolveOpenAlias');
    return "";
  }
}

bool MONERO_WalletManager_setProxy(
    MONERO_WalletManager wm_ptr, String address) {
  debugStart?.call('MONERO_WalletManager_setProxy');
  lib ??= MoneroC(DynamicLibrary.open(libPath));

  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManager_setProxy(wm_ptr, address_);
  calloc.free(address_);
  debugEnd?.call('MONERO_WalletManager_setProxy');
  return s;
}

void MONERO_WalletManagerFactory_setLogLevel(int level) {
  debugStart?.call('MONERO_WalletManagerFactory_setLogLevel');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final s = lib!.MONERO_WalletManagerFactory_setLogLevel(level);
  debugEnd?.call('MONERO_WalletManagerFactory_setLogLevel');
  return s;
}

void MONERO_WalletManagerFactory_setLogCategories(String categories) {
  debugStart?.call('MONERO_WalletManagerFactory_setLogCategories');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final categories_ = categories.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManagerFactory_setLogCategories(categories_);
  calloc.free(categories_);
  debugEnd?.call('MONERO_WalletManagerFactory_setLogCategories');
  return s;
}

MONERO_WalletManager MONERO_WalletManagerFactory_getWalletManager() {
  debugStart?.call('MONERO_WalletManagerFactory_getWalletManager');
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  final s = lib!.MONERO_WalletManagerFactory_getWalletManager();
  debugEnd?.call('MONERO_WalletManagerFactory_getWalletManager');
  return s;
}

class LogLevel {
  int get LogLevel_Silent => lib!.LogLevel_Silent;
  int get LogLevel_0 => lib!.LogLevel_0;
  int get LogLevel_1 => lib!.LogLevel_1;
  int get LogLevel_2 => lib!.LogLevel_2;
  int get LogLevel_3 => lib!.LogLevel_3;
  int get LogLevel_4 => lib!.LogLevel_4;
  int get LogLevel_Min => LogLevel_Silent;
  int get LogLevel_Max => lib!.LogLevel_4;
}

class ConnectionStatus {
  int get Disconnected => lib!.WalletConnectionStatus_Disconnected;
  int get Connected => lib!.WalletConnectionStatus_Connected;
  int get WrongVersion => lib!.WalletConnectionStatus_WrongVersion;
}

// DEBUG

class MONERO_libOk {
  MONERO_libOk(
    this.test1,
    this.test2,
    this.test3,
    this.test4,
    this.test5,
    this.test5_std,
  );
  final bool test1;
  final int test2;
  final int test3;
  final Pointer<Void> test4;
  final Pointer<Char> test5;
  String get test5_str {
    try {
      return test5.cast<Utf8>().toDartString();
    } catch (e) {
      return "$e";
    }
  }

  String get test5_str16 {
    try {
      return test5.cast<Utf16>().toDartString();
    } catch (e) {
      return "$e";
    }
  }

  final Pointer<Char> test5_std;
  String get test5_std_str {
    try {
      return test5_std.cast<Utf8>().toDartString();
    } catch (e) {
      return "$e";
    }
  }

  String get test5_std_str16 {
    try {
      return test5_std.cast<Utf16>().toDartString();
    } catch (e) {
      return "$e";
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "test1": test1,
      "test2": test2,
      "test3": test3,
      "test4": test4.toString(),
      "test5": test5.toString(),
      "test5_str": test5_str,
      "test5_std": test5_std.toString(),
      "test5_std_str": test5_std_str,
    };
  }
}

MONERO_libOk MONERO_isLibOk() {
  lib ??= MoneroC(DynamicLibrary.open(libPath));
  lib!.MONERO_DEBUG_test0();
  final test1 = lib!.MONERO_DEBUG_test1(true);
  final test2 = lib!.MONERO_DEBUG_test2(-1);
  final test3 = lib!.MONERO_DEBUG_test3(1);
  final test4 = lib!.MONERO_DEBUG_test4(1);
  final test5 = lib!.MONERO_DEBUG_test5();
  final test5_std = lib!.MONERO_DEBUG_test5_std();
  return MONERO_libOk(test1, test2, test3, test4, test5, test5_std);
}
