# AtomicDEX Flutter Server

A Flutter package for running the AtomicDEX API binary on Flutter-supported devices.

> :warning: **NOT PRODUCTION-READY**: This package is an early alpha version. Expect breaking API changes. Use at own risk.

## Responsible for:

- Starting and stopping API binary.
- Listening for log/status updates (Expose a stream).
- Protection to ensure the server isn’t stopped while there are ongoing tasks.
- Gracefully handling tasks which were interrupted by an unexpected server shutdown (e.g. user forces the app to close). Could either be “cleanup” of the tasks, or resuming/re-attempting the tasks.
- Restarting the API when a request to change the active account ID is requested.
- Any other native code calls.

## Platform build-time API download support:
- [x] Android
- [ ] iOS
- [ ] macOS
- [ ] Linux
- [ ] Windows
- [ ] Web

## Stage 2:
- Download API binary at build-time. The challenge with this is that it will need to be written in the native build code for each platform supported. See the following Flutter package for an example of how this is already solved: https://github.com/juancastillo0/wasm_run


