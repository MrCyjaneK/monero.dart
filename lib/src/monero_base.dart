// Wrapper around generated_bindings.g.dart - to provide easy access to the
// underlying functions, feel free to not use it at all.

// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:ffi';
import 'dart:math';

import 'package:ffi/ffi.dart';
import 'package:monero/src/generated_bindings.g.dart';

typedef MONERO_PendingTransaction = Pointer<Void>;

int MONERO_PendingTransaction_status(MONERO_PendingTransaction pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_PendingTransaction_status(pendingTx_ptr);
}

String MONERO_PendingTransaction_errorString(
    MONERO_PendingTransaction pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_PendingTransaction_errorString(pendingTx_ptr)
      .cast<Utf8>()
      .toDartString();
}

bool MONERO_PendingTransaction_commit(MONERO_PendingTransaction pendingTx_ptr,
    {required String filename, required bool overwrite}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final filename_ = filename.toNativeUtf8().cast<Char>();
  final result =
      lib.MONERO_PendingTransaction_commit(pendingTx_ptr, filename_, overwrite);
  calloc.free(filename_);
  return result;
}

int MONERO_PendingTransaction_amount(MONERO_PendingTransaction pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_PendingTransaction_amount(pendingTx_ptr);
}

int MONERO_PendingTransaction_dust(MONERO_PendingTransaction pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_PendingTransaction_dust(pendingTx_ptr);
}

int MONERO_PendingTransaction_fee(MONERO_PendingTransaction pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_PendingTransaction_fee(pendingTx_ptr);
}

int MONERO_PendingTransaction_txCount(MONERO_PendingTransaction pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_PendingTransaction_txCount(pendingTx_ptr);
}

// TransactionInfo

typedef MONERO_TransactionInfo = Pointer<Void>;

enum TransactionInfo_Direction { In, Out }

TransactionInfo_Direction MONERO_TransactionInfo_direction(
    MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return TransactionInfo_Direction
      .values[lib.MONERO_TransactionInfo_direction(pendingTx_ptr)];
}

bool MONERO_TransactionInfo_isPending(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_isPending(pendingTx_ptr);
}

bool MONERO_TransactionInfo_isFailed(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_isFailed(pendingTx_ptr);
}

bool MONERO_TransactionInfo_isCoinbase(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_isCoinbase(pendingTx_ptr);
}

int MONERO_TransactionInfo_amount(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_amount(pendingTx_ptr);
}

int MONERO_TransactionInfo_fee(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_fee(pendingTx_ptr);
}

int MONERO_TransactionInfo_blockHeight(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_blockHeight(pendingTx_ptr);
}

String MONERO_TransactionInfo_description(
    MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_description(pendingTx_ptr)
      .cast<Utf8>()
      .toDartString();
}

int MONERO_TransactionInfo_subaddrAccount(
    MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_subaddrAccount(pendingTx_ptr);
}

String MONERO_TransactionInfo_label(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_label(pendingTx_ptr)
      .cast<Utf8>()
      .toDartString();
}

int MONERO_TransactionInfo_confirmations(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_confirmations(pendingTx_ptr);
}

int MONERO_TransactionInfo_unlockTime(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_unlockTime(pendingTx_ptr);
}

String MONERO_TransactionInfo_hash(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_hash(pendingTx_ptr)
      .cast<Utf8>()
      .toDartString();
}

int MONERO_TransactionInfo_timestamp(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_timestamp(pendingTx_ptr);
}

String MONERO_TransactionInfo_paymentId(MONERO_TransactionInfo pendingTx_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionInfo_paymentId(pendingTx_ptr)
      .cast<Utf8>()
      .toDartString();
}

// TransactionHistory

typedef MONERO_TransactionHistory = Pointer<Void>;

int MONERO_TransactionHistory_count(MONERO_TransactionHistory txHistory_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionHistory_count(txHistory_ptr);
}

MONERO_TransactionInfo MONERO_TransactionHistory_transaction(
    MONERO_TransactionHistory txHistory_ptr,
    {required int index}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionHistory_transaction(txHistory_ptr, index);
}

void MONERO_TransactionHistory_refresh(
    MONERO_TransactionHistory txHistory_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_TransactionHistory_refresh(txHistory_ptr);
}

void MONERO_TransactionHistory_setTxNote(
    MONERO_TransactionHistory txHistory_ptr,
    {required String txid,
    required String note}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final txid_ = txid.toNativeUtf8().cast<Char>();
  final note_ = note.toNativeUtf8().cast<Char>();
  return lib.MONERO_TransactionHistory_setTxNote(txHistory_ptr, txid_, note_);
}

// Wallet

typedef MONERO_wallet = Pointer<Void>;

bool MONERO_isLibOk() {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib
          .MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverything(
              1) ==
      42;
}

String MONERO_Wallet_seed(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final c = lib.MONERO_Wallet_seed(wallet_ptr);
  final s = c.cast<Utf8>().toDartString();
  return s;
}

