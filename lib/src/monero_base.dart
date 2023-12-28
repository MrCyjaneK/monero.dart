// Wrapper around generated_bindings.g.dart - to provide easy access to the
// underlying functions, feel free to not use it at all.

// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:monero/src/generated_bindings.g.dart';

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

int MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverything(
    int x) {
  final lib = MoneroC(DynamicLibrary.open('libwallet2_api_c.so'));
  return lib
      .MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverything(
          x);
}
