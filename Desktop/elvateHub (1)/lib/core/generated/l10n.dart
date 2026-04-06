// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `انتهت صلاحية الجلسة`
  String get sessionExpire {
    return Intl.message(
      'انتهت صلاحية الجلسة',
      name: 'sessionExpire',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء إعادة تسجيل الدخول مرة اخرى لتجربة مستخدم أفضل`
  String get pleaseLogin {
    return Intl.message(
      'الرجاء إعادة تسجيل الدخول مرة اخرى لتجربة مستخدم أفضل',
      name: 'pleaseLogin',
      desc: '',
      args: [],
    );
  }

  /// `مساء الخير 👋`
  String get goodAfterNoon {
    return Intl.message(
      'مساء الخير 👋',
      name: 'goodAfterNoon',
      desc: '',
      args: [],
    );
  }

  /// `صباح الخير 👋`
  String get goodMorning {
    return Intl.message(
      'صباح الخير 👋',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد الخروج من التطبيق؟`
  String get youNeedLogout {
    return Intl.message(
      'هل تريد الخروج من التطبيق؟',
      name: 'youNeedLogout',
      desc: '',
      args: [],
    );
  }

  /// `نعم`
  String get yes {
    return Intl.message(
      'نعم',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `لا`
  String get no {
    return Intl.message(
      'لا',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `عميل`
  String get user {
    return Intl.message(
      'عميل',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حجز جديد`
  String get createReservation {
    return Intl.message(
      'إنشاء حجز جديد',
      name: 'createReservation',
      desc: '',
      args: [],
    );
  }

  /// `أدمن`
  String get admin {
    return Intl.message(
      'أدمن',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `فني`
  String get tech {
    return Intl.message(
      'فني',
      name: 'tech',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسية`
  String get home {
    return Intl.message(
      'الرئيسية',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `إضافة`
  String get add {
    return Intl.message(
      'إضافة',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `ذكر`
  String get male {
    return Intl.message(
      'ذكر',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `أنثى`
  String get female {
    return Intl.message(
      'أنثى',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد لديك حساب؟`
  String get dontHaveAnAccount {
    return Intl.message(
      'لا يوجد لديك حساب؟',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الأن`
  String get registerNow {
    return Intl.message(
      'تسجيل الأن',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل حساب جديد`
  String get register {
    return Intl.message(
      'تسجيل حساب جديد',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `تم إضافة العمل بنجاح`
  String get addNewBusinessSuccessfully {
    return Intl.message(
      'تم إضافة العمل بنجاح',
      name: 'addNewBusinessSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `حجوزاتي`
  String get reservations {
    return Intl.message(
      'حجوزاتي',
      name: 'reservations',
      desc: '',
      args: [],
    );
  }

  /// `الاسم`
  String get name {
    return Intl.message(
      'الاسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `حفظ`
  String get save {
    return Intl.message(
      'حفظ',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `يجب كتابة الاسم`
  String get nameError {
    return Intl.message(
      'يجب كتابة الاسم',
      name: 'nameError',
      desc: '',
      args: [],
    );
  }

  /// `تصنيف عملك`
  String get category {
    return Intl.message(
      'تصنيف عملك',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `يجب اختيار تصنيف عملك`
  String get categoryError {
    return Intl.message(
      'يجب اختيار تصنيف عملك',
      name: 'categoryError',
      desc: '',
      args: [],
    );
  }

  /// `نبذة تعريفية`
  String get bio {
    return Intl.message(
      'نبذة تعريفية',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `صورتك الشخصية`
  String get image {
    return Intl.message(
      'صورتك الشخصية',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ ميلادك`
  String get birthday {
    return Intl.message(
      'تاريخ ميلادك',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `اختر نوع حسابك`
  String get type {
    return Intl.message(
      'اختر نوع حسابك',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `يجب اختيار نوع الحساب`
  String get typeError {
    return Intl.message(
      'يجب اختيار نوع الحساب',
      name: 'typeError',
      desc: '',
      args: [],
    );
  }

  /// `ﻻ يوجد أي عمل لعرضه`
  String get notFoundBusiness {
    return Intl.message(
      'ﻻ يوجد أي عمل لعرضه',
      name: 'notFoundBusiness',
      desc: '',
      args: [],
    );
  }

  /// `أضف عمل جديد`
  String get addNewBusiness {
    return Intl.message(
      'أضف عمل جديد',
      name: 'addNewBusiness',
      desc: '',
      args: [],
    );
  }

  /// `أربــــاحي`
  String get myProfit {
    return Intl.message(
      'أربــــاحي',
      name: 'myProfit',
      desc: '',
      args: [],
    );
  }

  /// `اسم العمل`
  String get businessTitle {
    return Intl.message(
      'اسم العمل',
      name: 'businessTitle',
      desc: '',
      args: [],
    );
  }

  /// `يجب إضافة اسم العمل`
  String get businessTitleError {
    return Intl.message(
      'يجب إضافة اسم العمل',
      name: 'businessTitleError',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ العمل`
  String get businessDate {
    return Intl.message(
      'تاريخ العمل',
      name: 'businessDate',
      desc: '',
      args: [],
    );
  }

  /// `يجب إضافة تاريخ العمل`
  String get businessDateError {
    return Intl.message(
      'يجب إضافة تاريخ العمل',
      name: 'businessDateError',
      desc: '',
      args: [],
    );
  }

  /// `وصف للعمل`
  String get businessDesc {
    return Intl.message(
      'وصف للعمل',
      name: 'businessDesc',
      desc: '',
      args: [],
    );
  }

  /// `يجب إضافة وصف للعمل`
  String get businessDescError {
    return Intl.message(
      'يجب إضافة وصف للعمل',
      name: 'businessDescError',
      desc: '',
      args: [],
    );
  }

  /// `صورة العمل`
  String get businessImage {
    return Intl.message(
      'صورة العمل',
      name: 'businessImage',
      desc: '',
      args: [],
    );
  }

  /// `يجب إضافة صورة العمل`
  String get businessImageError {
    return Intl.message(
      'يجب إضافة صورة العمل',
      name: 'businessImageError',
      desc: '',
      args: [],
    );
  }

  /// `أعمالي`
  String get myBusiness {
    return Intl.message(
      'أعمالي',
      name: 'myBusiness',
      desc: '',
      args: [],
    );
  }

  /// `اللغة`
  String get language {
    return Intl.message(
      'اللغة',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `مرحبًا`
  String get hello {
    return Intl.message(
      'مرحبًا',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `متـــــــاح`
  String get isAvailable {
    return Intl.message(
      'متـــــــاح',
      name: 'isAvailable',
      desc: '',
      args: [],
    );
  }

  /// `غيـــر متـــــاح`
  String get isNotAvailable {
    return Intl.message(
      'غيـــر متـــــاح',
      name: 'isNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get mobileNumberHint {
    return Intl.message(
      'رقم الهاتف',
      name: 'mobileNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `أحدث الطلبات القادمة`
  String get recentReservation {
    return Intl.message(
      'أحدث الطلبات القادمة',
      name: 'recentReservation',
      desc: '',
      args: [],
    );
  }

  /// `عرض الكل`
  String get readMore {
    return Intl.message(
      'عرض الكل',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `إعادة التحميل`
  String get reloadRequest {
    return Intl.message(
      'إعادة التحميل',
      name: 'reloadRequest',
      desc: '',
      args: [],
    );
  }

  /// `درهم`
  String get drhm {
    return Intl.message(
      'درهم',
      name: 'drhm',
      desc: '',
      args: [],
    );
  }

  /// `أيام`
  String get days {
    return Intl.message(
      'أيام',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `حول التطبيق`
  String get info {
    return Intl.message(
      'حول التطبيق',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get profile {
    return Intl.message(
      'الملف الشخصي',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `عناويني`
  String get myAddress {
    return Intl.message(
      'عناويني',
      name: 'myAddress',
      desc: '',
      args: [],
    );
  }

  /// `إجمالي الرصيد`
  String get total {
    return Intl.message(
      'إجمالي الرصيد',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `التقرير المالي: `
  String get financialReport {
    return Intl.message(
      'التقرير المالي: ',
      name: 'financialReport',
      desc: '',
      args: [],
    );
  }

  /// `البيانات الشخصية`
  String get personalInformation {
    return Intl.message(
      'البيانات الشخصية',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `آراء العملاء`
  String get userRate {
    return Intl.message(
      'آراء العملاء',
      name: 'userRate',
      desc: '',
      args: [],
    );
  }

  /// `النوع`
  String get gender {
    return Intl.message(
      'النوع',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `الإيميل`
  String get email {
    return Intl.message(
      'الإيميل',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `الجوال`
  String get mobileNumber {
    return Intl.message(
      'الجوال',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `تعديل الملف الشخصي`
  String get updateProfile {
    return Intl.message(
      'تعديل الملف الشخصي',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `معرض الأعمال`
  String get portfolio {
    return Intl.message(
      'معرض الأعمال',
      name: 'portfolio',
      desc: '',
      args: [],
    );
  }

  /// `رقم الطلب: `
  String get reservationNumber {
    return Intl.message(
      'رقم الطلب: ',
      name: 'reservationNumber',
      desc: '',
      args: [],
    );
  }

  /// `عرض تفاصيل الطلب`
  String get reservationDetails {
    return Intl.message(
      'عرض تفاصيل الطلب',
      name: 'reservationDetails',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logout {
    return Intl.message(
      'تسجيل الخروج',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `أحصل`
  String get on1T1 {
    return Intl.message(
      'أحصل',
      name: 'on1T1',
      desc: '',
      args: [],
    );
  }

  /// `علي طلبات`
  String get on1T2 {
    return Intl.message(
      'علي طلبات',
      name: 'on1T2',
      desc: '',
      args: [],
    );
  }

  /// `أحصل علي طلباتك بسرعة\n فائقة`
  String get on1T3 {
    return Intl.message(
      'أحصل علي طلباتك بسرعة\n فائقة',
      name: 'on1T3',
      desc: '',
      args: [],
    );
  }

  /// `نفذ`
  String get on2T1 {
    return Intl.message(
      'نفذ',
      name: 'on2T1',
      desc: '',
      args: [],
    );
  }

  /// `طلبات`
  String get on2T2 {
    return Intl.message(
      'طلبات',
      name: 'on2T2',
      desc: '',
      args: [],
    );
  }

  /// `ضمان الجودة - التزام بالمواعيد\n أسعار تنافسية`
  String get on2T3 {
    return Intl.message(
      'ضمان الجودة - التزام بالمواعيد\n أسعار تنافسية',
      name: 'on2T3',
      desc: '',
      args: [],
    );
  }

  /// `اربح`
  String get on3T1 {
    return Intl.message(
      'اربح',
      name: 'on3T1',
      desc: '',
      args: [],
    );
  }

  /// `الآن`
  String get on3T2 {
    return Intl.message(
      'الآن',
      name: 'on3T2',
      desc: '',
      args: [],
    );
  }

  /// `مقبول`
  String get accepted {
    return Intl.message(
      'مقبول',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `في الانتظار`
  String get pending {
    return Intl.message(
      'في الانتظار',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `مكتمل`
  String get completed {
    return Intl.message(
      'مكتمل',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `حالة الحجز`
  String get reservationStatus {
    return Intl.message(
      'حالة الحجز',
      name: 'reservationStatus',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ الحجز`
  String get reservationDate {
    return Intl.message(
      'تاريخ الحجز',
      name: 'reservationDate',
      desc: '',
      args: [],
    );
  }

  /// `تعديل حالة الحجز`
  String get updateReservationStatus {
    return Intl.message(
      'تعديل حالة الحجز',
      name: 'updateReservationStatus',
      desc: '',
      args: [],
    );
  }

  /// `تم تعديل الحالة بنجاح`
  String get updateReservationSuccessfully {
    return Intl.message(
      'تم تعديل الحالة بنجاح',
      name: 'updateReservationSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `مغلي`
  String get cancelled {
    return Intl.message(
      'مغلي',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `عنوان الحجز`
  String get reservationTitle {
    return Intl.message(
      'عنوان الحجز',
      name: 'reservationTitle',
      desc: '',
      args: [],
    );
  }

  /// `يجب كتابة عنوان الحجز`
  String get reservationTitleError {
    return Intl.message(
      'يجب كتابة عنوان الحجز',
      name: 'reservationTitleError',
      desc: '',
      args: [],
    );
  }

  /// `وصف الحجز`
  String get reservationDesc {
    return Intl.message(
      'وصف الحجز',
      name: 'reservationDesc',
      desc: '',
      args: [],
    );
  }

  /// `تم إنشاء الحجز بنجاح`
  String get createNewReservationSuccessfully {
    return Intl.message(
      'تم إنشاء الحجز بنجاح',
      name: 'createNewReservationSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `يجب كتابة وصف الحجز`
  String get reservationDescError {
    return Intl.message(
      'يجب كتابة وصف الحجز',
      name: 'reservationDescError',
      desc: '',
      args: [],
    );
  }

  /// `صورة`
  String get reservationImage {
    return Intl.message(
      'صورة',
      name: 'reservationImage',
      desc: '',
      args: [],
    );
  }

  /// `اربح مع رفيقك الموثوق`
  String get on3T3 {
    return Intl.message(
      'اربح مع رفيقك الموثوق',
      name: 'on3T3',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل جديد`
  String get newLogin {
    return Intl.message(
      'تسجيل جديد',
      name: 'newLogin',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال رقم الهاتف الخاص بك`
  String get enterPhoneNumber {
    return Intl.message(
      'يرجى إدخال رقم الهاتف الخاص بك',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `العودة للخلف`
  String get gotoBack {
    return Intl.message(
      'العودة للخلف',
      name: 'gotoBack',
      desc: '',
      args: [],
    );
  }

  /// `إعادة إرسال`
  String get resendCode {
    return Intl.message(
      'إعادة إرسال',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `ينتهي الكود خلال`
  String get codeFinishedAt {
    return Intl.message(
      'ينتهي الكود خلال',
      name: 'codeFinishedAt',
      desc: '',
      args: [],
    );
  }

  /// `تم ارسال الكود`
  String get codeSent {
    return Intl.message(
      'تم ارسال الكود',
      name: 'codeSent',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message(
      'الإشعارات',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد إشعارات حاليًا`
  String get notificationEmpty {
    return Intl.message(
      'لا توجد إشعارات حاليًا',
      name: 'notificationEmpty',
      desc: '',
      args: [],
    );
  }

  /// `لم يصلك اي اكواد؟`
  String get codeNotSent {
    return Intl.message(
      'لم يصلك اي اكواد؟',
      name: 'codeNotSent',
      desc: '',
      args: [],
    );
  }

  /// `يرجى إدخال الـ 4 أرقام المرسلة إلى رقمك`
  String get pleaseEnterVerificationCode {
    return Intl.message(
      'يرجى إدخال الـ 4 أرقام المرسلة إلى رقمك',
      name: 'pleaseEnterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `ادخل رقم الهاتف`
  String get mobileNumberError {
    return Intl.message(
      'ادخل رقم الهاتف',
      name: 'mobileNumberError',
      desc: '',
      args: [],
    );
  }

  /// `ادخل البريد الإلكتروني`
  String get emailError {
    return Intl.message(
      'ادخل البريد الإلكتروني',
      name: 'emailError',
      desc: '',
      args: [],
    );
  }

  /// `ادخل كلمة المرور`
  String get passwordError {
    return Intl.message(
      'ادخل كلمة المرور',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `The place to connect, grow, and thrive in tech!`
  String get startedAppDesc1 {
    return Intl.message(
      'The place to connect, grow, and thrive in tech!',
      name: 'startedAppDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Find a Mentor Access \nJob Opportunities \nJoin Women in Tech \nEnhance Skills \nand more..`
  String get startedAppDesc2 {
    return Intl.message(
      'Find a Mentor Access \nJob Opportunities \nJoin Women in Tech \nEnhance Skills \nand more..',
      name: 'startedAppDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To elvateHub`
  String get welcomeToelvateHub {
    return Intl.message(
      'Welcome To elvateHub',
      name: 'welcomeToelvateHub',
      desc: '',
      args: [],
    );
  }

  /// `To The elvateHub App`
  String get toelvateHub {
    return Intl.message(
      'To The elvateHub App',
      name: 'toelvateHub',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Contributor`
  String get contributor {
    return Intl.message(
      'Contributor',
      name: 'contributor',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Subject is required`
  String get subjectError {
    return Intl.message(
      'Subject is required',
      name: 'subjectError',
      desc: '',
      args: [],
    );
  }

  /// `Contact us send successfully`
  String get contactUsSuccess {
    return Intl.message(
      'Contact us send successfully',
      name: 'contactUsSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Body`
  String get body {
    return Intl.message(
      'Body',
      name: 'body',
      desc: '',
      args: [],
    );
  }

  /// `Start Caht`
  String get startChat {
    return Intl.message(
      'Start Caht',
      name: 'startChat',
      desc: '',
      args: [],
    );
  }

  /// `Delete Booking Successfully`
  String get deleteBookingSuccessfully {
    return Intl.message(
      'Delete Booking Successfully',
      name: 'deleteBookingSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Body is required`
  String get bodyError {
    return Intl.message(
      'Body is required',
      name: 'bodyError',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `We Made it easier`
  String get weMade {
    return Intl.message(
      'We Made it easier',
      name: 'weMade',
      desc: '',
      args: [],
    );
  }

  /// `book, browser, ticket for whatever you want`
  String get bookBrowse {
    return Intl.message(
      'book, browser, ticket for whatever you want',
      name: 'bookBrowse',
      desc: '',
      args: [],
    );
  }

  /// `experience neomesim`
  String get experienceNeomesim {
    return Intl.message(
      'experience neomesim',
      name: 'experienceNeomesim',
      desc: '',
      args: [],
    );
  }

  /// `Like Never Before`
  String get likeNeverBefore {
    return Intl.message(
      'Like Never Before',
      name: 'likeNeverBefore',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Neomesim`
  String get registerDesc {
    return Intl.message(
      'Welcome To Neomesim',
      name: 'registerDesc',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `ON`
  String get on {
    return Intl.message(
      'ON',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `Choose a community`
  String get selectCommunity {
    return Intl.message(
      'Choose a community',
      name: 'selectCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Public Community`
  String get publicCommunity {
    return Intl.message(
      'Public Community',
      name: 'publicCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Women in Tech Community`
  String get womenInTechCommunity {
    return Intl.message(
      'Women in Tech Community',
      name: 'womenInTechCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get lightMode {
    return Intl.message(
      'Light mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Post title`
  String get postTitle {
    return Intl.message(
      'Post title',
      name: 'postTitle',
      desc: '',
      args: [],
    );
  }

  /// `Post title is required`
  String get postTitleError {
    return Intl.message(
      'Post title is required',
      name: 'postTitleError',
      desc: '',
      args: [],
    );
  }

  /// `Post content `
  String get postDesc {
    return Intl.message(
      'Post content ',
      name: 'postDesc',
      desc: '',
      args: [],
    );
  }

  /// `Post content is required`
  String get postDescError {
    return Intl.message(
      'Post content is required',
      name: 'postDescError',
      desc: '',
      args: [],
    );
  }

  /// `Post category`
  String get postCategory {
    return Intl.message(
      'Post category',
      name: 'postCategory',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Inappropriate Content`
  String get inappropriateContent {
    return Intl.message(
      'Inappropriate Content',
      name: 'inappropriateContent',
      desc: '',
      args: [],
    );
  }

  /// `Spam`
  String get spam {
    return Intl.message(
      'Spam',
      name: 'spam',
      desc: '',
      args: [],
    );
  }

  /// `Your report was successfully recorded!`
  String get reportSuccess {
    return Intl.message(
      'Your report was successfully recorded!',
      name: 'reportSuccess',
      desc: '',
      args: [],
    );
  }

  /// `False Information`
  String get falseInformation {
    return Intl.message(
      'False Information',
      name: 'falseInformation',
      desc: '',
      args: [],
    );
  }

  /// `Copyright Violation`
  String get copyrightViolation {
    return Intl.message(
      'Copyright Violation',
      name: 'copyrightViolation',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Violation`
  String get privacyViolation {
    return Intl.message(
      'Privacy Violation',
      name: 'privacyViolation',
      desc: '',
      args: [],
    );
  }

  /// `Promotional Content`
  String get promotionalContent {
    return Intl.message(
      'Promotional Content',
      name: 'promotionalContent',
      desc: '',
      args: [],
    );
  }

  /// `other...`
  String get other {
    return Intl.message(
      'other...',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Job Role`
  String get jobTitle {
    return Intl.message(
      'Job Role',
      name: 'jobTitle',
      desc: '',
      args: [],
    );
  }

  /// `Job Description`
  String get jobDesc {
    return Intl.message(
      'Job Description',
      name: 'jobDesc',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Image Url`
  String get imageUrl {
    return Intl.message(
      'Image Url',
      name: 'imageUrl',
      desc: '',
      args: [],
    );
  }

  /// `Job Requirements`
  String get jobRequirement {
    return Intl.message(
      'Job Requirements',
      name: 'jobRequirement',
      desc: '',
      args: [],
    );
  }

  /// `Create New Job`
  String get createNewJob {
    return Intl.message(
      'Create New Job',
      name: 'createNewJob',
      desc: '',
      args: [],
    );
  }

  /// `Edit The Job`
  String get editJob {
    return Intl.message(
      'Edit The Job',
      name: 'editJob',
      desc: '',
      args: [],
    );
  }

  /// `Your Applications Status`
  String get yourApplicationsStatus {
    return Intl.message(
      'Your Applications Status',
      name: 'yourApplicationsStatus',
      desc: '',
      args: [],
    );
  }

  /// `Applications`
  String get applications {
    return Intl.message(
      'Applications',
      name: 'applications',
      desc: '',
      args: [],
    );
  }

  /// `Role:`
  String get role {
    return Intl.message(
      'Role:',
      name: 'role',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `CV`
  String get cv {
    return Intl.message(
      'CV',
      name: 'cv',
      desc: '',
      args: [],
    );
  }

  /// `Request Mentorship`
  String get requestMentorship {
    return Intl.message(
      'Request Mentorship',
      name: 'requestMentorship',
      desc: '',
      args: [],
    );
  }

  /// `Mentorship History`
  String get mentorshipHistory {
    return Intl.message(
      'Mentorship History',
      name: 'mentorshipHistory',
      desc: '',
      args: [],
    );
  }

  /// `Pending Request`
  String get pendingRequest {
    return Intl.message(
      'Pending Request',
      name: 'pendingRequest',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Session`
  String get upcomingSession {
    return Intl.message(
      'Upcoming Session',
      name: 'upcomingSession',
      desc: '',
      args: [],
    );
  }

  /// `Mentorship Home`
  String get mentorshipHome {
    return Intl.message(
      'Mentorship Home',
      name: 'mentorshipHome',
      desc: '',
      args: [],
    );
  }

  /// `Matching`
  String get matching {
    return Intl.message(
      'Matching',
      name: 'matching',
      desc: '',
      args: [],
    );
  }

  /// `Submit Request`
  String get submitRequest {
    return Intl.message(
      'Submit Request',
      name: 'submitRequest',
      desc: '',
      args: [],
    );
  }

  /// ` Mentorship Agreement`
  String get mentorshipAgreement {
    return Intl.message(
      ' Mentorship Agreement',
      name: 'mentorshipAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Matched Mentees..`
  String get matchedMentees {
    return Intl.message(
      'Matched Mentees..',
      name: 'matchedMentees',
      desc: '',
      args: [],
    );
  }

  /// `Mentorship Request Details`
  String get mentorshipRequestDetails {
    return Intl.message(
      'Mentorship Request Details',
      name: 'mentorshipRequestDetails',
      desc: '',
      args: [],
    );
  }

  /// `Any Specific goals you want to achive?`
  String get anySpecificGoals {
    return Intl.message(
      'Any Specific goals you want to achive?',
      name: 'anySpecificGoals',
      desc: '',
      args: [],
    );
  }

  /// `Agreement:`
  String get agreement {
    return Intl.message(
      'Agreement:',
      name: 'agreement',
      desc: '',
      args: [],
    );
  }

  /// `By joining the Mentor-Mentee Matching Program, you agree to the following terms to support a respectful, productive, and enriching mentorship experience:`
  String get agreementDetails {
    return Intl.message(
      'By joining the Mentor-Mentee Matching Program, you agree to the following terms to support a respectful, productive, and enriching mentorship experience:',
      name: 'agreementDetails',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Purpose`
  String get purpose {
    return Intl.message(
      'Purpose',
      name: 'purpose',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Select Duration`
  String get selectDuration {
    return Intl.message(
      'Select Duration',
      name: 'selectDuration',
      desc: '',
      args: [],
    );
  }

  /// `2 weeks`
  String get weeks2 {
    return Intl.message(
      '2 weeks',
      name: 'weeks2',
      desc: '',
      args: [],
    );
  }

  /// `4 weeks`
  String get weeks4 {
    return Intl.message(
      '4 weeks',
      name: 'weeks4',
      desc: '',
      args: [],
    );
  }

  /// `6 weeks`
  String get weeks6 {
    return Intl.message(
      '6 weeks',
      name: 'weeks6',
      desc: '',
      args: [],
    );
  }

  /// `2 months`
  String get months2 {
    return Intl.message(
      '2 months',
      name: 'months2',
      desc: '',
      args: [],
    );
  }

  /// `Select Purpose`
  String get selectPurpose {
    return Intl.message(
      'Select Purpose',
      name: 'selectPurpose',
      desc: '',
      args: [],
    );
  }

  /// `Skill Development`
  String get skillDevelopment {
    return Intl.message(
      'Skill Development',
      name: 'skillDevelopment',
      desc: '',
      args: [],
    );
  }

  /// `Career Growth`
  String get careerGrowth {
    return Intl.message(
      'Career Growth',
      name: 'careerGrowth',
      desc: '',
      args: [],
    );
  }

  /// `Problem-Solving and Guidance`
  String get problemSolvingAndGuidance {
    return Intl.message(
      'Problem-Solving and Guidance',
      name: 'problemSolvingAndGuidance',
      desc: '',
      args: [],
    );
  }

  /// `Personalized Learning Path`
  String get personalizedLearningPath {
    return Intl.message(
      'Personalized Learning Path',
      name: 'personalizedLearningPath',
      desc: '',
      args: [],
    );
  }

  /// `Another?`
  String get another {
    return Intl.message(
      'Another?',
      name: 'another',
      desc: '',
      args: [],
    );
  }

  /// `Write Here`
  String get writeHere {
    return Intl.message(
      'Write Here',
      name: 'writeHere',
      desc: '',
      args: [],
    );
  }

  /// `DOCS`
  String get docs {
    return Intl.message(
      'DOCS',
      name: 'docs',
      desc: '',
      args: [],
    );
  }

  /// `Update Status Success`
  String get updateStatusSuccess {
    return Intl.message(
      'Update Status Success',
      name: 'updateStatusSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Application Request have been submitted successfully`
  String get applySuccess {
    return Intl.message(
      'Application Request have been submitted successfully',
      name: 'applySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Apply for the Position`
  String get applyForThePosition {
    return Intl.message(
      'Apply for the Position',
      name: 'applyForThePosition',
      desc: '',
      args: [],
    );
  }

  /// `Upload your Resume`
  String get uploadYourResume {
    return Intl.message(
      'Upload your Resume',
      name: 'uploadYourResume',
      desc: '',
      args: [],
    );
  }

  /// `Upload additional Docs`
  String get uploadAdditionalDocs {
    return Intl.message(
      'Upload additional Docs',
      name: 'uploadAdditionalDocs',
      desc: '',
      args: [],
    );
  }

  /// `Want to Write a Massage?`
  String get wantWriteMassage {
    return Intl.message(
      'Want to Write a Massage?',
      name: 'wantWriteMassage',
      desc: '',
      args: [],
    );
  }

  /// `Send Request`
  String get sendRequest {
    return Intl.message(
      'Send Request',
      name: 'sendRequest',
      desc: '',
      args: [],
    );
  }

  /// `Apply Now`
  String get applyNow {
    return Intl.message(
      'Apply Now',
      name: 'applyNow',
      desc: '',
      args: [],
    );
  }

  /// `Select Category`
  String get selectCategory {
    return Intl.message(
      'Select Category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Manage Job Opportunities`
  String get manageJob {
    return Intl.message(
      'Manage Job Opportunities',
      name: 'manageJob',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get updateJob {
    return Intl.message(
      'Update',
      name: 'updateJob',
      desc: '',
      args: [],
    );
  }

  /// `The Job has been Posted Successfully!`
  String get jobCreateSuccess {
    return Intl.message(
      'The Job has been Posted Successfully!',
      name: 'jobCreateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `The Job has been Updated Successfully!`
  String get jobUpdateSuccess {
    return Intl.message(
      'The Job has been Updated Successfully!',
      name: 'jobUpdateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Find Your New Job!`
  String get findJob {
    return Intl.message(
      'Find Your New Job!',
      name: 'findJob',
      desc: '',
      args: [],
    );
  }

  /// `Search for Job Opportunity`
  String get search {
    return Intl.message(
      'Search for Job Opportunity',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Apply Filters`
  String get applyFilters {
    return Intl.message(
      'Apply Filters',
      name: 'applyFilters',
      desc: '',
      args: [],
    );
  }

  /// `Search results:`
  String get Searchresults {
    return Intl.message(
      'Search results:',
      name: 'Searchresults',
      desc: '',
      args: [],
    );
  }

  /// `Explore...`
  String get explore {
    return Intl.message(
      'Explore...',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Enter Comment`
  String get enterComment {
    return Intl.message(
      'Enter Comment',
      name: 'enterComment',
      desc: '',
      args: [],
    );
  }

  /// `Report reason`
  String get reportReason {
    return Intl.message(
      'Report reason',
      name: 'reportReason',
      desc: '',
      args: [],
    );
  }

  /// `ElevetHub community`
  String get elevetHubCommunity {
    return Intl.message(
      'ElevetHub community',
      name: 'elevetHubCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Create Post Successfully`
  String get createPostSuccessfully {
    return Intl.message(
      'Create Post Successfully',
      name: 'createPostSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile information`
  String get editProfileTap {
    return Intl.message(
      'Edit profile information',
      name: 'editProfileTap',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notificationTap {
    return Intl.message(
      'Notifications',
      name: 'notificationTap',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get languageTap {
    return Intl.message(
      'Language',
      name: 'languageTap',
      desc: '',
      args: [],
    );
  }

  /// ` Mange My Resources`
  String get manageTap {
    return Intl.message(
      ' Mange My Resources',
      name: 'manageTap',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get securityTap {
    return Intl.message(
      'Security',
      name: 'securityTap',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get thememTap {
    return Intl.message(
      'Theme',
      name: 'thememTap',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpTap {
    return Intl.message(
      'Help & Support',
      name: 'helpTap',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUsTap {
    return Intl.message(
      'Contact us',
      name: 'contactUsTap',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyTap {
    return Intl.message(
      'Privacy policy',
      name: 'privacyTap',
      desc: '',
      args: [],
    );
  }

  /// `Join ELEVATE HUB Community..`
  String get joinCommunity {
    return Intl.message(
      'Join ELEVATE HUB Community..',
      name: 'joinCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Job Board`
  String get findANewJob {
    return Intl.message(
      'Job Board',
      name: 'findANewJob',
      desc: '',
      args: [],
    );
  }

  /// `Enroll in Courses`
  String get enrollInCourses {
    return Intl.message(
      'Enroll in Courses',
      name: 'enrollInCourses',
      desc: '',
      args: [],
    );
  }

  /// `Join an Event`
  String get joinAnEvent {
    return Intl.message(
      'Join an Event',
      name: 'joinAnEvent',
      desc: '',
      args: [],
    );
  }

  /// `Explore Resource Library`
  String get exploreResourceLibrary {
    return Intl.message(
      'Explore Resource Library',
      name: 'exploreResourceLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Mentor-Mentee Matching`
  String get findYourBestMatches {
    return Intl.message(
      'Mentor-Mentee Matching',
      name: 'findYourBestMatches',
      desc: '',
      args: [],
    );
  }

  /// `Send Attachment`
  String get sendAttachment {
    return Intl.message(
      'Send Attachment',
      name: 'sendAttachment',
      desc: '',
      args: [],
    );
  }

  /// `Full Name is required`
  String get fullNameError {
    return Intl.message(
      'Full Name is required',
      name: 'fullNameError',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `What do you Like to do Today?`
  String get whatDoLike {
    return Intl.message(
      'What do you Like to do Today?',
      name: 'whatDoLike',
      desc: '',
      args: [],
    );
  }

  /// `Join ElevateHub to connect with experienced mentors, explore job opportunities, and engage with a vibrant community.`
  String get loginDesc {
    return Intl.message(
      'Join ElevateHub to connect with experienced mentors, explore job opportunities, and engage with a vibrant community.',
      name: 'loginDesc',
      desc: '',
      args: [],
    );
  }

  /// `Wait To Active Account`
  String get waitToActiveAccount {
    return Intl.message(
      'Wait To Active Account',
      name: 'waitToActiveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Select your role`
  String get userType {
    return Intl.message(
      'Select your role',
      name: 'userType',
      desc: '',
      args: [],
    );
  }

  /// `Add Resource`
  String get addResource {
    return Intl.message(
      'Add Resource',
      name: 'addResource',
      desc: '',
      args: [],
    );
  }

  /// `Resource`
  String get resource {
    return Intl.message(
      'Resource',
      name: 'resource',
      desc: '',
      args: [],
    );
  }

  /// `For Women`
  String get forWomen {
    return Intl.message(
      'For Women',
      name: 'forWomen',
      desc: '',
      args: [],
    );
  }

  /// `All Chat`
  String get allChat {
    return Intl.message(
      'All Chat',
      name: 'allChat',
      desc: '',
      args: [],
    );
  }

  /// `Mentorship Upcoming sessions`
  String get upcomingSessions {
    return Intl.message(
      'Mentorship Upcoming sessions',
      name: 'upcomingSessions',
      desc: '',
      args: [],
    );
  }

  /// `Scehdule upcoming session`
  String get scehduleUpcomingSession {
    return Intl.message(
      'Scehdule upcoming session',
      name: 'scehduleUpcomingSession',
      desc: '',
      args: [],
    );
  }

  /// `Send Attachment is required`
  String get sendAttachmentError {
    return Intl.message(
      'Send Attachment is required',
      name: 'sendAttachmentError',
      desc: '',
      args: [],
    );
  }

  /// `Select your interests`
  String get interests {
    return Intl.message(
      'Select your interests',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `Select your interests is required`
  String get interestsError {
    return Intl.message(
      'Select your interests is required',
      name: 'interestsError',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `category Is Empty`
  String get categoryIsEmpty {
    return Intl.message(
      'category Is Empty',
      name: 'categoryIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Add Category`
  String get addCategory {
    return Intl.message(
      'Add Category',
      name: 'addCategory',
      desc: '',
      args: [],
    );
  }

  /// `Category Image`
  String get categoryImage {
    return Intl.message(
      'Category Image',
      name: 'categoryImage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Name`
  String get arabicName {
    return Intl.message(
      'Arabic Name',
      name: 'arabicName',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Name is required`
  String get arabicNameError {
    return Intl.message(
      'Arabic Name is required',
      name: 'arabicNameError',
      desc: '',
      args: [],
    );
  }

  /// `English Name`
  String get englishName {
    return Intl.message(
      'English Name',
      name: 'englishName',
      desc: '',
      args: [],
    );
  }

  /// `English Name is required`
  String get englishNameError {
    return Intl.message(
      'English Name is required',
      name: 'englishNameError',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Create New Offer`
  String get createNewOffer {
    return Intl.message(
      'Create New Offer',
      name: 'createNewOffer',
      desc: '',
      args: [],
    );
  }

  /// `Add image/images`
  String get addImageOrImages {
    return Intl.message(
      'Add image/images',
      name: 'addImageOrImages',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Title`
  String get arabicTitle {
    return Intl.message(
      'Arabic Title',
      name: 'arabicTitle',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Title is required`
  String get arabicTitleError {
    return Intl.message(
      'Arabic Title is required',
      name: 'arabicTitleError',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Description`
  String get arabicDesc {
    return Intl.message(
      'Arabic Description',
      name: 'arabicDesc',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Description is required`
  String get arabicDescError {
    return Intl.message(
      'Arabic Description is required',
      name: 'arabicDescError',
      desc: '',
      args: [],
    );
  }

  /// `English Description`
  String get englishDesc {
    return Intl.message(
      'English Description',
      name: 'englishDesc',
      desc: '',
      args: [],
    );
  }

  /// `English Description is required`
  String get englishDescError {
    return Intl.message(
      'English Description is required',
      name: 'englishDescError',
      desc: '',
      args: [],
    );
  }

  /// `English Title`
  String get englishTitle {
    return Intl.message(
      'English Title',
      name: 'englishTitle',
      desc: '',
      args: [],
    );
  }

  /// `English Title is required`
  String get englishTitleError {
    return Intl.message(
      'English Title is required',
      name: 'englishTitleError',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Location is required`
  String get locationError {
    return Intl.message(
      'Location is required',
      name: 'locationError',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Need Room Counter`
  String get needRoomCounter {
    return Intl.message(
      'Need Room Counter',
      name: 'needRoomCounter',
      desc: '',
      args: [],
    );
  }

  /// `Need Adult Counter`
  String get needAdultCounter {
    return Intl.message(
      'Need Adult Counter',
      name: 'needAdultCounter',
      desc: '',
      args: [],
    );
  }

  /// `Adult Counter`
  String get adultCounter {
    return Intl.message(
      'Adult Counter',
      name: 'adultCounter',
      desc: '',
      args: [],
    );
  }

  /// `Adult Counter is required`
  String get adultCounterError {
    return Intl.message(
      'Adult Counter is required',
      name: 'adultCounterError',
      desc: '',
      args: [],
    );
  }

  /// `Room Counter`
  String get roomCounter {
    return Intl.message(
      'Room Counter',
      name: 'roomCounter',
      desc: '',
      args: [],
    );
  }

  /// `Room Counter is required`
  String get roomCounterError {
    return Intl.message(
      'Room Counter is required',
      name: 'roomCounterError',
      desc: '',
      args: [],
    );
  }

  /// `Booking List`
  String get bookingList {
    return Intl.message(
      'Booking List',
      name: 'bookingList',
      desc: '',
      args: [],
    );
  }

  /// `Create Booking Successfully`
  String get createBookingSuccess {
    return Intl.message(
      'Create Booking Successfully',
      name: 'createBookingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Goto booking list`
  String get gotoBookingList {
    return Intl.message(
      'Goto booking list',
      name: 'gotoBookingList',
      desc: '',
      args: [],
    );
  }

  /// `Pay Now`
  String get payNow {
    return Intl.message(
      'Pay Now',
      name: 'payNow',
      desc: '',
      args: [],
    );
  }

  /// `Date From`
  String get dateFrom {
    return Intl.message(
      'Date From',
      name: 'dateFrom',
      desc: '',
      args: [],
    );
  }

  /// `Date From is required`
  String get dateFromError {
    return Intl.message(
      'Date From is required',
      name: 'dateFromError',
      desc: '',
      args: [],
    );
  }

  /// `Date To`
  String get dateTo {
    return Intl.message(
      'Date To',
      name: 'dateTo',
      desc: '',
      args: [],
    );
  }

  /// `Date To is required`
  String get dateToError {
    return Intl.message(
      'Date To is required',
      name: 'dateToError',
      desc: '',
      args: [],
    );
  }

  /// `Offer Details`
  String get offerDetails {
    return Intl.message(
      'Offer Details',
      name: 'offerDetails',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message(
      'Book Now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message(
      'Recommended',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Latest Offer`
  String get latestOffer {
    return Intl.message(
      'Latest Offer',
      name: 'latestOffer',
      desc: '',
      args: [],
    );
  }

  /// `Is Recommended`
  String get isRecommended {
    return Intl.message(
      'Is Recommended',
      name: 'isRecommended',
      desc: '',
      args: [],
    );
  }

  /// `Need Date From/To`
  String get needDateFromTo {
    return Intl.message(
      'Need Date From/To',
      name: 'needDateFromTo',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Privacy And Security`
  String get privacyAndSecurity {
    return Intl.message(
      'Privacy And Security',
      name: 'privacyAndSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Support And About`
  String get supportAndAbout {
    return Intl.message(
      'Support And About',
      name: 'supportAndAbout',
      desc: '',
      args: [],
    );
  }

  /// `Help And Support`
  String get helpAndSupport {
    return Intl.message(
      'Help And Support',
      name: 'helpAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `Term And Policies`
  String get termAndPolicies {
    return Intl.message(
      'Term And Policies',
      name: 'termAndPolicies',
      desc: '',
      args: [],
    );
  }

  /// `Actions`
  String get actions {
    return Intl.message(
      'Actions',
      name: 'actions',
      desc: '',
      args: [],
    );
  }

  /// `Report And Problem`
  String get reportAndProblem {
    return Intl.message(
      'Report And Problem',
      name: 'reportAndProblem',
      desc: '',
      args: [],
    );
  }

  /// `Create New Category Success`
  String get createNewCategorySuccess {
    return Intl.message(
      'Create New Category Success',
      name: 'createNewCategorySuccess',
      desc: '',
      args: [],
    );
  }

  /// `Create New Category`
  String get createNewCategory {
    return Intl.message(
      'Create New Category',
      name: 'createNewCategory',
      desc: '',
      args: [],
    );
  }

  /// `First Name is required`
  String get firstNameError {
    return Intl.message(
      'First Name is required',
      name: 'firstNameError',
      desc: '',
      args: [],
    );
  }

  /// `First Name is required`
  String get lastNameError {
    return Intl.message(
      'First Name is required',
      name: 'lastNameError',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد حجوزات بعد`
  String get notHaveReservationNow {
    return Intl.message(
      'لا يوجد حجوزات بعد',
      name: 'notHaveReservationNow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
