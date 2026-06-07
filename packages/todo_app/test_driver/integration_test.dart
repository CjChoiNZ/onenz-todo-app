import 'package:integration_test/integration_test_driver.dart';

/// Driver entrypoint for running the `integration_test/` suite in a real
/// browser via `flutter drive` (used by CI for headless Chrome).
Future<void> main() => integrationDriver();
