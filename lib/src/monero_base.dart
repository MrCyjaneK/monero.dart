// Wrapper around generated_bindings.g.dart - to provide easy access to the
// underlying functions, feel free to not use it at all.

// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:monero/src/generated_bindings.g.dart';

typedef MONERO_PendingTransaction = Pointer<Void>;

MoneroC? lib;

Map<String, List<int>> debugCallLength = {};

final Stopwatch sw = Stopwatch()..start();

void Function(String call)? debugStart = (call) {
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

int MONERO_PendingTransaction_status(MONERO_PendingTransaction pendingTx_ptr) {
  debugStart?.call('MONERO_PendingTransaction_status');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final status = lib!.MONERO_PendingTransaction_status(pendingTx_ptr);
  debugEnd?.call('MONERO_PendingTransaction_status');
  return status;
}

String MONERO_PendingTransaction_errorString(
    MONERO_PendingTransaction pendingTx_ptr) {
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  debugStart?.call('MONERO_PendingTransaction_errorString');
  try {
    final errorString = lib!
        .MONERO_PendingTransaction_errorString(pendingTx_ptr)
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

bool MONERO_PendingTransaction_commit(MONERO_PendingTransaction pendingTx_ptr,
    {required String filename, required bool overwrite}) {
  debugStart?.call('MONERO_PendingTransaction_commit');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final filename_ = filename.toNativeUtf8().cast<Char>();
  final result = lib!
      .MONERO_PendingTransaction_commit(pendingTx_ptr, filename_, overwrite);
  calloc.free(filename_);
  debugEnd?.call('MONERO_PendingTransaction_commit');
  return result;
}

int MONERO_PendingTransaction_amount(MONERO_PendingTransaction pendingTx_ptr) {
  debugStart?.call('MONERO_PendingTransaction_amount');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final amount = lib!.MONERO_PendingTransaction_amount(pendingTx_ptr);
  debugStart?.call('MONERO_PendingTransaction_amount');
  return amount;
}

int MONERO_PendingTransaction_dust(MONERO_PendingTransaction pendingTx_ptr) {
  debugStart?.call('MONERO_PendingTransaction_dust');

  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final dust = lib!.MONERO_PendingTransaction_dust(pendingTx_ptr);
  debugStart?.call('MONERO_PendingTransaction_dust');
  return dust;
}

int MONERO_PendingTransaction_fee(MONERO_PendingTransaction pendingTx_ptr) {
  debugStart?.call('MONERO_PendingTransaction_fee');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final fee = lib!.MONERO_PendingTransaction_fee(pendingTx_ptr);
  debugEnd?.call('MONERO_PendingTransaction_fee');
  return fee;
}

int MONERO_PendingTransaction_txCount(MONERO_PendingTransaction pendingTx_ptr) {
  debugStart?.call('MONERO_PendingTransaction_txCount');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final txCount = lib!.MONERO_PendingTransaction_txCount(pendingTx_ptr);
  debugEnd?.call('MONERO_PendingTransaction_txCount');
  return txCount;
}

// TransactionInfo

typedef MONERO_TransactionInfo = Pointer<Void>;

enum TransactionInfo_Direction { In, Out }

TransactionInfo_Direction MONERO_TransactionInfo_direction(
    MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_direction');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final tiDir = TransactionInfo_Direction
      .values[lib!.MONERO_TransactionInfo_direction(pendingTx_ptr)];
  debugEnd?.call('MONERO_TransactionInfo_direction');
  return tiDir;
}

bool MONERO_TransactionInfo_isPending(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_isPending');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final isPending = lib!.MONERO_TransactionInfo_isPending(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_isPending');

  return isPending;
}

bool MONERO_TransactionInfo_isFailed(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_isFailed');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final isFailed = lib!.MONERO_TransactionInfo_isFailed(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_isFailed');
  return isFailed;
}

bool MONERO_TransactionInfo_isCoinbase(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_isCoinbase');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final isCoinbase = lib!.MONERO_TransactionInfo_isCoinbase(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_isCoinbase');
  return isCoinbase;
}

