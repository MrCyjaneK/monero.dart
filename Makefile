MONERO_C_COMMIT='a61bd154098bc38ca8cdc4e5c1f8a482c4a5fadb'
MONERO_C_VERSION=018003001
#                  v0.18.3.1
version:
	sed -i "s/version: .*/version: 0.${MONERO_C_VERSION}.$(shell git rev-list --count HEAD)/" "pubspec.yaml"

lib/src/generated_bindings.g.dart:
	dart run ffigen