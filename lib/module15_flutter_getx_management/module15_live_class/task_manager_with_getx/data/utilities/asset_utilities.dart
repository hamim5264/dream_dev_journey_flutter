class AssetsUtils {
  AssetsUtils._(); //singleton, private constructor, so can't create instance of the class

  static const String _imagesPath = 'images';
  static const String backgroundSVG = '$_imagesPath/task_background.svg';
  static const String logoSVG = '$_imagesPath/task_logo.svg';
  static const String ostadLogoSVG = '$_imagesPath/ostad-logo.svg';
  static const String appLogoPNG = '$_imagesPath/task_app_logo.png';
  static const String placeholderPNG = '$_imagesPath/no-pp.png';
}