int MONERO_TransactionInfo_amount(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_amount');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final amount = lib!.MONERO_TransactionInfo_amount(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_amount');
  return amount;
}

int MONERO_TransactionInfo_fee(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_fee');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final fee = lib!.MONERO_TransactionInfo_fee(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_fee');
  return fee;
}

int MONERO_TransactionInfo_blockHeight(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_blockHeight');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final blockHeight = lib!.MONERO_TransactionInfo_blockHeight(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_blockHeight');
  return blockHeight;
}

String MONERO_TransactionInfo_description(
    MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_description');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final str = lib!
        .MONERO_TransactionInfo_description(pendingTx_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_TransactionInfo_description');
    return str;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_description', e);
    return "";
  }
}

int MONERO_TransactionInfo_subaddrAccount(
    MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_subaddrAccount');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final subaddrAccount =
      lib!.MONERO_TransactionInfo_subaddrAccount(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_subaddrAccount');
  return subaddrAccount;
}

String MONERO_TransactionInfo_label(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_label');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final label = lib!
        .MONERO_TransactionInfo_label(pendingTx_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_TransactionInfo_label');
    return label;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_label', e);
    debugEnd?.call('MONERO_TransactionInfo_label');
    return "";
  }
}

int MONERO_TransactionInfo_confirmations(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_confirmations');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final confirmations =
      lib!.MONERO_TransactionInfo_confirmations(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_confirmations');
  return confirmations;
}

int MONERO_TransactionInfo_unlockTime(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_unlockTime');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final unlockTime = lib!.MONERO_TransactionInfo_unlockTime(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_unlockTime');
  return unlockTime;
}

String MONERO_TransactionInfo_hash(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_hash');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final hash = lib!
        .MONERO_TransactionInfo_hash(pendingTx_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_TransactionInfo_hash');
    return hash;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_hash', e);
    debugEnd?.call('MONERO_TransactionInfo_hash');
    return "";
  }
}

int MONERO_TransactionInfo_timestamp(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_timestamp');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final timestamp = lib!.MONERO_TransactionInfo_timestamp(pendingTx_ptr);
  debugEnd?.call('MONERO_TransactionInfo_timestamp');
  return timestamp;
}

String MONERO_TransactionInfo_paymentId(MONERO_TransactionInfo pendingTx_ptr) {
  debugStart?.call('MONERO_TransactionInfo_paymentId');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final paymentId = lib!
        .MONERO_TransactionInfo_paymentId(pendingTx_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_TransactionInfo_paymentId');
    return paymentId;
  } catch (e) {
    errorHandler?.call('MONERO_TransactionInfo_paymentId', e);
    debugEnd?.call('MONERO_TransactionInfo_paymentId');
    return "";
  }
}

// TransactionHistory

typedef MONERO_TransactionHistory = Pointer<Void>;

int MONERO_TransactionHistory_count(MONERO_TransactionHistory txHistory_ptr) {
  debugStart?.call('MONERO_TransactionHistory_count');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final count = lib!.MONERO_TransactionHistory_count(txHistory_ptr);
  debugEnd?.call('MONERO_TransactionHistory_count');
  return count;
}

MONERO_TransactionInfo MONERO_TransactionHistory_transaction(
    MONERO_TransactionHistory txHistory_ptr,
    {required int index}) {
  debugStart?.call('MONERO_TransactionHistory_transaction');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final transaction =
      lib!.MONERO_TransactionHistory_transaction(txHistory_ptr, index);
  debugEnd?.call('MONERO_TransactionHistory_transaction');
  return transaction;
}

void MONERO_TransactionHistory_refresh(
    MONERO_TransactionHistory txHistory_ptr) {
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib!.MONERO_TransactionHistory_refresh(txHistory_ptr);
}

void MONERO_TransactionHistory_setTxNote(
    MONERO_TransactionHistory txHistory_ptr,
    {required String txid,
    required String note}) {
  debugStart?.call('MONERO_TransactionHistory_setTxNote');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final txid_ = txid.toNativeUtf8().cast<Char>();
  final note_ = note.toNativeUtf8().cast<Char>();
  final s =
      lib!.MONERO_TransactionHistory_setTxNote(txHistory_ptr, txid_, note_);
  calloc.free(txid_);
  calloc.free(note_);
  debugEnd?.call('MONERO_TransactionHistory_setTxNote');
  return s;
}

// Wallet

typedef MONERO_wallet = Pointer<Void>;

String MONERO_Wallet_seed(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_seed');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final seed =
        lib!.MONERO_Wallet_seed(wallet_ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_seed');
    return seed;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_seed', e);
    debugEnd?.call('MONERO_Wallet_seed');
    return "";
  }
}

int MONERO_Wallet_status(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_status');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final status = lib!.MONERO_Wallet_status(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_status');
  return status;
}