int MONERO_Wallet_status(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_status(wallet_ptr);
}

String MONERO_Wallet_errorString(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final c = lib.MONERO_Wallet_errorString(wallet_ptr);
  final s = c.cast<Utf8>().toDartString();
  return s;
}

String MONERO_Wallet_address(MONERO_wallet wallet_ptr,
    {int accountIndex = 0, int addressIndex = 0}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final c = lib.MONERO_Wallet_address(wallet_ptr, accountIndex, addressIndex);
  final s = c.cast<Utf8>().toDartString();
  return s;
}

String MONERO_Wallet_secretViewKey(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final c = lib.MONERO_Wallet_secretViewKey(wallet_ptr);
  final s = c.cast<Utf8>().toDartString();
  return s;
}

String MONERO_Wallet_publicViewKey(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final c = lib.MONERO_Wallet_publicViewKey(wallet_ptr);
  final s = c.cast<Utf8>().toDartString();
  return s;
}

String MONERO_Wallet_secretSpendKey(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final c = lib.MONERO_Wallet_secretSpendKey(wallet_ptr);
  final s = c.cast<Utf8>().toDartString();
  return s;
}

String MONERO_Wallet_publicSpendKey(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final c = lib.MONERO_Wallet_publicSpendKey(wallet_ptr);
  final s = c.cast<Utf8>().toDartString();
  return s;
}

void MONERO_Wallet_stop(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  lib.MONERO_Wallet_stop(wallet_ptr);
}

bool MONERO_Wallet_store(MONERO_wallet wallet_ptr, {String path = ""}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final path_ = path.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_store(wallet_ptr, path_);
  calloc.free(path_);
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
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final daemonAddress_ = daemonAddress.toNativeUtf8().cast<Char>();
  final daemonUsername_ = daemonUsername.toNativeUtf8().cast<Char>();
  final daemonPassword_ = daemonPassword.toNativeUtf8().cast<Char>();
  final proxyAddress_ = proxyAddress.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_init(
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
  return s;
}

int MONERO_Wallet_balance(MONERO_wallet wallet_ptr,
    {required int accountIndex}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_balance(wallet_ptr, accountIndex);
}

int MONERO_Wallet_unlockedBalance(MONERO_wallet wallet_ptr,
    {required int accountIndex}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_unlockedBalance(wallet_ptr, accountIndex);
}

bool MONERO_Wallet_watchOnly(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_watchOnly(wallet_ptr);
}

int MONERO_Wallet_blockChainHeight(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_blockChainHeight(wallet_ptr);
}

int MONERO_Wallet_approximateBlockChainHeight(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_approximateBlockChainHeight(wallet_ptr);
}

int MONERO_Wallet_estimateBlockChainHeight(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_estimateBlockChainHeight(wallet_ptr);
}

int MONERO_Wallet_daemonBlockChainHeight(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_daemonBlockChainHeight(wallet_ptr);
}

bool MONERO_Wallet_synchronized(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_synchronized(wallet_ptr);
}

String MONERO_Wallet_displayAmount(int amount) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_displayAmount(amount).cast<Utf8>().toDartString();
}

bool MONERO_Wallet_addressValid(String address) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_addressValid(address_, lib.NetworkTypeMAINNET);
  calloc.free(address_);
  return s;
}

void MONERO_Wallet_init3(
  MONERO_wallet wallet_ptr, {
  required String argv0,
  required String defaultLogBaseName,
  required String logPath,
  required bool console,
}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final argv0_ = argv0.toNativeUtf8().cast<Char>();
  final defaultLogBaseName_ = defaultLogBaseName.toNativeUtf8().cast<Char>();
  final logPath_ = logPath.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_init3(
      wallet_ptr, argv0_, defaultLogBaseName_, logPath_, console);
  calloc.free(argv0_);
  calloc.free(defaultLogBaseName_);
  calloc.free(logPath_);
  return s;
}

void MONERO_Wallet_startRefresh(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_startRefresh(wallet_ptr);
}

void MONERO_Wallet_pauseRefresh(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_pauseRefresh(wallet_ptr);
}

bool MONERO_Wallet_refresh(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_refresh(wallet_ptr);
}

void MONERO_Wallet_refreshAsync(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_refreshAsync(wallet_ptr);
}

bool MONERO_Wallet_rescanBlockchain(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_rescanBlockchain(wallet_ptr);
}

void MONERO_Wallet_rescanBlockchainAsync(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_rescanBlockchainAsync(wallet_ptr);
}

void MONERO_Wallet_setAutoRefreshInterval(MONERO_wallet wallet_ptr,
    {required int millis}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_setAutoRefreshInterval(wallet_ptr, millis);
}

int MONERO_Wallet_autoRefreshInterval(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_autoRefreshInterval(wallet_ptr);
}

