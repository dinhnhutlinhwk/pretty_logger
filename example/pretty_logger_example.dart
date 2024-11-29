import 'package:pretty_logger/pretty_logger.dart' as logger;
import 'package:pretty_logger/pretty_logger.dart';
import 'package:pretty_logger/src/color_utils.dart';

void main() {
  String color = AnsiColorUtils.getForegroundColor(255);
  // Set Default Color
  PrettyLoger.setDefaultColor(
    nameColor: PrettyColor.magentaColor,
    messageColor: color,
  );

  logger.successLog(
    'Hello',
    // messageColor: PrettyColor.brightBlackColor,
  );
  logger.errorLog(
    'Hello',
  );
  logger.warningLog(
    'Hello',
  );
  logger.infoLog(
    'Hello',
  );
  logger.debugLog(
    'Hello',
  );
  logger.log('Hello', name: '[Name]', level: 0);
}