String MONERO_Wallet_errorString(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_errorString');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final errorString =
        lib!.MONERO_Wallet_errorString(wallet_ptr).cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_Wallet_errorString');
    return errorString;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_errorString', e);
    debugEnd?.call('MONERO_Wallet_errorString');
    return "";
  }
}

String MONERO_Wallet_address(MONERO_wallet wallet_ptr,
    {int accountIndex = 0, int addressIndex = 0}) {
  debugStart?.call('MONERO_Wallet_address');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final address = lib!
        .MONERO_Wallet_address(wallet_ptr, accountIndex, addressIndex)
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

String MONERO_Wallet_secretViewKey(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_secretViewKey');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final secretViewKey = lib!
        .MONERO_Wallet_secretViewKey(wallet_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_Wallet_secretViewKey');
    return secretViewKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_secretViewKey', e);
    debugEnd?.call('MONERO_Wallet_secretViewKey');
    return "";
  }
}

String MONERO_Wallet_publicViewKey(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_publicViewKey');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final publicViewKey = lib!
        .MONERO_Wallet_publicViewKey(wallet_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_Wallet_publicViewKey');
    return publicViewKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_publicViewKey', e);
    debugEnd?.call('MONERO_Wallet_publicViewKey');
    return "";
  }
}

String MONERO_Wallet_secretSpendKey(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_secretSpendKey');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final secretSpendKey = lib!
        .MONERO_Wallet_secretSpendKey(wallet_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_Wallet_secretSpendKey');
    return secretSpendKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_secretSpendKey', e);
    debugEnd?.call('MONERO_Wallet_secretSpendKey');
    return "";
  }
}

String MONERO_Wallet_publicSpendKey(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_publicSpendKey');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final publicSpendKey = lib!
        .MONERO_Wallet_publicSpendKey(wallet_ptr)
        .cast<Utf8>()
        .toDartString();
    debugEnd?.call('MONERO_Wallet_publicSpendKey');
    return publicSpendKey;
  } catch (e) {
    errorHandler?.call('MONERO_Wallet_publicSpendKey', e);
    debugEnd?.call('MONERO_Wallet_publicSpendKey');
    return "";
  }
}

void MONERO_Wallet_stop(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_stop');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final stop = lib!.MONERO_Wallet_stop(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_stop');
  return stop;
}

bool MONERO_Wallet_store(MONERO_wallet wallet_ptr, {String path = ""}) {
  debugStart?.call('MONERO_Wallet_store');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final path_ = path.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_store(wallet_ptr, path_);
  calloc.free(path_);
  debugEnd?.call('MONERO_Wallet_store');
  return s;
}

