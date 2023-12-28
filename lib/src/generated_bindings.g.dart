// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

/// monero_c bindings
class MoneroC {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  MoneroC(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  MoneroC.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<ffi.Char> MONERO_Wallet_seed(
    ffi.Pointer<ffi.Void> wallet_ptr,
  ) {
    return _MONERO_Wallet_seed(
      wallet_ptr,
    );
  }

  late final _MONERO_Wallet_seedPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ffi.Void>)>>('MONERO_Wallet_seed');
  late final _MONERO_Wallet_seed = _MONERO_Wallet_seedPtr.asFunction<
      ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>)>();

  int MONERO_Wallet_status(
    ffi.Pointer<ffi.Void> wallet_ptr,
  ) {
    return _MONERO_Wallet_status(
      wallet_ptr,
    );
  }

  late final _MONERO_Wallet_statusPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.Pointer<ffi.Void>)>>(
          'MONERO_Wallet_status');
  late final _MONERO_Wallet_status = _MONERO_Wallet_statusPtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>)>();

  ffi.Pointer<ffi.Char> MONERO_Wallet_errorString(
    ffi.Pointer<ffi.Void> wallet_ptr,
  ) {
    return _MONERO_Wallet_errorString(
      wallet_ptr,
    );
  }

  late final _MONERO_Wallet_errorStringPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ffi.Void>)>>('MONERO_Wallet_errorString');
  late final _MONERO_Wallet_errorString = _MONERO_Wallet_errorStringPtr
      .asFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>)>();

  ffi.Pointer<ffi.Char> MONERO_Wallet_address(
    ffi.Pointer<ffi.Void> wallet_ptr,
    int accountIndex,
    int addressIndex,
  ) {
    return _MONERO_Wallet_address(
      wallet_ptr,
      accountIndex,
      addressIndex,
    );
  }

  late final _MONERO_Wallet_addressPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>, ffi.Uint64,
              ffi.Uint64)>>('MONERO_Wallet_address');
  late final _MONERO_Wallet_address = _MONERO_Wallet_addressPtr.asFunction<
      ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>, int, int)>();

  ffi.Pointer<ffi.Char> MONERO_Wallet_secretViewKey(
    ffi.Pointer<ffi.Void> wallet_ptr,
  ) {
    return _MONERO_Wallet_secretViewKey(
      wallet_ptr,
    );
  }

  late final _MONERO_Wallet_secretViewKeyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ffi.Void>)>>('MONERO_Wallet_secretViewKey');
  late final _MONERO_Wallet_secretViewKey = _MONERO_Wallet_secretViewKeyPtr
      .asFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>)>();

  ffi.Pointer<ffi.Char> MONERO_Wallet_publicViewKey(
    ffi.Pointer<ffi.Void> wallet_ptr,
  ) {
    return _MONERO_Wallet_publicViewKey(
      wallet_ptr,
    );
  }

  late final _MONERO_Wallet_publicViewKeyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ffi.Void>)>>('MONERO_Wallet_publicViewKey');
  late final _MONERO_Wallet_publicViewKey = _MONERO_Wallet_publicViewKeyPtr
      .asFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>)>();

  ffi.Pointer<ffi.Char> MONERO_Wallet_secretSpendKey(
    ffi.Pointer<ffi.Void> wallet_ptr,
  ) {
    return _MONERO_Wallet_secretSpendKey(
      wallet_ptr,
    );
  }

  late final _MONERO_Wallet_secretSpendKeyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ffi.Void>)>>('MONERO_Wallet_secretSpendKey');
  late final _MONERO_Wallet_secretSpendKey = _MONERO_Wallet_secretSpendKeyPtr
      .asFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>)>();

  ffi.Pointer<ffi.Char> MONERO_Wallet_publicSpendKey(
    ffi.Pointer<ffi.Void> wallet_ptr,
  ) {
    return _MONERO_Wallet_publicSpendKey(
      wallet_ptr,
    );
  }

  late final _MONERO_Wallet_publicSpendKeyPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ffi.Void>)>>('MONERO_Wallet_publicSpendKey');
  late final _MONERO_Wallet_publicSpendKey = _MONERO_Wallet_publicSpendKeyPtr
      .asFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ffi.Void>)>();

  void MONERO_Wallet_stop(
    ffi.Pointer<ffi.Void> wallet_ptr,
  ) {
    return _MONERO_Wallet_stop(
      wallet_ptr,
    );
  }

  late final _MONERO_Wallet_stopPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'MONERO_Wallet_stop');
  late final _MONERO_Wallet_stop =
      _MONERO_Wallet_stopPtr.asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  bool MONERO_Wallet_store(
    ffi.Pointer<ffi.Void> wallet_ptr,
    ffi.Pointer<ffi.Char> path,
  ) {
    return _MONERO_Wallet_store(
      wallet_ptr,
      path,
    );
  }

  late final _MONERO_Wallet_storePtr = _lookup<
      ffi.NativeFunction<
          ffi.Bool Function(ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Char>)>>('MONERO_Wallet_store');
  late final _MONERO_Wallet_store = _MONERO_Wallet_storePtr.asFunction<
      bool Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>)>();

  int MONERO_Wallet_balance(
    ffi.Pointer<ffi.Void> wallet_ptr,
    int accountIndex,
  ) {
    return _MONERO_Wallet_balance(
      wallet_ptr,
      accountIndex,
    );
  }

  late final _MONERO_Wallet_balancePtr = _lookup<
      ffi.NativeFunction<
          ffi.Uint64 Function(
              ffi.Pointer<ffi.Void>, ffi.Uint32)>>('MONERO_Wallet_balance');
  late final _MONERO_Wallet_balance = _MONERO_Wallet_balancePtr.asFunction<
      int Function(ffi.Pointer<ffi.Void>, int)>();

  int MONERO_Wallet_unlockedBalance(
    ffi.Pointer<ffi.Void> wallet_ptr,
    int accountIndex,
  ) {
    return _MONERO_Wallet_unlockedBalance(
      wallet_ptr,
      accountIndex,
    );
  }

  late final _MONERO_Wallet_unlockedBalancePtr = _lookup<
      ffi.NativeFunction<
          ffi.Uint64 Function(ffi.Pointer<ffi.Void>,
              ffi.Uint32)>>('MONERO_Wallet_unlockedBalance');
  late final _MONERO_Wallet_unlockedBalance = _MONERO_Wallet_unlockedBalancePtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>, int)>();

  ffi.Pointer<ffi.Void> MONERO_WalletManager_createWallet(
    ffi.Pointer<ffi.Char> path,
    ffi.Pointer<ffi.Char> password,
    ffi.Pointer<ffi.Char> language,
    int networkType,
  ) {
    return _MONERO_WalletManager_createWallet(
      path,
      password,
      language,
      networkType,
    );
  }

  late final _MONERO_WalletManager_createWalletPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Void> Function(
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>,
              ffi.Int)>>('MONERO_WalletManager_createWallet');
  late final _MONERO_WalletManager_createWallet =
      _MONERO_WalletManager_createWalletPtr.asFunction<
          ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.Char>, int)>();

  ffi.Pointer<ffi.Void> MONERO_WalletManager_openWallet(
    ffi.Pointer<ffi.Char> path,
    ffi.Pointer<ffi.Char> password,
    int networkType,
  ) {
    return _MONERO_WalletManager_openWallet(
      path,
      password,
      networkType,
    );
  }

  late final _MONERO_WalletManager_openWalletPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Void> Function(
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>,
              ffi.Int)>>('MONERO_WalletManager_openWallet');
  late final _MONERO_WalletManager_openWallet =
      _MONERO_WalletManager_openWalletPtr.asFunction<
          ffi.Pointer<ffi.Void> Function(
              ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.Char>, int)>();

  ffi.Pointer<ffi.Void> MONERO_WalletManager_recoveryWallet(
    ffi.Pointer<ffi.Char> path,
    ffi.Pointer<ffi.Char> password,
    ffi.Pointer<ffi.Char> mnemonic,
    int networkType,
    int restoreHeight,
    int kdfRounds,
    ffi.Pointer<ffi.Char> seedOffset,
  ) {
    return _MONERO_WalletManager_recoveryWallet(
      path,
      password,
      mnemonic,
      networkType,
      restoreHeight,
      kdfRounds,
      seedOffset,
    );
  }

  late final _MONERO_WalletManager_recoveryWalletPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Void> Function(
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>,
              ffi.Int,
              ffi.Uint64,
              ffi.Uint64,
              ffi.Pointer<ffi.Char>)>>('MONERO_WalletManager_recoveryWallet');
  late final _MONERO_WalletManager_recoveryWallet =
      _MONERO_WalletManager_recoveryWalletPtr.asFunction<
          ffi.Pointer<ffi.Void> Function(
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>,
              int,
              int,
              int,
              ffi.Pointer<ffi.Char>)>();

  bool MONERO_WalletManager_closeWallet(
    ffi.Pointer<ffi.Void> wallet_ptr,
    bool store,
  ) {
    return _MONERO_WalletManager_closeWallet(
      wallet_ptr,
      store,
    );
  }

  late final _MONERO_WalletManager_closeWalletPtr = _lookup<
          ffi
          .NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
      'MONERO_WalletManager_closeWallet');
  late final _MONERO_WalletManager_closeWallet =
      _MONERO_WalletManager_closeWalletPtr.asFunction<
          bool Function(ffi.Pointer<ffi.Void>, bool)>();

  int MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverything(
    int x,
  ) {
    return _MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverything(
      x,
    );
  }

  late final _MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverythingPtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.Int)>>(
          'MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverything');
  late final _MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverything =
      _MONERO_DEBUG_theAnswerToTheUltimateQuestionOfLifeTheUniverseAndEverythingPtr
          .asFunction<int Function(int)>();
}

