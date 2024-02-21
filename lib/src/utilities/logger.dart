import 'package:logger/logger.dart';
class Console {
  static void log(dynamic text) => Logger().d(text);
  static void error(dynamic text) => Logger().e(text);
  static void warning(dynamic text) => Logger().w(text);
  static void info(dynamic text) => Logger().i(text);
  static void wtf(dynamic text) => Logger(printer: CustomPrinter()).f(text);
}

class CustomPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final AnsiColor? color = PrettyPrinter().levelColors?[event.level];
    final String? emoji = PrettyPrinter().levelEmojis?[event.level];
    final dynamic message = event.message;
    return <String>[color!('$emoji: $message')];
  }
}
