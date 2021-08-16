import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:password_manager/controllers/encrypter.dart';
import 'package:password_manager/models/password.dart';

final EncryptService _encryptService = new EncryptService();

class PswdController extends GetxController {
  List<Password> _passwords;
  Box<Password> _passwordBox;
  List<Password> get passwords => _passwords;

  PswdController() {
    _passwordBox = Hive.box<Password>('passwords');
    _passwords = [];
    for (int i = 0; i < _passwordBox.values.length; i++) {
      _passwords.add(_passwordBox.getAt(i));
    }
  }

  addPassword(Password password) {
    final newPassword = Password(
      appName: password.appName.toLowerCase(),
      uname: password.uname,
      psswd: _encryptService.encrypt(password.psswd),
    );
    _passwords.add(newPassword);
    _passwordBox.add(newPassword);
    update();
  }

  deletePassword(Password password) {
    int index = _passwords.indexOf(password);
    _passwords.removeWhere((element) => element.id == password.id);
    _passwordBox.deleteAt(index);
    update();
  }

  updatePassword(Password oldPassword, Password newPassword) {
    int index = _passwords.indexOf(oldPassword);
    _passwords[index].appName = newPassword.appName;
    _passwords[index].uname = newPassword.uname;
    _passwords[index].psswd = newPassword.psswd;
    update();
  }

  copyPassword(Password password) {
    _encryptService.copyToClipboard(password.psswd);
  }
}