final class __fsid_t extends ffi.Struct {
  @ffi.Array.multi([2])
  external ffi.Array<ffi.Int> __val;
}

const int _STDINT_H = 1;

const int _FEATURES_H = 1;

const int _DEFAULT_SOURCE = 1;

const int __GLIBC_USE_ISOC2X = 1;

const int __USE_ISOC11 = 1;

const int __USE_ISOC99 = 1;

const int __USE_ISOC95 = 1;

const int _POSIX_SOURCE = 1;

const int _POSIX_C_SOURCE = 200809;

const int __USE_POSIX = 1;

const int __USE_POSIX2 = 1;

const int __USE_POSIX199309 = 1;

const int __USE_POSIX199506 = 1;

const int __USE_XOPEN2K = 1;

const int __USE_XOPEN2K8 = 1;

const int _ATFILE_SOURCE = 1;

const int __WORDSIZE = 64;

const int __WORDSIZE_TIME64_COMPAT32 = 1;

const int __SYSCALL_WORDSIZE = 64;

const int __TIMESIZE = 64;

const int __USE_MISC = 1;

const int __USE_ATFILE = 1;

const int __USE_FORTIFY_LEVEL = 0;

const int __GLIBC_USE_DEPRECATED_GETS = 0;

const int __GLIBC_USE_DEPRECATED_SCANF = 0;

