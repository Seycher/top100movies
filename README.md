# applaca

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// command for code generation moor and injectable:
flutter packages pub run build_runner watch
// Generate .arb file template with currently used Strings: 
flutter pub run intl_translation:generate_from_arb --output-dir=lib/ui/internalization/I10n --no-use-deferred-loading lib/ui/internalization/locales.dart lib/ui/internalization/I10
n/intl_messages.arb lib/ui/internalization/I10n/intl_pl.arb

