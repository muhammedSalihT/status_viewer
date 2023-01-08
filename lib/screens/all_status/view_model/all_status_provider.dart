import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:status_viewer_app/screens/all_status/api/get_all_status_api.dart';
import 'package:status_viewer_app/screens/all_status/model/all_status_model.dart';
import 'package:status_viewer_app/screens/all_status/model/person_status_model.dart';

class AllStatusProvider extends ChangeNotifier {
  AllStatusProvider() {
    getAllStatus();
  }
  List<PersonStatusModel> eachList = [];
  List<List<AllStatusModel>> showList = [];
  List<AllStatusModel> allStatusList = [];
  List<AllStatusModel> snowList = [];
  List<AllStatusModel> lansisterList = [];
  List<AllStatusModel> arayaList = [];
  List<String>? imageList = [];



  getAllStatus() async {
    log(allStatusList.toString());
    final response = await GetAllStatusApi.getAllStatus();
    allStatusList = (json.decode(response.body) as List)
        .map((data) => AllStatusModel.fromJson(data))
        .toList();
    notifyListeners();
    log(allStatusList.toString());
    snowList = allStatusList
        .where((element) => element.profile!.name == "Jon Snow")
        .toList();
    lansisterList = allStatusList
        .where((element) => element.profile!.name == "Tyirion Lannister")
        .toList();
    arayaList = allStatusList
        .where((element) => element.profile!.name == "Arya Stark")
        .toList();
    showList.add(snowList);
    showList.add(lansisterList);
    showList.add(arayaList);

    log(snowList.toString());
    log(arayaList.toString());
    log(lansisterList.toString());
    log(showList.toString());

    List<String>? getImages(List<AllStatusModel> list) {
      for (AllStatusModel i in list) {
        log(i.toString());
        imageList?.add(i.image!);
      }
      return imageList;
    }

    log(eachList.toString());

    eachList.add(PersonStatusModel(
        getImages(lansisterList),
        lansisterList.first.profile!.image,
        lansisterList.first.profile!.name,
        "11:55 PM"));
    eachList.add(PersonStatusModel(
        getImages(lansisterList),
        lansisterList.first.profile!.image,
        lansisterList.first.profile!.name,
        "11:55 PM"));
    eachList.add(PersonStatusModel(
        getImages(lansisterList),
        lansisterList.first.profile!.image,
        lansisterList.first.profile!.name,
        "11:55 PM"));
    // eachList.add(PersonStatusModel(
    //     getImages(snowList),
    //     snowList.first.profile!.image,
    //     snowList.first.profile!.name,
    //     "2:20 AM"));
    eachList.add(PersonStatusModel(
        getImages(arayaList),
        arayaList.first.profile!.image,
        arayaList.first.profile!.name,
        "9:00 PM"));
    log(eachList.toString());
    notifyListeners();
  }
}