const int _STDC_PREDEF_H = 1;

const int __STDC_IEC_559__ = 1;

const int __STDC_IEC_60559_BFP__ = 201404;

const int __STDC_IEC_559_COMPLEX__ = 1;

const int __STDC_IEC_60559_COMPLEX__ = 201404;

const int __STDC_ISO_10646__ = 201706;

const int __GNU_LIBRARY__ = 6;

const int __GLIBC__ = 2;

const int __GLIBC_MINOR__ = 36;

const int _SYS_CDEFS_H = 1;

const int __THROW = 1;

const int __THROWNL = 1;

const int __glibc_c99_flexarr_available = 1;

const int __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = 0;

const int __HAVE_GENERIC_SELECTION = 0;

const int __GLIBC_USE_LIB_EXT2 = 1;

const int __GLIBC_USE_IEC_60559_BFP_EXT = 1;

const int __GLIBC_USE_IEC_60559_BFP_EXT_C2X = 1;

const int __GLIBC_USE_IEC_60559_EXT = 1;

const int __GLIBC_USE_IEC_60559_FUNCS_EXT = 1;

const int __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = 1;

const int __GLIBC_USE_IEC_60559_TYPES_EXT = 1;

const int _BITS_TYPES_H = 1;

const int _BITS_TYPESIZES_H = 1;

