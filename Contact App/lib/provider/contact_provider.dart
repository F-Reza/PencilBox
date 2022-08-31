
import 'dart:io';

import 'package:contact/db/db_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];

  getAllContact() async {
    contactList = await DBHelper.getAllContacts();
    notifyListeners();
  }

  getAllFavoriteContacts() async {
    contactList = await DBHelper.getAllFavoriteContacts();
    notifyListeners();
  }


  Future<ContactModel> getContactById(int id) => DBHelper.getContactById(id);

  Future<bool> insertContact(ContactModel contactModel) async {
    final rowId = await DBHelper.insertContact(contactModel);
    if(rowId > 0) {
      contactModel.id = rowId;
      contactList.add(contactModel);
      contactList.sort((c1, c2) => c1.name.compareTo(c2.name));
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


  deleteContact(int id) async {
    final rowId = await DBHelper.deleteContact(id);
    if(rowId > 0) {
      contactList.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }


  Future<void> callContact(String number) async {
    final uri = Uri.parse('tel:$number');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch call app';
    }
  }

  Future<void> messageContact(String number) async {
    final uri = Uri.parse('sms:$number');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch message app';
    }
  }

  Future<void> mailContact(String mail) async {
    final uri = Uri.parse('mailTo:$mail');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch mail app';
    }
  }

  Future<void> webContact(String web) async {
    final uri = Uri.parse('https:$web');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch browser';
    }
  }

  Future<void> locateContact(String address) async {
    String urlString = '';
    if (Platform.isAndroid) {
      urlString = 'geo:00?q=$address';
    } else if (Platform.isIOS) {
      urlString = 'https://maps.apple.com/q=$address';
    }

    final uri = Uri.parse(urlString);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch map';
    }
  }



}