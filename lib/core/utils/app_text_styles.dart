import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle regular16(BuildContext context) {
    return TextStyle(
        fontSize: getResponsiveFont(context, fontSize: 16),
        fontWeight: FontWeight.w400);
  }

  static TextStyle regular12(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 12),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium16(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBold12(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 12),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold16(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 16),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle robotoRegular12(BuildContext context) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: getResponsiveFont(context, fontSize: 12),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium14(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 14),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle medium12(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 12),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBold24(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 24),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle medium24(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 24),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle regular10(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 10),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle robotoMedium16(BuildContext context) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: getResponsiveFont(context, fontSize: 16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle regular24(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 24),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle robotoBold48(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFont(context, fontSize: 48),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold24WithLineHeight(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 24),
      fontWeight: FontWeight.w600,
      height: 1.29,
    );
  }

  static TextStyle semiBold48(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 48),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold16(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 16),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle semiBold16WithLineHeight(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      height: 1.29,
    );
  }

  static TextStyle medium32(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 32),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bold24(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: getResponsiveFont(context, fontSize: 24),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle robotoBold12(BuildContext context) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: getResponsiveFont(context, fontSize: 12),
      fontWeight: FontWeight.w700,
    );
  }
}

// create a responsive text method;
// double getResponsiveFont(BuildContext context, {required double fontSize}) {
//   double scaleFactor = getScaleFactor(context);
//   double responsiveText = scaleFactor * fontSize;
//   double upperLimit = responsiveText * 1.2;
//   double lowerLimit = responsiveText * .8;
//   return responsiveText.clamp(lowerLimit, upperLimit);
// }

// double getScaleFactor(BuildContext context) {
//   double width = MediaQuery.sizeOf(context).width;
//   if (width < 400.w) {
//     return width / 600;
//   } else if (width < 600.w) {
//     return width / 860;
//   } else {
//     return width / 1200;
//   }
// }

double getResponsiveFont(BuildContext context, {required double fontSize}) {
  double scaleFactor =
      getScaleFactor(context) * MediaQuery.of(context).textScaler.scale(1.5);
  double responsiveText = scaleFactor * fontSize;

  // وضع حد أدنى وأقصى لتجنب الخطوط الصغيرة جدًا أو الكبيرة جدًا
  double minFontSize = fontSize * 0.85; // يمكن تغيير القيم حسب الحاجة
  double maxFontSize = fontSize * 1.2;

  return responsiveText.clamp(minFontSize, maxFontSize);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width < 400.w) {
    return width / 500;
  } else if (width < 600.w) {
    return width / 800;
  } else {
    return width / 1100;
  }
}
