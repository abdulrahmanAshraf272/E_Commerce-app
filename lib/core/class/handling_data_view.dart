import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  //TODO replace the text with Lottie animation.
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: CircularProgressIndicator())
        : statusRequest == StatusRequest.offlineFailure
            ? const Center(child: Text('offline failure'))
            : statusRequest == StatusRequest.serverFailure
                ? const Center(child: Text('server failure'))
                : statusRequest == StatusRequest.failure
                    ? const Center(child: Text('No Data to View'))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  //TODO replace the text with Lottie animation.
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: Text('Loading'))
        : statusRequest == StatusRequest.offlineFailure
            ? const Center(child: Text('offline failure'))
            : statusRequest == StatusRequest.serverFailure
                ? const Center(child: Text('server failure'))
                : widget;
  }
}
