MONERO_C_COMMIT='c608ba29601fe8ad3c1cf664f03c960d415dad3e'
MONERO_C_VERSION=018003001
#                  v0.18.3.1
version:
	sed -i "s/version: .*/version: 0.${MONERO_C_VERSION}.$(shell git rev-list --count HEAD)/" "pubspec.yaml"

wallet2_api_c.h:
	wget https://git.mrcyjanek.net/mrcyjanek/monero_c/raw/commit/${MONERO_C_COMMIT}/libbridge/src/main/cpp/wallet2_api_c.h -O wallet2_api_c.h

lib/src/generated_bindings.g.dart:
	dart run ffigen

.PHONY: wallet2_api_c.h lib/src/generated_bindings.g.dart