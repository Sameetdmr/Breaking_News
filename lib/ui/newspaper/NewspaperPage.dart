// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:newspaper_app/ui/components/CustomLottie.dart';
import 'package:newspaper_app/ui/newspaper/NewspaperPageViewModel.dart';
import 'package:newspaper_app/utils/constants/App_Constants.dart';
import 'package:newspaper_app/utils/navigation/CustomNavigator.dart';
import 'package:newspaper_app/utils/popups/CustomSnackbar.dart';
import 'package:newspaper_app/utils/theme/CustomTextTheme.dart';
import 'package:newspaper_app/utils/theme/container/CustomContainer.dart';
import 'package:newspaper_app/utils/theme/padding/CustomPadding.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/popups/SnackbarType.dart';
import '../../utils/theme/colors/ColorSchemeLight.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late NewspaperPageViewModel _newspaperPageViewModel;

  @override
  Widget build(BuildContext context) {
    _newspaperPageViewModel = Get.put(NewspaperPageViewModel());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Obx(
      () => Directionality(
        textDirection: _newspaperPageViewModel.countryCode!.value == 'ae' ? ui.TextDirection.rtl : ui.TextDirection.ltr,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(flex: height ~/ 0.8, child: _buildTopContainer(width)),
                Expanded(flex: height ~/ 0.2, child: _buildNewspaperListView()),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green.shade300,
              onPressed: () {
                _buildModalBottomSheet(context);
              },
              child: Icon(Icons.map)),
        ),
      ),
    );
  }

  Future<dynamic> _buildModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => Directionality(
            textDirection: _newspaperPageViewModel.countryCode!.value == 'ae' ? ui.TextDirection.rtl : ui.TextDirection.ltr,
            child: Container(
              height: MediaQuery.of(context).size.height / 7,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCountryWidget(context),
                    ElevatedButton(
                        onPressed: () {
                          _newspaperPageViewModel.getCountry();
                          CustomNavigator().popFromMain();
                        },
                        child: Text('Kapat'))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNewspaperListView() {
    return Obx(() => Container(
          child: _newspaperPageViewModel.isLoading.value
              ? RefreshIndicator(
                  color: Colors.green,
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 2));
                    _newspaperPageViewModel.newspaperPM.refresh();
                    return;
                  },
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _newspaperPageViewModel.newspaperPM.value.titleList!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: ColorSchemeLight.instance.dusk40Color,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          color: Colors.grey.shade200,
                          child: ListTile(
                            title: Text(
                              _newspaperPageViewModel.newspaperPM.value.titleList![index],
                              style: CustomTextTheme.instance.cardTitleText,
                            ),
                            subtitle: Padding(
                              padding: CustomPadding.instance.subtitleTopPadding,
                              child: GestureDetector(
                                onTap: () async {
                                  if (!await launch(_newspaperPageViewModel.newspaperPM.value.urlList![index])) ;
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.open_in_new,
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        Text(
                                          _newspaperPageViewModel.newspaperPM.value.nameList![index],
                                          style: CustomTextTheme.instance.cardSubtitleText,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      _newspaperPageViewModel.newspaperPM.value.publishedList![index],
                                      style: CustomTextTheme.instance.cardSubtitleText.copyWith(fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            trailing: CachedNetworkImage(
                              width: CustomContainer.instance.cacheNetworkImageWidth,
                              height: CustomContainer.instance.cacheNetworkImageHeight,
                              imageUrl: _newspaperPageViewModel.newspaperPM.value.imageList![index],
                              fit: BoxFit.cover,
                              placeholder: (context, url) => CustomLottie(lottieUrl: App_Constants.LOTTIE_PATH_IMAGE_LOADING),
                              errorWidget: (context, url, error) =>
                                  Container(height: CustomContainer.instance.cacheNetworkImageHeight, width: CustomContainer.instance.cacheNetworkImageWidth, child: Image.asset(App_Constants.NOT_FOUND_IMAGE, fit: BoxFit.contain)),
                            ),
                          ),
                        );
                      }),
                )
              : Center(
                  child: CustomLottie(
                  lottieUrl: App_Constants.LOTTIE_PATH_SPLASH_LOADING,
                )),
        ));
  }

  Widget _buildTopContainer(double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.only(
            bottomLeft: CustomPadding.instance.topContainerLeftRadiusCircular,
          )),
      child: Padding(
        padding: CustomPadding.instance.topContainerPadding,
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
      height: CustomContainer.instance.categoryContainerHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemCount: _newspaperPageViewModel.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: CustomPadding.instance.topContainerTitleTopPadding,
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
          _newspaperPageViewModel.categoryIndex.value = index;
          _newspaperPageViewModel.fetchIndexNews(index);
        },
        child: Row(
          children: [
            Column(
              children: [
                index == 0
                    ? _buildAnimatedContainer(
                        index,
                        Icon(
                          Icons.wifi_tethering,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    : _buildAnimatedContainer(index, null),
                SizedBox(
                  height: 5,
                ),
                Text(_newspaperPageViewModel.categoryList[index].title,
                    style: _newspaperPageViewModel.categoryIndex.value == index ? CustomTextTheme.instance.boldSubtitleText.copyWith(fontWeight: FontWeight.bold) : CustomTextTheme.instance.boldSubtitleText)
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

  AnimatedContainer _buildAnimatedContainer(int index, Widget? child) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: CustomContainer.instance.animatedContainerWidth,
      height: CustomContainer.instance.animatedContainerHeight,
      decoration: BoxDecoration(
        border: _newspaperPageViewModel.categoryIndex.value == index ? Border.all(color: Colors.green, width: 2) : Border.all(color: Colors.white),
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(_newspaperPageViewModel.categoryList[index].image),
            fit: BoxFit.fill,
            onError: (Object? exception, StackTrace? stackTrace) {
              Image.asset(
                App_Constants.NOT_FOUND_IMAGE,
                fit: BoxFit.contain,
              );
            }),
      ),
      child: child,
    );
  }

  Widget _buildTitleAndDate() {
    String _title = 'Haberler';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _title,
          style: CustomTextTheme.instance.boldTopTitleText,
        ),
        SizedBox(height: 5),
        Text(
          _newspaperPageViewModel.getDateTime(),
          style: CustomTextTheme.instance.boldSubtitleText,
        ),
      ],
    );
  }

  Widget _buildCountryWidget(BuildContext context) {
    return Obx(() => Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 15,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Color(0xff0037AE)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              isDense: true,
              value: _newspaperPageViewModel.countryList[_newspaperPageViewModel.countryList.indexWhere((element) => element.code == _newspaperPageViewModel.countryCode!.value)].id,
              isExpanded: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 0.03.sh,
                ),
              ),
              items: _newspaperPageViewModel.countryList
                  .map(
                    (item) => DropdownMenuItem(
                      value: item.id,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              item.country,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10.0.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (int? value) {
                if (value != 0) {
                  _newspaperPageViewModel.countryListId.value = value!;
                  _newspaperPageViewModel.countryCode!.value = _newspaperPageViewModel.countryList.firstWhere((element) => element.id == value).code;
                  _newspaperPageViewModel.countryName!.value = _newspaperPageViewModel.countryList.firstWhere((element) => element.id == value).country;
                  _newspaperPageViewModel.fetchCountryNews();
                  if (!_newspaperPageViewModel.countryCode!.value.isEmpty) {
                    _newspaperPageViewModel.categoryIndex.value = 0;
                    _newspaperPageViewModel.getCountry();

                    CustomNavigator().popFromMain();
                  }
                  CustomSnackbar.showSnackBar(context, SnackBarType.SUCCESS, _newspaperPageViewModel.countryName!.value + ' Haberleri');
                } else {
                  CustomSnackbar.showSnackBar(context, SnackBarType.ERROR, 'Ülke Seçimi Yapınız');
                }
              },
            ),
          ),
        ));
  }
}
