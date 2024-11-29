///
/// This class provides a set of methods to generate ANSI color codes.
///
/// Colors are represented by an integer value between 0 and 255.
///
/// The color codes are used to colorize the output of the logger.
///
/// https://talyian.github.io/ansicolors/ can be used to find the color code.
class AnsiColorUtils {
  /// Returns the ANSI color code for the foreground color.
  /// The value of [i] must be between 0 and 255.
  static String getForegroundColor(int i) {
    assert(i >= 0 && i <= 255);
    return '\x1b[38;5;${i}m';
  }

  /// Returns the ANSI color code for the background color.
  /// The value of [i] must be between 0 and 255.
  static String getBackgroundColor(int i) {
    assert(i >= 0 && i <= 255);
    return '\x1b[48;5;${i}m';
  }
}
