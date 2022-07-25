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
            Expanded(flex: 2, child: _buildTopContainer(width)),
            Expanded(flex: 7, child: Text('Deneme')),
          ],
        ),
      ),
    );
  }

  Widget _buildTopContainer(double width) {
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
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemCount: _homePageViewModel.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 5),
            child: _buildCategoryList(index),
          );
        },
      ),
    );
  }

  Widget _buildCategoryList(int index) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          _homePageViewModel.categoryIndex.value = index;
          //Servise gidilip refresh edilecek kısım
        },
        child: Row(
          children: [
            Column(
              children: [
                index == 0
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: _homePageViewModel.categoryIndex.value == index ? Border.all(color: Colors.green, width: 2) : Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.wifi_tethering,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    : AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: _homePageViewModel.categoryIndex.value == index ? Border.all(color: Colors.green, width: 2) : Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(_homePageViewModel.categoryList[index].image), fit: BoxFit.fill),
                        ),
                      ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  _homePageViewModel.categoryList[index].title,
                )
              ],
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndDate() {
    String _title = 'Haberler';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_title),
        SizedBox(height: 5),
        Text(_homePageViewModel.getDateTime()),
      ],
    );
  }
}
