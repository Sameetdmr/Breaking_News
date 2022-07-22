import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/ui/home/HomePageViewModel.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late HomePageViewModel _homePageViewModel;

  @override
  Widget build(BuildContext context) {
    _homePageViewModel = Get.put(HomePageViewModel());
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 1, child: _buildContainer(width)),
            Expanded(flex: 4, child: Text('Deneme')),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleAndDate(),
            _buildCategory(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Text(index.toString());
        },
      ),
    );
  }

  Widget _buildTitleAndDate() {
    String _title = 'Haberler';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_title),
        Text(_homePageViewModel.getDateTime()),
      ],
    );
  }
}
