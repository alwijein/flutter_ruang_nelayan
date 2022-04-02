part of 'utils.dart';

class FormatDate {
  static formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MMMM-dd').format(dateTime);
  }

  static formatDateBasic(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static formatDateWithTime(DateTime dateTime) {
    return DateFormat('yyyy-MMMM-dd - kk:mm').format(dateTime);
  }

  static formatDateMonth(DateTime dateTime) {
    return DateFormat('MMMM').format(dateTime);
  }
}