bool MONERO_Wallet_init(
  MONERO_wallet wallet_ptr, {
  required String daemonAddress,
  int upperTransacationSizeLimit = 0,
  String daemonUsername = "",
  String daemonPassword = "",
  bool useSsl = false,
  bool lightWallet = false,
  String proxyAddress = "",
}) {
  debugStart?.call('MONERO_Wallet_init');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final daemonAddress_ = daemonAddress.toNativeUtf8().cast<Char>();
  final daemonUsername_ = daemonUsername.toNativeUtf8().cast<Char>();
  final daemonPassword_ = daemonPassword.toNativeUtf8().cast<Char>();
  final proxyAddress_ = proxyAddress.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_init(
      wallet_ptr,
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

int MONERO_Wallet_getRefreshFromBlockHeight(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_getRefreshFromBlockHeight');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final getRefreshFromBlockHeight =
      lib!.MONERO_Wallet_getRefreshFromBlockHeight(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_getRefreshFromBlockHeight');
  return getRefreshFromBlockHeight;
}

bool MONERO_Wallet_connectToDaemon(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_connectToDaemon');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final connectToDaemon = lib!.MONERO_Wallet_connectToDaemon(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_connectToDaemon');
  return connectToDaemon;
}

int MONERO_Wallet_connected(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_connected');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final connected = lib!.MONERO_Wallet_connected(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_connected');
  return connected;
}

bool MONERO_Wallet_setProxy(MONERO_wallet wallet_ptr,
    {required String address}) {
  debugStart?.call('MONERO_Wallet_setProxy');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_setProxy(wallet_ptr, address_);
  calloc.free(address_);
  debugEnd?.call('MONERO_Wallet_setProxy');
  return s;
}

int MONERO_Wallet_balance(MONERO_wallet wallet_ptr,
    {required int accountIndex}) {
  debugStart?.call('MONERO_Wallet_balance');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final balance = lib!.MONERO_Wallet_balance(wallet_ptr, accountIndex);
  debugEnd?.call('MONERO_Wallet_balance');
  return balance;
}

int MONERO_Wallet_unlockedBalance(MONERO_wallet wallet_ptr,
    {required int accountIndex}) {
  debugStart?.call('MONERO_Wallet_unlockedBalance');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final unlockedBalance =
      lib!.MONERO_Wallet_unlockedBalance(wallet_ptr, accountIndex);
  debugEnd?.call('MONERO_Wallet_unlockedBalance');
  return unlockedBalance;
}

bool MONERO_Wallet_watchOnly(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_watchOnly');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final watchOnly = lib!.MONERO_Wallet_watchOnly(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_watchOnly');
  return watchOnly;
}

int MONERO_Wallet_blockChainHeight(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_blockChainHeight');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final blockChainHeight = lib!.MONERO_Wallet_blockChainHeight(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_blockChainHeight');
  return blockChainHeight;
}

int MONERO_Wallet_approximateBlockChainHeight(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_approximateBlockChainHeight');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final approximateBlockChainHeight =
      lib!.MONERO_Wallet_approximateBlockChainHeight(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_approximateBlockChainHeight');
  return approximateBlockChainHeight;
}

int MONERO_Wallet_estimateBlockChainHeight(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_estimateBlockChainHeight');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final estimateBlockChainHeight =
      lib!.MONERO_Wallet_estimateBlockChainHeight(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_estimateBlockChainHeight');
  return estimateBlockChainHeight;
}

int MONERO_Wallet_daemonBlockChainHeight(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_daemonBlockChainHeight');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final daemonBlockChainHeight =
      lib!.MONERO_Wallet_daemonBlockChainHeight(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_daemonBlockChainHeight');
  return daemonBlockChainHeight;
}

bool MONERO_Wallet_synchronized(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_synchronized');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final synchronized = lib!.MONERO_Wallet_synchronized(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_synchronized');
  return synchronized;
}

String MONERO_Wallet_displayAmount(int amount) {
  debugStart?.call('MONERO_Wallet_displayAmount');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
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

bool MONERO_Wallet_addressValid(String address) {
  debugStart?.call('MONERO_Wallet_addressValid');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_addressValid(address_, lib!.NetworkTypeMAINNET);
  calloc.free(address_);
  debugEnd?.call('MONERO_Wallet_addressValid');
  return s;
}

void MONERO_Wallet_init3(
  MONERO_wallet wallet_ptr, {
  required String argv0,
  required String defaultLogBaseName,
  required String logPath,
  required bool console,
}) {
  debugStart?.call('MONERO_Wallet_init3');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final argv0_ = argv0.toNativeUtf8().cast<Char>();
  final defaultLogBaseName_ = defaultLogBaseName.toNativeUtf8().cast<Char>();
  final logPath_ = logPath.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_init3(
      wallet_ptr, argv0_, defaultLogBaseName_, logPath_, console);
  calloc.free(argv0_);
  calloc.free(defaultLogBaseName_);
  calloc.free(logPath_);
  debugEnd?.call('MONERO_Wallet_init3');
  return s;
}

void MONERO_Wallet_startRefresh(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_startRefresh');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final startRefresh = lib!.MONERO_Wallet_startRefresh(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_startRefresh');
}

void MONERO_Wallet_pauseRefresh(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_pauseRefresh');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final pauseRefresh = lib!.MONERO_Wallet_pauseRefresh(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_pauseRefresh');
  return pauseRefresh;
}

bool MONERO_Wallet_refresh(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_refresh');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final refresh = lib!.MONERO_Wallet_refresh(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_refresh');
  return refresh;
}

