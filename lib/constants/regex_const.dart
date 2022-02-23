part of 'constants.dart';

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Email Tidak Boleh Kosong";
const String kInvalidEmailError = "Tolong Masukkan Email Dengan Benar";
const String kPassNullError = "Password Tidak Boleh Kosong";
const String kShortPassError = "Password Kurang Dari 8";
const String kMatchPassError = "Passoword Salah";
const String kNamelNullError = "Nama Tidak Boleh Kosong";
const String kNimNullError = "Nama Tidak Boleh Kosong";
const String kAddressNullError = "Alamat Tidak Boleh Kosong";
const String kIsNotAdmin = "Anda Bukan Admin Silahkan Login Di User";
const String kIsNotUser = "Anda Bukan User Silahkan Login Di Admin";
