# Komodo DeFi Framework Flutter Server

A Flutter package for running the Komodo DeFi Framework API binary on Flutter-supported devices.

> :warning: **NOT PRODUCTION-READY**: This package is an early alpha version. Expect breaking API changes. Use at own risk.

Most features are not yet implemented, and the package is not under active development.

## Roadmap:
- [ ] IN PROGRESS: Download and validate API binary at build-time. See Appendix A
- [ ] Starting and stopping API binary.
- [ ] Listening for log/status updates (Expose a stream).
- [ ] Protection to ensure the server isn’t stopped while there are ongoing tasks.
- [ ] Gracefully handling tasks which were interrupted by an unexpected server shutdown (e.g. user forces the app to close). Could either be “cleanup” of the tasks, or resuming/re-attempting the tasks.
- [ ] Restarting the API when a request to change the active account ID is requested. _(May no longer be needed with [upcoming multi-account/address](https://github.com/KomodoPlatform/atomicDEX-API/issues/1838) changes_
- [ ] Any other native code calls.

## Appendix A (Build-time API download):
### Platform build-time API download support:
- [x] Android
- [ ] iOS
- [ ] macOS
- [ ] Linux
- [ ] Windows
- [ ] Web

### Features:
- Download API binary at build-time. The challenge with this is that it will need to be written in the native build code for each platform supported. See the following Flutter package for an example of how this is already solved: https://github.com/juancastillo0/wasm_run
- The build will fail if there is already an existing API binary with a different hash to the config-specified downloaded binary. If the hashes are the same, it will proceed normally. 
- TODO: Specify an `api_config_ci.json` in the root of the project directory (CURRENTLY HARD-CODED IN ANDROID BUILD FILE)
- TODO: Specify the API hash associated with the binary and verify on download.