const int __OFF_T_MATCHES_OFF64_T = 1;

const int __INO_T_MATCHES_INO64_T = 1;

const int __RLIM_T_MATCHES_RLIM64_T = 1;

const int __STATFS_MATCHES_STATFS64 = 1;

const int __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = 1;

const int __FD_SETSIZE = 1024;

const int _BITS_TIME64_H = 1;

const int _BITS_WCHAR_H = 1;

const int __WCHAR_MAX = 2147483647;

const int __WCHAR_MIN = -2147483648;

const int _BITS_STDINT_INTN_H = 1;

const int _BITS_STDINT_UINTN_H = 1;

const int INT8_MIN = -128;

const int INT16_MIN = -32768;

const int INT32_MIN = -2147483648;

const int INT64_MIN = -9223372036854775808;

const int INT8_MAX = 127;

const int INT16_MAX = 32767;

const int INT32_MAX = 2147483647;

const int INT64_MAX = 9223372036854775807;

const int UINT8_MAX = 255;

const int UINT16_MAX = 65535;

const int UINT32_MAX = 4294967295;

const int UINT64_MAX = -1;

const int INT_LEAST8_MIN = -128;

const int INT_LEAST16_MIN = -32768;

const int INT_LEAST32_MIN = -2147483648;

const int INT_LEAST64_MIN = -9223372036854775808;

const int INT_LEAST8_MAX = 127;

const int INT_LEAST16_MAX = 32767;

const int INT_LEAST32_MAX = 2147483647;

const int INT_LEAST64_MAX = 9223372036854775807;

const int UINT_LEAST8_MAX = 255;

const int UINT_LEAST16_MAX = 65535;

const int UINT_LEAST32_MAX = 4294967295;

const int UINT_LEAST64_MAX = -1;

const int INT_FAST8_MIN = -128;

const int INT_FAST16_MIN = -9223372036854775808;

const int INT_FAST32_MIN = -9223372036854775808;

const int INT_FAST64_MIN = -9223372036854775808;

const int INT_FAST8_MAX = 127;

const int INT_FAST16_MAX = 9223372036854775807;

const int INT_FAST32_MAX = 9223372036854775807;

const int INT_FAST64_MAX = 9223372036854775807;

const int UINT_FAST8_MAX = 255;

const int UINT_FAST16_MAX = -1;

const int UINT_FAST32_MAX = -1;

const int UINT_FAST64_MAX = -1;

const int INTPTR_MIN = -9223372036854775808;

const int INTPTR_MAX = 9223372036854775807;

const int UINTPTR_MAX = -1;

const int INTMAX_MIN = -9223372036854775808;

const int INTMAX_MAX = 9223372036854775807;

const int UINTMAX_MAX = -1;

const int PTRDIFF_MIN = -9223372036854775808;

const int PTRDIFF_MAX = 9223372036854775807;

const int SIG_ATOMIC_MIN = -2147483648;

const int SIG_ATOMIC_MAX = 2147483647;

const int SIZE_MAX = -1;

const int WCHAR_MIN = -2147483648;

const int WCHAR_MAX = 2147483647;

const int WINT_MIN = 0;

const int WINT_MAX = 4294967295;

const int true1 = 1;

const int false1 = 0;

const int __bool_true_false_are_defined = 1;