void MONERO_Wallet_refreshAsync(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_refreshAsync');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final refreshAsync = lib!.MONERO_Wallet_refreshAsync(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_refreshAsync');
  return refreshAsync;
}

bool MONERO_Wallet_rescanBlockchain(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_rescanBlockchain');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final rescanBlockchain = lib!.MONERO_Wallet_rescanBlockchain(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_rescanBlockchain');
  return rescanBlockchain;
}

void MONERO_Wallet_rescanBlockchainAsync(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_rescanBlockchainAsync');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final rescanBlockchainAsync =
      lib!.MONERO_Wallet_rescanBlockchainAsync(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_rescanBlockchainAsync');
  return rescanBlockchainAsync;
}

void MONERO_Wallet_setAutoRefreshInterval(MONERO_wallet wallet_ptr,
    {required int millis}) {
  debugStart?.call('MONERO_Wallet_setAutoRefreshInterval');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final setAutoRefreshInterval =
      lib!.MONERO_Wallet_setAutoRefreshInterval(wallet_ptr, millis);
  debugEnd?.call('MONERO_Wallet_setAutoRefreshInterval');
}

int MONERO_Wallet_autoRefreshInterval(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_autoRefreshInterval');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final autoRefreshInterval =
      lib!.MONERO_Wallet_autoRefreshInterval(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_autoRefreshInterval');
  return autoRefreshInterval;
}

void MONERO_Wallet_addSubaddressAccount(MONERO_wallet wallet_ptr,
    {String label = ""}) {
  debugStart?.call('MONERO_Wallet_addSubaddressAccount');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final label_ = label.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_addSubaddressAccount(wallet_ptr, label_);
  calloc.free(label_);
  debugEnd?.call('MONERO_Wallet_addSubaddressAccount');
  return s;
}

int MONERO_Wallet_numSubaddressAccounts(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_numSubaddressAccounts');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final numSubaddressAccounts =
      lib!.MONERO_Wallet_numSubaddressAccounts(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_numSubaddressAccounts');
  return numSubaddressAccounts;
}

int MONERO_Wallet_numSubaddresses(MONERO_wallet wallet_ptr,
    {required int accountIndex}) {
  debugStart?.call('MONERO_Wallet_numSubaddresses');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final numSubaddresses =
      lib!.MONERO_Wallet_numSubaddresses(wallet_ptr, accountIndex);
  debugEnd?.call('MONERO_Wallet_numSubaddresses');
  return numSubaddresses;
}

String MONERO_Wallet_getSubaddressLabel(MONERO_wallet wallet_ptr,
    {required int accountIndex, required int addressIndex}) {
  debugStart?.call('MONERO_Wallet_getSubaddressLabel');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final getSubaddressLabel = lib!
        .MONERO_Wallet_getSubaddressLabel(
            wallet_ptr, accountIndex, addressIndex)
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

void MONERO_Wallet_setSubaddressLabel(MONERO_wallet wallet_ptr,
    {required int accountIndex,
    required int addressIndex,
    required String label}) {
  debugStart?.call('MONERO_Wallet_setSubaddressLabel');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final label_ = label.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_setSubaddressLabel(
      wallet_ptr, accountIndex, addressIndex, label_);
  calloc.free(label_);
  debugEnd?.call('MONERO_Wallet_setSubaddressLabel');
  return s;
}

MONERO_PendingTransaction MONERO_Wallet_createTransaction(
    MONERO_wallet wallet_ptr,
    {required String dst_addr,
    required String payment_id,
    required int amount,
    required int mixin_count,
    required int pendingTransactionPriority,
    required int subaddr_account}) {
  debugStart?.call('MONERO_Wallet_createTransaction');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final dst_addr_ = dst_addr.toNativeUtf8().cast<Char>();
  final payment_id_ = payment_id.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_createTransaction(
      wallet_ptr,
      dst_addr_,
      payment_id_,
      amount,
      mixin_count,
      pendingTransactionPriority,
      subaddr_account);
  calloc.free(dst_addr_);
  calloc.free(payment_id_);
  debugEnd?.call('MONERO_Wallet_createTransaction');
  return s;
}

bool MONERO_Wallet_submitTransaction(
    MONERO_wallet wallet_ptr, String filename) {
  debugStart?.call('MONERO_Wallet_submitTransaction');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_submitTransaction(wallet_ptr, filename_);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_submitTransaction');
  return s;
}

bool MONERO_Wallet_exportKeyImages(MONERO_wallet wallet_ptr, String filename,
    {required bool all}) {
  debugStart?.call('MONERO_Wallet_exportKeyImages');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_exportKeyImages(wallet_ptr, filename_, all);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_exportKeyImages');
  return s;
}

bool MONERO_Wallet_importKeyImages(MONERO_wallet wallet_ptr, String filename) {
  debugStart?.call('MONERO_Wallet_importKeyImages');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_importKeyImages(wallet_ptr, filename_);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_importKeyImages');
  return s;
}

bool MONERO_Wallet_exportOutputs(MONERO_wallet wallet_ptr, String filename,
    {required bool all}) {
  debugStart?.call('MONERO_Wallet_exportOutputs');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_exportOutputs(wallet_ptr, filename_, all);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_exportOutputs');
  return s;
}

bool MONERO_Wallet_importOutputs(MONERO_wallet wallet_ptr, String filename) {
  debugStart?.call('MONERO_Wallet_importOutputs');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_Wallet_importOutputs(wallet_ptr, filename_);
  calloc.free(filename_);
  debugEnd?.call('MONERO_Wallet_importOutputs');
  return s;
}

MONERO_TransactionHistory MONERO_Wallet_history(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_history');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final history = lib!.MONERO_Wallet_history(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_history');
  return history;
}

void MONERO_Wallet_setOffline(MONERO_wallet wallet_ptr,
    {required bool offline}) {
  debugStart?.call('MONERO_Wallet_setOffline');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final setOffline = lib!.MONERO_Wallet_setOffline(wallet_ptr, offline);
  debugEnd?.call('MONERO_Wallet_setOffline');
  return setOffline;
}

bool MONERO_Wallet_isOffline(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_isOffline');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final isOffline = lib!.MONERO_Wallet_isOffline(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_isOffline');
  return isOffline;
}

int MONERO_Wallet_getBytesReceived(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_getBytesReceived');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final getBytesReceived = lib!.MONERO_Wallet_getBytesReceived(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_getBytesReceived');
  return getBytesReceived;
}

int MONERO_Wallet_getBytesSent(MONERO_wallet wallet_ptr) {
  debugStart?.call('MONERO_Wallet_getBytesReceived');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final getBytesSent = lib!.MONERO_Wallet_getBytesSent(wallet_ptr);
  debugEnd?.call('MONERO_Wallet_getBytesReceived');
  return getBytesSent;
}

// WalletManager

MONERO_wallet MONERO_WalletManager_createWallet({
  required String path,
  required String password,
  String language = "English",
  int networkType = 0,
}) {
  debugStart?.call('MONERO_WalletManager_createWallet');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final language_ = language.toNativeUtf8().cast<Char>();
  final w = lib!.MONERO_WalletManager_createWallet(
      path_, password_, language_, networkType);
  calloc.free(path_);
  calloc.free(password_);
  calloc.free(language_);
  debugEnd?.call('MONERO_WalletManager_createWallet');
  return w;
}

MONERO_wallet MONERO_WalletManager_openWallet({
  required String path,
  required String password,
  int networkType = 0,
}) {
  debugStart?.call('MONERO_WalletManager_openWallet');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final w = lib!.MONERO_WalletManager_openWallet(path_, password_, networkType);
  calloc.free(path_);
  calloc.free(password_);
  debugEnd?.call('MONERO_WalletManager_openWallet');
  return w;
}

MONERO_wallet MONERO_WalletManager_recoveryWallet({
  required String path,
  required String password,
  required String mnemonic,
  int networkType = 0,
  required int restoreHeight,
  int kdfRounds = 0,
  required String seedOffset,
}) {
  debugStart?.call('MONERO_WalletManager_recoveryWallet');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final mnemonic_ = mnemonic.toNativeUtf8().cast<Char>();
  final seedOffset_ = seedOffset.toNativeUtf8().cast<Char>();
  final w = lib!.MONERO_WalletManager_recoveryWallet(path_, password_,
      mnemonic_, networkType, restoreHeight, kdfRounds, seedOffset_);
  calloc.free(path_);
  calloc.free(password_);
  calloc.free(mnemonic_);
  calloc.free(seedOffset_);
  debugEnd?.call('MONERO_WalletManager_recoveryWallet');
  return w;
}

bool MONERO_WalletManager_closeWallet(MONERO_wallet wallet_ptr, bool store) {
  debugStart?.call('MONERO_WalletManager_closeWallet');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final closeWallet = lib!.MONERO_WalletManager_closeWallet(wallet_ptr, store);
  debugEnd?.call('MONERO_WalletManager_closeWallet');
  return closeWallet;
}

bool MONERO_WalletManager_walletExists(String path) {
  debugStart?.call('MONERO_WalletManager_walletExists');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final path_ = path.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManager_walletExists(path_);
  calloc.free(path_);
  debugEnd?.call('MONERO_WalletManager_walletExists');
  return s;
}

String MONERO_WalletManager_errorString() {
  debugStart?.call('MONERO_WalletManager_errorString');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  try {
    final errorString =
        lib!.MONERO_WalletManager_errorString().cast<Utf8>().toDartString();
    debugEnd?.call('MONERO_WalletManager_errorString');
    return errorString;
  } catch (e) {
    errorHandler?.call('MONERO_WalletManager_errorString', e);
    debugEnd?.call('MONERO_WalletManager_errorString');
    return "";
  }
}

void MONERO_WalletManager_setDaemonAddress(String address) {
  debugStart?.call('MONERO_WalletManager_setDaemonAddress');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManager_setDaemonAddress(address_);
  calloc.free(address_);
  debugEnd?.call('MONERO_WalletManager_setDaemonAddress');
  return s;
}

bool MONERO_WalletManager_setProxy(String address) {
  debugStart?.call('MONERO_WalletManager_setProxy');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib!.MONERO_WalletManager_setProxy(address_);
  calloc.free(address_);
  debugEnd?.call('MONERO_WalletManager_setProxy');
  return s;
}

void MONERO_WalletManagerFactory_setLogLevel(int level) {
  debugStart?.call('MONERO_WalletManagerFactory_setLogLevel');
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final s = lib!.MONERO_WalletManagerFactory_setLogLevel(level);
  debugEnd?.call('MONERO_WalletManagerFactory_setLogLevel');
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
  int get Disconnected => lib!.ConnectionStatus_Disconnected;
  int get Connected => lib!.ConnectionStatus_Connected;
  int get WrongVersion => lib!.ConnectionStatus_WrongVersion;
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
  lib ??= MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  lib!.MONERO_DEBUG_test0();
  final test1 = lib!.MONERO_DEBUG_test1(true);
  final test2 = lib!.MONERO_DEBUG_test2(-1);
  final test3 = lib!.MONERO_DEBUG_test3(1);
  final test4 = lib!.MONERO_DEBUG_test4(1);
  final test5 = lib!.MONERO_DEBUG_test5();
  final test5_std = lib!.MONERO_DEBUG_test5_std();
  return MONERO_libOk(test1, test2, test3, test4, test5, test5_std);
}
