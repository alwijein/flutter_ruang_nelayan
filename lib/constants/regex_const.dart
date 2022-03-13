part of 'constants.dart';

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kNoTelpNullError = "Nomor Telepon Tidak Boleh Kosong";
const String kInvalidNoTelpError = "Nomor Telepon Tidak Sesuai";
const String kPassNullError = "Password Tidak Boleh Kosong";
const String kShortPassError = "Password Kurang Dari 8";
const String kMatchPassError = "Password Tidak Sesuai";
const String kNamelNullError = "Nama Tidak Boleh Kosong";
const String kNoKtpNullError = "Nik Ktp Tidak Boleh Kosong";
const String kIsNotAdmin = "Anda Bukan Admin Silahkan Login Di User";
const String kIsNotUser = "Anda Bukan User Silahkan Login Di Admin";
