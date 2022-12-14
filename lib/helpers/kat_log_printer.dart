import 'package:logger/logger.dart';

class KatLogPrinter extends PrettyPrinter {
  final String className;
  KatLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final levelEmjois = PrettyPrinter.levelEmojis
      ..[Level.verbose] = 'π«£πΆβπ«οΈ'
      ..[Level.error] = 'π€¬'
      ..[Level.warning] = 'π§'
      ..[Level.wtf] = 'π€¦πΌββοΈ'
      ..[Level.debug] = 'π';

    /// I don't think those colors are supported are supported in the vscode
    /// as stated in the package docs
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = '\t${levelEmjois[event.level]}';

    return [color!('$emoji + $className | ${event.message}')];
  }
}
