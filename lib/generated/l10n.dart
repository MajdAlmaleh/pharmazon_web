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

  /// `pharmazon`
  String get pharmazon {
    return Intl.message(
      'pharmazon',
      name: 'pharmazon',
      desc: '',
      args: [],
    );
  }

  /// `welcome to pharmazon`
  String get title {
    return Intl.message(
      'welcome to pharmazon',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `english`
  String get language {
    return Intl.message(
      'english',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Add Item`
  String get addItem {
    return Intl.message(
      'Add Item',
      name: 'addItem',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Scientific Name`
  String get scientificName {
    return Intl.message(
      'Scientific Name',
      name: 'scientificName',
      desc: '',
      args: [],
    );
  }

  /// `Commercial Name`
  String get commercialName {
    return Intl.message(
      'Commercial Name',
      name: 'commercialName',
      desc: '',
      args: [],
    );
  }

  /// `Calssification`
  String get calssification {
    return Intl.message(
      'Calssification',
      name: 'calssification',
      desc: '',
      args: [],
    );
  }

  /// `Manufacture Company`
  String get manufactureCompany {
    return Intl.message(
      'Manufacture Company',
      name: 'manufactureCompany',
      desc: '',
      args: [],
    );
  }

  /// `Available Quantity`
  String get quantityAvailable {
    return Intl.message(
      'Available Quantity',
      name: 'quantityAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Expire Date`
  String get expireDate {
    return Intl.message(
      'Expire Date',
      name: 'expireDate',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get price {
    return Intl.message(
      'price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `There is no medicines`
  String get ThereIsNoMedicines {
    return Intl.message(
      'There is no medicines',
      name: 'ThereIsNoMedicines',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Details for`
  String get medicineDetailsfor {
    return Intl.message(
      'Medicine Details for',
      name: 'medicineDetailsfor',
      desc: '',
      args: [],
    );
  }

  /// `Quantity updated successfully`
  String get quantityUpdatedSuccessfully {
    return Intl.message(
      'Quantity updated successfully',
      name: 'quantityUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit the quantity`
  String get editTheQuantity {
    return Intl.message(
      'Edit the quantity',
      name: 'editTheQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Phone number should be 10 digits and start with 09`
  String get phoneNumberShouldBe10DigitsAndStartWith09 {
    return Intl.message(
      'Phone number should be 10 digits and start with 09',
      name: 'phoneNumberShouldBe10DigitsAndStartWith09',
      desc: '',
      args: [],
    );
  }

  /// `Username should be at lest 10 characters`
  String get usernameShouldBeAtLest10Characters {
    return Intl.message(
      'Username should be at lest 10 characters',
      name: 'usernameShouldBeAtLest10Characters',
      desc: '',
      args: [],
    );
  }

  /// `Password should be at lest 8 characters`
  String get passwordShouldBeAtLest8Characters {
    return Intl.message(
      'Password should be at lest 8 characters',
      name: 'passwordShouldBeAtLest8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account ?`
  String get doNotHaveAnAccount {
    return Intl.message(
      'Do not have an account ?',
      name: 'doNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get enterYourUsername {
    return Intl.message(
      'Enter your username',
      name: 'enterYourUsername',
      desc: '',
      args: [],
    );
  }

  /// `Added Successfully!`
  String get addedSuccessfully {
    return Intl.message(
      'Added Successfully!',
      name: 'addedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Add Item`
  String get add {
    return Intl.message(
      'Add Item',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Please enter some text`
  String get pleaseEnterSomeText {
    return Intl.message(
      'Please enter some text',
      name: 'pleaseEnterSomeText',
      desc: '',
      args: [],
    );
  }

  /// `there is no medicines to show`
  String get thereIsNoMedicinesToShow {
    return Intl.message(
      'there is no medicines to show',
      name: 'thereIsNoMedicinesToShow',
      desc: '',
      args: [],
    );
  }

  /// `there is no clients`
  String get thereIsNoClients {
    return Intl.message(
      'there is no clients',
      name: 'thereIsNoClients',
      desc: '',
      args: [],
    );
  }

  /// `there is no orders`
  String get thereIsNoOrders {
    return Intl.message(
      'there is no orders',
      name: 'thereIsNoOrders',
      desc: '',
      args: [],
    );
  }

  /// `Order delivered successfully`
  String get orderDeliveredSuccessfully {
    return Intl.message(
      'Order delivered successfully',
      name: 'orderDeliveredSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Order cancelled`
  String get orderCancelled {
    return Intl.message(
      'Order cancelled',
      name: 'orderCancelled',
      desc: '',
      args: [],
    );
  }

  /// `In Process...`
  String get inProcess {
    return Intl.message(
      'In Process...',
      name: 'inProcess',
      desc: '',
      args: [],
    );
  }

  /// `In Preparation`
  String get inPreparation {
    return Intl.message(
      'In Preparation',
      name: 'inPreparation',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get send {
    return Intl.message(
      'Sent',
      name: 'send',
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

  /// `Order payment done successfully`
  String get orderPaymentDoneSuccessfully {
    return Intl.message(
      'Order payment done successfully',
      name: 'orderPaymentDoneSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Un Paid`
  String get unPaid {
    return Intl.message(
      'Un Paid',
      name: 'unPaid',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message(
      'Paid',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `Dates for`
  String get datesFor {
    return Intl.message(
      'Dates for',
      name: 'datesFor',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Language:`
  String get Language {
    return Intl.message(
      'Language:',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get LogOut {
    return Intl.message(
      'Log out',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `Select Month`
  String get selectMonth {
    return Intl.message(
      'Select Month',
      name: 'selectMonth',
      desc: '',
      args: [],
    );
  }

  /// `Select Year`
  String get selectYear {
    return Intl.message(
      'Select Year',
      name: 'selectYear',
      desc: '',
      args: [],
    );
  }

  /// `Show Report`
  String get showReport {
    return Intl.message(
      'Show Report',
      name: 'showReport',
      desc: '',
      args: [],
    );
  }

  /// `Please select month and year`
  String get pleaseSelectMonthAndYear {
    return Intl.message(
      'Please select month and year',
      name: 'pleaseSelectMonthAndYear',
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

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `There is no sales for this month`
  String get thereIsNoMedicinesForThisMonth {
    return Intl.message(
      'There is no sales for this month',
      name: 'thereIsNoMedicinesForThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `There is no quantities for this month`
  String get thereIsNoQuantitiesForThisMonth {
    return Intl.message(
      'There is no quantities for this month',
      name: 'thereIsNoQuantitiesForThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Total Paid for this month:`
  String get totalPaidForThisMonth {
    return Intl.message(
      'Total Paid for this month:',
      name: 'totalPaidForThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Sales Report of`
  String get salesReportOf {
    return Intl.message(
      'Sales Report of',
      name: 'salesReportOf',
      desc: '',
      args: [],
    );
  }

  /// `Quantities Report of`
  String get quantityReportOf {
    return Intl.message(
      'Quantities Report of',
      name: 'quantityReportOf',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get sales {
    return Intl.message(
      'Sales',
      name: 'sales',
      desc: '',
      args: [],
    );
  }

  /// `Quantities`
  String get quantities {
    return Intl.message(
      'Quantities',
      name: 'quantities',
      desc: '',
      args: [],
    );
  }

  /// `Can't edit quantity`
  String get cantEdit {
    return Intl.message(
      'Can\'t edit quantity',
      name: 'cantEdit',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
