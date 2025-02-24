import 'package:flutter/material.dart';
import '../main.dart';

class Language extends ChangeNotifier {
  String? _lang = language;

  getLanguage() {
    return _lang;
  }

  setLanguage(String lang) {
    _lang = lang;
    notifyListeners();
  }

  ///User Profile translated Strings
  String tSettings() {
    if (getLanguage() == 'AR') {
      return "الإعدادات";
    } else if (getLanguage() == 'EN') {
      return "Settings";
    } else  {
      return "Parametres";
    }
  }
   String tConfiguration() {
    if (getLanguage() == 'AR') {
      return "تعديل";
    } else if (getLanguage() == 'EN') {
      return "Configuration";
    } else  {
      return "Configuration";
    }
  }
   String tAccount() {
    if (getLanguage() == 'AR') {
      return "حساب";
    } else if (getLanguage() == 'EN') {
      return "Account";
    } else  {
      return "Compte";
    }
  }

  String tEmail() {
    if (getLanguage() == 'AR') {
      return " البريد الإلكتروني / اسم المستخدم ";
    } else if (getLanguage() == 'EN') {
      return "email / username";
    } else {
      return "e-mail/nom d'utilisateur";
    }
  }
  String tPassword() {
    if (getLanguage() == 'AR') {
      return "كلمه السر";
    } else if (getLanguage() == 'EN') {
      return "required *";
    } else {
      return "mot de passe";
    }
  }
    String tConfirm() {
    if (getLanguage() == 'AR') {
      return "تأكيد";
    } else if (getLanguage() == 'EN') {
      return "Confirm";
    } else {
      return "Confirmer";
    }
  }
    String tCancel() {
    if (getLanguage() == 'AR') {
      return "إلغاء";
    } else if (getLanguage() == 'EN') {
      return "Cancel";
    } else {
      return "Cancel";
    }
  }
  String tLanguage() {
    if (getLanguage() == 'AR') {
      return "اللغة";
    } else if (getLanguage() == 'EN') {
      return "Language";
    } else {
      return "Langue";
    }
  }

  String tAlerte() {
    if (getLanguage() == 'AR') {
      return "تنبيهات";
    } else if (getLanguage() == 'EN') {
      return "Alerts";
    } else {
      return "Alertes";
    }
  }

String tNotification() {
    if (getLanguage() == 'AR') {
      return "إشعارات";
    } else if (getLanguage() == 'EN') {
      return "Notifications";
    } else {
      return "Notifications";
    }
  }



}