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
          _buildCategory(),
        ],
      ),
    );
  }
}

class _buildCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewspaperPageViewModel _newspaperPageViewModel = Get.find();
    return Padding(
      padding: context.paddingLow,
      child: SizedBox(
        height: CustomContainer.instance.categoryContainerHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _newspaperPageViewModel.categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: context.onlyTopPaddingLow,
              child: _buildCategoryList(
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _buildCategoryList extends StatelessWidget {
  int index;
  _buildCategoryList({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NewspaperPageViewModel _newspaperPageViewModel = Get.find();
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
                        index: index,
                        child: Icon(
                          Icons.wifi_tethering,
                          color: ColorConstants.blueGreyShade100,
                          size: 30,
                        ),
                      )
                    : _buildAnimatedContainer(index: index, child: null),
                Text(
                  _newspaperPageViewModel.categoryList[index].title,
                  style: _newspaperPageViewModel.categoryIndex.value == index
                      ? context.primaryTextTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: ColorConstants.black)
                      : context.primaryTextTheme.bodyMedium?.copyWith(color: ColorConstants.black),
                )
              ],
            ),
            context.emptySizedWidthBoxNormal,
          ],
        ),
      ),
    );
  }
}

class _buildAnimatedContainer extends StatelessWidget {
  int index;
  Widget? child;
  _buildAnimatedContainer({Key? key, required this.index, this.child}) : super(key: key);

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
