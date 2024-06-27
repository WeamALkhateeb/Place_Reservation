import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/core/class/statusrequest.dart';
import '../constant/imageassest.dart';

class HandlingDataView extends StatelessWidget{
  final StatusRequest  statusRequest;
  final Widget widget;
  const HandlingDataView (
      {Key? key ,required this.statusRequest, required this.widget})
      :super(key: key);

  @override
  Widget build(BuildContext context){
    return
      statusRequest == StatusRequest.loading ?
      Center(child: Lottie.asset(AppImageAsset.loading4, width: 200, height: 200)):
      statusRequest == StatusRequest.offlinefailure ?
      Center(child: Lottie.asset(AppImageAsset.offline, width: 200, height: 200)) :
      statusRequest == StatusRequest.serverfailure ?
      Center(child: Lottie.asset(AppImageAsset.serverFailure, width: 200, height: 200)) :
      statusRequest == StatusRequest.failure ?
      Center(child: Lottie.asset(AppImageAsset.noData, width: 200, height: 200)) : widget;
  }
}


class HandlingDataRequest extends StatelessWidget{
  final StatusRequest  statusRequest;
  final Widget widget;
  const HandlingDataRequest (
      {Key? key ,required this.statusRequest, required this.widget})
      :super(key: key);

  @override
  Widget build(BuildContext context){
    return
      statusRequest == StatusRequest.loading ?
      Center(child: Lottie.asset(AppImageAsset.loading4, width: 200, height: 200)):
      statusRequest == StatusRequest.offlinefailure ?
      Center(child: Lottie.asset(AppImageAsset.offline, width: 200, height: 200)) :
      statusRequest == StatusRequest.serverfailure ?
      Center(child: Lottie.asset(AppImageAsset.serverFailure, width: 200, height: 200)) : widget;
  }
}