void MONERO_Wallet_addSubaddressAccount(MONERO_wallet wallet_ptr,
    {String label = ""}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final label_ = label.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_addSubaddressAccount(wallet_ptr, label_);
  calloc.free(label_);
  return s;
}

int MONERO_Wallet_numSubaddressAccounts(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_numSubaddressAccounts(wallet_ptr);
}

int MONERO_Wallet_numSubaddresses(MONERO_wallet wallet_ptr,
    {required int accountIndex}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_numSubaddresses(wallet_ptr, accountIndex);
}

String MONERO_Wallet_getSubaddressLabel(MONERO_wallet wallet_ptr,
    {required int accountIndex, required int addressIndex}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_getSubaddressLabel(
          wallet_ptr, accountIndex, addressIndex)
      .cast<Utf8>()
      .toDartString();
}

void MONERO_Wallet_setSubaddressLabel(MONERO_wallet wallet_ptr,
    {required int accountIndex,
    required int addressIndex,
    required String label}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final label_ = label.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_setSubaddressLabel(
      wallet_ptr, accountIndex, addressIndex, label_);
  calloc.free(label_);
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
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final dst_addr_ = dst_addr.toNativeUtf8().cast<Char>();
  final payment_id_ = payment_id.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_createTransaction(
      wallet_ptr,
      dst_addr_,
      payment_id_,
      amount,
      mixin_count,
      pendingTransactionPriority,
      subaddr_account);
  calloc.free(dst_addr_);
  calloc.free(payment_id_);
  return s;
}

bool MONERO_Wallet_submitTransaction(
    MONERO_wallet wallet_ptr, String filename) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_submitTransaction(wallet_ptr, filename_);
  calloc.free(filename_);
  return s;
}

bool MONERO_Wallet_exportKeyImages(MONERO_wallet wallet_ptr, String filename,
    {required bool all}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_exportKeyImages(wallet_ptr, filename_, all);
  calloc.free(filename_);
  return s;
}

bool MONERO_Wallet_importKeyImages(MONERO_wallet wallet_ptr, String filename) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_importKeyImages(wallet_ptr, filename_);
  calloc.free(filename_);
  return s;
}

bool MONERO_Wallet_exportOutputs(MONERO_wallet wallet_ptr, String filename,
    {required bool all}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_exportOutputs(wallet_ptr, filename_, all);
  calloc.free(filename_);
  return s;
}

bool MONERO_Wallet_importOutputs(MONERO_wallet wallet_ptr, String filename) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final filename_ = filename.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_Wallet_importOutputs(wallet_ptr, filename_);
  calloc.free(filename_);
  return s;
}

MONERO_TransactionHistory MONERO_Wallet_history(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_history(wallet_ptr);
}

int MONERO_Wallet_getBytesReceived(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_getBytesReceived(wallet_ptr);
}

int MONERO_Wallet_getBytesSent(MONERO_wallet wallet_ptr) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_Wallet_getBytesSent(wallet_ptr);
}

// WalletManager

MONERO_wallet MONERO_WalletManager_createWallet({
  required String path,
  required String password,
  String language = "English",
  int networkType = 0,
}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final language_ = language.toNativeUtf8().cast<Char>();
  final w = lib.MONERO_WalletManager_createWallet(
      path_, password_, language_, networkType);
  calloc.free(path_);
  calloc.free(password_);
  calloc.free(language_);
  return w;
}

MONERO_wallet MONERO_WalletManager_openWallet({
  required String path,
  required String password,
  int networkType = 0,
}) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final w = lib.MONERO_WalletManager_openWallet(path_, password_, networkType);
  calloc.free(path_);
  calloc.free(password_);
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
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  final path_ = path.toNativeUtf8().cast<Char>();
  final password_ = password.toNativeUtf8().cast<Char>();
  final mnemonic_ = mnemonic.toNativeUtf8().cast<Char>();
  final seedOffset_ = seedOffset.toNativeUtf8().cast<Char>();
  final w = lib.MONERO_WalletManager_recoveryWallet(path_, password_, mnemonic_,
      networkType, restoreHeight, kdfRounds, seedOffset_);
  calloc.free(path_);
  calloc.free(password_);
  calloc.free(mnemonic_);
  calloc.free(seedOffset_);
  return w;
}

bool MONERO_WalletManager_closeWallet(MONERO_wallet wallet_ptr, bool store) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_WalletManager_closeWallet(wallet_ptr, store);
}

bool MONERO_WalletManager_walletExists(String path) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final path_ = path.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_WalletManager_walletExists(path_);
  calloc.free(path_);
  return s;
}

String MONERO_WalletManager_errorString() {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib.MONERO_WalletManager_errorString().cast<Utf8>().toDartString();
}

void MONERO_WalletManager_setDaemonAddress(String address) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));

  final address_ = address.toNativeUtf8().cast<Char>();
  final s = lib.MONERO_WalletManager_setDaemonAddress(address_);
  calloc.free(address_);
  return s;
}

int MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverything(
    int x) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib
      .MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverything(
          x);
}
