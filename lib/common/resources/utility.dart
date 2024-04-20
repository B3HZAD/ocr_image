// import 'dart:io';
//
// import 'package:another_flushbar/flushbar.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:easy_localization/easy_localization.dart' as easy;
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:persian_number_utility/persian_number_utility.dart';
// import 'package:sea_pocket/common/widget/text_widget.dart';
// import 'package:sea_pocket/marlab/model/application_data_model.dart';
// import 'package:sea_pocket/sea_pocket/model/select_type_data_model.dart';
// import 'package:sea_pocket/services/download/download_service.dart';
// import 'package:sea_pocket/tools/resources/color_manager.dart';
// import 'package:sea_pocket/tools/resources/constants.dart';
// import 'package:sea_pocket/tools/resources/enums.dart';
// import 'package:sea_pocket/tools/resources/font_manager.dart';
// import 'package:sea_pocket/tools/resources/globals.dart';
// import 'package:sea_pocket/tools/resources/strings_manager.dart';
// import 'package:sea_pocket/tools/resources/styles_manager.dart';
// import 'package:sea_pocket/tools/resources/values_manager.dart';
// import 'package:sea_pocket/tools/shared_preference.dart';
// import 'package:sizer/sizer.dart';
// import 'package:solar_datepicker/solar_datepicker.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../generated/locale_keys.g.dart';
// import '../helper.dart';
//
// class Utility {
//   static dynamic convertPayload(String payload) {
//     final String _payload = payload.substring(0, payload.length - 1);
//     List<String> _split = [];
//     _payload.split(";")..forEach((String s) => _split.addAll(s.split("=")));
//     Map<String, dynamic> _mapped = {};
//     for (int i = 0; i < _split.length; i++) {
//       if (i % 2 == 1)
//         _mapped.addAll({_split[i - 1].trim().toString(): _split[i].trim()});
//     }
//     return _mapped;
//   }
//
//   static launchCustom(String url) async {
//     await launchUrl(Uri.parse(url));
//   }
//
//   static launchWithHeader(
//       {required String url, required Map<String, String> headers}) async {
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url),
//           webViewConfiguration:
//               WebViewConfiguration(enableJavaScript: true, headers: headers),
//           mode: LaunchMode.inAppWebView);
//     }
//   }
//
//   static lunchWebScreen(String url) async {
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(
//         Uri.parse(url),
//       );
//       return NavigationActionPolicy.CANCEL;
//     }
//   }
//
//   static launchExternal(String url) async {
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(
//         Uri.parse(url),
//         mode: LaunchMode.externalApplication,
//       );
//     }
//   }
//
//   static lunchInApp(String url, {Map<String, String>? headers = null}) async {
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url),
//           webViewConfiguration: WebViewConfiguration(enableJavaScript: true),
//           mode: LaunchMode.inAppWebView);
//     }
//   }
//
//   static Future<int?> selectDate(
//       {required BuildContext context,
//       bool pastSelect = true,
//       bool futureSelect = true}) async {
//     int selectedDate = 0;
//     var picked;
//
//     if (Helper.checkFaLang(context)) {
//       picked = await showSolarDatePicker(
//         context: context,
//         // textDirection: TextDirection.rtl,
//
//         initialDate: DateTime.now(),
//         locale: easy.EasyLocalization.of(context)?.locale,
//         firstDate: pastSelect
//             ? DateTime.now().subtract(Duration(days: 70 * 365))
//             : DateTime.now().subtract(Duration(seconds: 10)),
//         // lastDate: DateTime.now(),
//         lastDate: futureSelect
//             ? DateTime.now().add(Duration(days: 20 * 365))
//             : DateTime.now(),
//         isPersian: Helper.checkFaLang(context) ? true : false,
//         initialDatePickerMode: SolarDatePickerMode.year,
//       );
//     } else {
//       picked = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(), //get today's date
//         firstDate: DateTime.now().subtract(Duration(days: 70 * 365)),
//         lastDate: DateTime.now().add(Duration(days: 20 * 365)),
//       );
//     }
//     if (picked != null) {
//       selectedDate = (picked.millisecondsSinceEpoch / 1000).round();
//       return selectedDate;
//     } else {
//       return null;
//     }
//   }
//
//   static void showSnackBar(BuildContext context, String title) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         duration: const Duration(seconds: AppDuration.d1),
//         behavior: SnackBarBehavior.floating,
//         content: Text(title,
//             style: Theme.of(context).primaryTextTheme.titleMedium,
//             textAlign: TextAlign.center)));
//   }
//
//   static Padding customDropdown({
//     Widget? child,
//     required BuildContext context,
//     String? hint,
//     dynamic value,
//     List<dynamic>? items,
//     String? Function(dynamic value)? validator,
//     Function(dynamic value)? onChanged,
//     bool hasType = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Container(
//         width: 100.h,
//         child: Column(
//           children: [
//             DropdownButtonFormField2<dynamic>(
//               iconStyleData: IconStyleData(
//                 iconSize: 30,
//                 iconEnabledColor: ColorManager.hBluePacific,
//                 icon: const Icon(
//                   Icons.keyboard_arrow_down,
//                 ),
//               ),
//               decoration: dropDownInputDecoration,
//               hint: hint == null
//                   ? null
//                   : TextWidget(
//                       text: hint,
//                       fontSize: FontType.small.getValue(),
//                     ),
//               isExpanded: true,
//               buttonStyleData: ButtonStyleData(
//                 height: 40,
//                 padding: const EdgeInsets.only(left: 20, right: 10),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(AppSize.inputRadiusSize))),
//               ),
//               value: value,
//               items: items!.map<DropdownMenuItem<dynamic>>((dynamic value) {
//                 return DropdownMenuItem<dynamic>(
//                   value: value,
//                   alignment: Helper.checkFaLang(context)
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   child: TextWidget(
//                     text: hasType
//                         ? value.type
//                         : Helper.checkFaLang(context)
//                             ? value.faName ?? value.faLabel
//                             : value.enName ?? value.enLabel,
//                     fontSize: FontType.small.getValue(),
//                   ),
//                 );
//               }).toList(),
//               validator: (value) {
//                 validator == null ? null : validator(value);
//               },
//               onChanged: (value) {
//                 onChanged!(value);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   static Future<void> showMobileHelp() async {
//     String url = '${AppStrings.mobileHelpUrl}';
//
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(
//         Uri.parse(url),
//         webViewConfiguration: WebViewConfiguration(
//           enableJavaScript: true,
//           // forceWebView: true,
//         ),
//       );
//     }
//   }
//
//   static getHeader({bool getFile = false}) async {
//     String? token = await SP.getToken();
//
//     String cookie = await SP.getSelectedProfile();
//
//     var headersFile = {
//       "Content-Type": "application/pdf",
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//       "X-Localization": Globals.lang,
//       'User-Agent': Globals.platform,
//       'Cookie':
//           "entity=${cookie.toString() ?? ""};device_id=${Globals.userUuid};app_version=${Globals.appVersion}",
//     };
//
//     var headers = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//       'User-Agent': Globals.platform,
//       "X-Localization": Globals.lang,
//       'Cookie':
//           "entity=${cookie.toString()};device_id=${Globals.userUuid};app_version=${Globals.appVersion}",
//     };
//     return getFile ? headersFile : headers;
//   }
//
//   static Future<void> showSeafarerContract(
//       ApplicationDataModel application) async {
//     String url = '${AppStrings.showSeafarerContract}${application.id}';
//     var headers = await getHeader();
//     launchWithHeader(url: url, headers: headers);
//   }
//
//   static Future<void> showContract(ApplicationDataModel application) async {
//     String url = '${AppStrings.showContractUrl}${application.id}';
//     var headers = await getHeader();
//     launchWithHeader(url: url, headers: headers);
//   }
//
//   static Future<void> downloadPage() async {
//     String url = AppStrings.appDownloadUrl;
//
//     launchExternal(url);
//   }
//
//   static Text dropDownText(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: FontSize.s12,
//       ),
//     );
//   }
//
//   static void showBanner(BuildContext context, String text, bool warning) {
//     Flushbar(
//       flushbarPosition: FlushbarPosition.TOP,
//       duration: Duration(seconds: 2),
//       backgroundColor: warning ? ColorManager.kStopColor : ColorManager.primary,
//       messageText: Text(
//         text,
//         style: TextStyle(fontSize: 16.0, color: ColorManager.white),
//       ),
//     )..show(context);
//   }
//
//   static Future<void> showAlertDialog(
//       BuildContext context, String title, String content) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: SingleChildScrollView(
//               child: Container(
//                 width: 120,
//                 height: 120,
//                 padding: EdgeInsets.all(1),
//                 margin: EdgeInsets.all(1),
//                 decoration: BoxDecoration(
//                   // boxShadow: [kBoxShadow],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 // child: Text('${index+1}. ${controls.description}',style: kTitleTextStyle,),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 10),
//                     Center(
//                       child: Helper.checkFaLang(context)
//                           ? Text(
//                               Helper.printNum(context, content),
//                               textDirection: TextDirection.rtl,
//                               style: getMediumStyle(fontSize: FontSize.s20),
//                             )
//                           : Text(
//                               content,
//                               textDirection: TextDirection.ltr,
//                               style: getMediumStyle(fontSize: FontSize.s20),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     // shape: RoundedRectangleBorder(
//                     //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
//
//                     child: Text(
//                       LocaleKeys.ok.tr(),
//                       style: getMediumStyle(),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           );
//         });
//   }
//
//   static void showCustomDialog(BuildContext context, String title,
//       String content, void Function() okFunction,
//       {DialogType type = DialogType.error, String btnText = ""}) {
//     AwesomeDialog(
//         dismissOnTouchOutside: false,
//         context: context,
//         animType: AnimType.scale,
//         dialogType: type,
//         bodyHeaderDistance: 3,
//         headerAnimationLoop: false,
//         body: Center(
//           child: Container(
//             height: 80,
//             child: Center(
//               child: Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Text(
//                     '${title}',
//                     style: TextStyle(fontStyle: FontStyle.italic),
//                   ),
//                   SizedBox(height: 10),
//                   TextWidget(
//                     text: '${content}',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         btnOkOnPress: okFunction,
//         buttonsTextStyle: TextStyle(
//             fontFamily: Helper.checkFaLang(context) ? 'IranSans' : 'Averta',
//             color: ColorManager.white),
//         title: title,
//         desc: content,
//         btnOkText: btnText == "" ? LocaleKeys.ok.tr() : btnText)
//       ..show();
//   }
//
//   static void showRequestDialog(
//       {required BuildContext context,
//       required String title,
//       required String content,
//       required DialogType dialogType,
//       required void Function() okFunction,
//       required void Function() cancelFunction}) {
//     AwesomeDialog(
//         context: context,
//         animType: AnimType.LEFTSLIDE,
//         dialogType: dialogType,
//         bodyHeaderDistance: 1,
//         headerAnimationLoop: false,
//         body: Center(
//           child: Container(
//             height: 70,
//             child: Center(
//               child: Text(
//                 '${content}',
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//             ),
//           ),
//         ),
//         btnCancelOnPress: cancelFunction,
//         btnOkOnPress: okFunction,
//         title: title,
//         desc: content,
//         buttonsTextStyle: TextStyle(
//             fontFamily: Helper.checkFaLang(context) ? 'IranSans' : 'Averta',
//             color: ColorManager.white),
//         btnCancelText: LocaleKeys.back.tr(),
//         btnOkText: LocaleKeys.ok.tr())
//       ..show();
//   }
//
//   static void showDeleteDialog(
//       BuildContext context,
//       String title,
//       String content,
//       void Function() okFunction,
//       void Function() cancelFunction) {
//     AwesomeDialog(
//         context: context,
//         animType: AnimType.SCALE,
//         dialogType: DialogType.ERROR,
//         bodyHeaderDistance: 3,
//         headerAnimationLoop: false,
//         body: Center(
//           child: Container(
//             height: 80,
//             child: Center(
//               child: Text(
//                 '${content}',
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//             ),
//           ),
//         ),
//         btnOkOnPress: okFunction,
//         btnCancelOnPress: cancelFunction,
//         title: title,
//         desc: content,
//         buttonsTextStyle: TextStyle(
//             fontFamily: Helper.checkFaLang(context) ? 'IranSans' : 'Averta',
//             color: ColorManager.white),
//         btnOkText: LocaleKeys.ok.tr(),
//         btnCancelText: LocaleKeys.back.tr())
//       ..show();
//   }
//
//   static String printDate(BuildContext context, int d,
//       {bool showTime = false}) {
//     String date;
//     Helper.checkFaLang(context)
//         ? date = PersianDate(d, showTime: showTime)
//         : date = GregorianDate(d, showTime: showTime);
//     return date;
//   }
//
//   static String PersianDate(int? d, {bool showTime = false}) {
//     if (d != null) {
//       DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(d * 1000);
//       String time =
//           "${dateTime.toPersianDate(showTime: showTime, timeSeprator: ' - ').toString()}";
//
//       return time;
//     }
//     return "0";
//   }
//
//   static String PersianYear(int? d) {
//     if (d != null) {
//       String dateTime =
//           DateTime.fromMillisecondsSinceEpoch(d * 1000).toString();
//       String time = dateTime.toPersianDate();
//
//       return time.split("/").first;
//     }
//     return "0";
//   }
//
//   static String GregorianDate(int? d, {bool showTime = false}) {
//     String dateTime;
//     if (d != null) {
//       if (showTime) {
//         dateTime = easy.DateFormat('MM-dd-yyyy hh:mm aaa')
//             .format(DateTime.fromMillisecondsSinceEpoch(d * 1000));
//       } else {
//         dateTime = easy.DateFormat('MM-dd-yyyy ')
//             .format(DateTime.fromMillisecondsSinceEpoch(d * 1000));
//       }
//       return dateTime;
//     } else {
//       return "0";
//     }
//   }
//
//   static String GregorianYear(int? d) {
//     if (d != null) {
//       String dateTime = easy.DateFormat('MM-dd-yyyy')
//           .format(DateTime.fromMillisecondsSinceEpoch(d * 1000));
//       return dateTime.split("-").last;
//     } else {
//       return "0";
//     }
//   }
//
//   static Future<bool> requestPhotosAndVideosPermission() async {
//     PermissionStatus status = await Permission.photos.request();
//     bool tmpStatus = false;
//     if (status.isGranted) {
//       tmpStatus = true;
//       // Permission is granted, you can access photos and videos
//       // Perform the necessary operations here
//     } else if (status.isDenied) {
//       tmpStatus = await Permission.photos.request().isGranted;
//     } else if (status.isPermanentlyDenied) {
//       await openAppSettings();
//     }
//     return tmpStatus;
//   }
//
//   static Future<bool> requestMusicAndAudioPermission() async {
//     PermissionStatus status = await Permission.audio.request();
//     bool tmpStatus = false;
//     if (status.isGranted) {
//       tmpStatus = true;
//       // Permission is granted, you can access photos and videos
//       // Perform the necessary operations here
//     } else if (status.isDenied) {
//       tmpStatus = await Permission.audio.request().isGranted;
//     } else if (status.isPermanentlyDenied) {
//       await openAppSettings();
//     }
//     return tmpStatus;
//   }
//
//   static Future<bool> requestNotification() async {
//     PermissionStatus status = await Permission.notification.request();
//     bool tmpStatus = false;
//     if (status.isGranted) {
//       tmpStatus = true;
//       // Permission is granted, you can access photos and videos
//       // Perform the necessary operations here
//     } else if (status.isDenied) {
//       tmpStatus = await Permission.notification.request().isGranted;
//     } else if (status.isPermanentlyDenied) {
//       await openAppSettings();
//     }
//     return tmpStatus;
//   }
//
//   static Future<bool> requestPermission() async {
//     bool permissionStatus = false;
//     int sdkInt = 0;
//     if (Platform.isAndroid) {
//       var androidInfo = await DeviceInfoPlugin().androidInfo;
//       sdkInt = androidInfo.version.sdkInt;
//     }
//     if (int.parse(sdkInt.toString()) < 30) {
//       Map<Permission, PermissionStatus> statuses = await [
//         Permission.storage,
//       ].request();
//       if (statuses[Permission.storage] != PermissionStatus.granted) {
//         permissionStatus = await Permission.storage.request().isGranted;
//       } else {
//         permissionStatus = true;
//       }
//     } else {
//       bool photos = await requestPhotosAndVideosPermission();
//       bool audios = await requestMusicAndAudioPermission();
//       bool notify = await requestNotification();
//       permissionStatus = (photos && audios && notify);
//     }
//
//     return permissionStatus;
//   }
//
//   static bool checkFaLang() {
//     return Globals.lang == 'fa' ? true : false;
//   }
//
//   static isAndroid() {
//     if (Platform.isAndroid) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   static void downloadFile(
//       {required BuildContext context,
//       required String url,
//       required String fileType}) async {
//     var headers = await Utility.getHeader(getFile: true);
//     if (!await Utility.requestPermission()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(LocaleKeys.permissionError.tr())));
//     } else {
//       String fileName =
//           "seaPocket${DateTime.now().microsecond.toString()}.${fileType}";
//       await MydService.download(
//           context: context, url: url, headers: headers, filename: fileName);
//     }
//   }
//
//   static openAlertBox(
//       {required context, required Widget child, String? title}) {
//     return AlertDialog(
//       titlePadding: EdgeInsets.all(0),
//       title: Container(
//         height: 30.00,
//         width: 400.00,
//         decoration: BoxDecoration(
//           color: Colors.redAccent,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//         ),
//         child: title == null ? SizedBox() : Center(child: Text(title)),
//       ),
//       shape: RoundedRectangleBorder(
//           side: BorderSide(color: Colors.black),
//           borderRadius: BorderRadius.all(Radius.circular(10.0))),
//       contentPadding: EdgeInsets.all(10.0),
//       content: Container(
//         height: 300.0,
//         width: 300,
//         child: SingleChildScrollView(child: child),
//       ),
//     );
//   }
//
//   static Padding taskDropdown({
//     Widget? child,
//     required BuildContext context,
//     String? hint,
//     dynamic item,
//     List<SelectTypeLabelDataModel>? items,
//     required bool validator,
//     Function(dynamic value)? onChanged,
//     bool hasType = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Container(
//         width: 100.h,
//         child: Column(
//           children: [
//             DropdownButtonFormField2<SelectTypeLabelDataModel>(
//               iconStyleData: IconStyleData(
//                   iconEnabledColor: ColorManager.hBluePacific,
//                   icon: const Icon(
//                     Icons.keyboard_arrow_down,
//                   ),
//                   iconSize: 30),
//               decoration: dropDownInputDecoration,
//               // hint: hint == null
//               //     ? null
//               //     : TextWidget(
//               //         text: hint,
//               //         fontSize: FontType.small.getValue(),
//               //       ),
//               isExpanded: true,
//               buttonStyleData: ButtonStyleData(
//                   height: 40,
//                   padding: const EdgeInsets.only(left: 20, right: 10),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                           Radius.circular(AppSize.inputRadiusSize)))),
//
//               value: item,
//               items: items
//                   ?.map<DropdownMenuItem<SelectTypeLabelDataModel>>((value) {
//                 return DropdownMenuItem<SelectTypeLabelDataModel>(
//                   value: value,
//                   alignment: Helper.checkFaLang(context)
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   child: TextWidget(
//                     text: Helper.checkFaLang(context)
//                         ? value.faLabel
//                         : value.enLabel,
//                     fontSize: FontType.small.getValue(),
//                   ),
//                 );
//               }).toList(),
//               validator: (value) {
//                 if (validator) {
//                   if (value == null || value.value == "") {
//                     return "";
//                   } else {
//                     return null;
//                   }
//                 } else {
//                   return null;
//                 }
//               },
//               onChanged: (value) {
//                 onChanged!(value);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
