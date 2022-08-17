class App_Constants {
  static App_Constants? _instance;

  static App_Constants get instance {
    return _instance ??= App_Constants._init();
  }

  App_Constants._init();

  //Image Constants
  static const ALLNEWS_IMG_PATH = "";
  static const BUSINESS_IMG_PATH = "assets/images/img_is.jpg";
  static const ENTERTAINMENT_IMG_PATH = "assets/images/img_eglence.jpg";
  static const HEALTH_IMG_PATH = "assets/images/img_saglik.png";
  static const SCIENCE_IMG_PATH = "assets/images/img_bilim.png";
  static const SPORT_IMG_PATH = "assets/images/img_spor.jpg";
  static const TECHNOLOGY_IMG_PATH = "assets/images/img_teknoloji.png";

  //Category Name Contants
  static const CATEGORY_ALLNEWS = "Hepsi";
  static const CATEGORY_BUSINESS = "İş";
  static const CATEGORY_ENTERTAINMENT = "Eğlence";
  static const CATEGORY_HEALTH = "Sağlık";
  static const CATEGORY_SCIENCE = "Bilim";
  static const CATEGORY_SPORT = "Spor";
  static const CATEGORY_TECHNOLOGY = "Teknoloji";

  //Country Constants
  static const COUNTRY_TURKEY = "Türkiye";
  static const COUNTRY_ARGENTINA = "Arjantin";
  static const COUNTRY_AUSTRIA = "Avusturya";
  static const COUNTRY_UNITED_ARAB_EMIRATES = "Birleşik Arap Emirlikleri";

  static const TURKEY_KEY = "tr";
  static const ARGENTINA_KEY = "ar";
  static const AUSTRIA_KEY = "au";
  static const UNITED_ARAB_EMIRATES_KEY = "ae";

  //Lottie Path
  static const LOTTIE_PATH_SPLASH_LOADING = "assets/lottie/loading_animation.json";
  static const LOTTIE_PATH_IMAGE_LOADING = "assets/lottie/circular_loading.json";

  //Image
  static const NOT_FOUND_IMAGE = "assets/images/img_bulunamadi.png";
}
