// ignore_for_file: must_be_immutable

part of '../NewspaperPage.dart';

class _buildTopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.only(
            bottomLeft: CustomPadding.instance.topContainerLeftRadiusCircular,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildCategory(),
        ],
      ),
    );
  }
}

class BuildCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewspaperPageViewModel _newspaperPageViewModel = Get.find();
    return Padding(
      padding: context.padding.normal,
      child: SizedBox(
        height: CustomContainer.instance.categoryContainerHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _newspaperPageViewModel.categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: context.padding.onlyTopLow,
              child: BuildCategoryList(
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class BuildCategoryList extends StatelessWidget {
  int index;
  BuildCategoryList({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NewspaperPageViewModel _newspaperPageViewModel = Get.find();
    return Obx(
      () => GestureDetector(
        onTap: () async {
          _newspaperPageViewModel.categoryIndex.value = index;
          await _newspaperPageViewModel.fetchIndexNews(index);
        },
        child: Row(
          children: [
            Column(
              children: [
                index == 0
                    ? BuildAnimatedContainer(
                        index: index,
                        child: Icon(
                          Icons.wifi_tethering,
                          color: ColorConstants.blueGreyShade100,
                          size: 30,
                        ),
                      )
                    : BuildAnimatedContainer(index: index, child: null),
                Text(
                  _newspaperPageViewModel.categoryList[index].title,
                  style: _newspaperPageViewModel.categoryIndex.value == index
                      ? context.general.primaryTextTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: ColorConstants.black)
                      : context.general.primaryTextTheme.bodyMedium?.copyWith(color: ColorConstants.black),
                )
              ],
            ),
            context.sized.emptySizedWidthBoxNormal,
          ],
        ),
      ),
    );
  }
}

class BuildAnimatedContainer extends StatelessWidget {
  int index;
  Widget? child;
  BuildAnimatedContainer({Key? key, required this.index, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewspaperPageViewModel _newspaperPageViewModel = Get.find();
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: CustomContainer.instance.animatedContainerWidth,
      height: CustomContainer.instance.animatedContainerHeight,
      decoration: BoxDecoration(
        border: _newspaperPageViewModel.categoryIndex.value == index ? Border.all(color: ColorConstants.green, width: 2) : Border.all(color: ColorConstants.blueGreyShade100),
        shape: BoxShape.circle,
      ),
      child: child == null
          ? CustomLottie(
              lottieUrl: _newspaperPageViewModel.categoryList[index].image,
            )
          : child,
    );
  }
}
