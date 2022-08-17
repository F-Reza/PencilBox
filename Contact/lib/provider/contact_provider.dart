
import 'package:contact/db/sqf_lite_helper.dart';
import 'package:flutter/foundation.dart';

import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];

  getAllContact() async {
    contactList = await DBHelper.getAllContact();
    notifyListeners();
  }

  Future<ContactModel> getContactById(int id) => DBHelper.getContactById(id);

  Future<bool> insertContact(ContactModel contactModel) async {
    final rowId = await DBHelper.insertContact(contactModel);
    if(rowId > 0) {
      contactModel.id = rowId;
      contactList.add(contactModel);
      notifyListeners();
      return true;
    }
    return false;
  }

  updateFavorite(int id, bool favorite, int index) async {
    final value = favorite ? 0 : 1;
    final rowId = await DBHelper.updateFavorite(id, value);
    if(rowId > 0) {
      contactList[index].favourite = !contactList[index].favourite;
      notifyListeners();
    }
  }


}