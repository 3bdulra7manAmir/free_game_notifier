import 'package:flutter/material.dart';
import 'package:free_game_notifier/core/extensions/string.dart';

import '../../../config/l10n/generated/app_localizations.dart';


abstract class AppValidation
{
  AppValidation._();

  static String? emailValidation(String? value, BuildContext context)
  {
    try
    {
      if (value == null || value.isEmpty)
      {
        return AppLocalizations.of(context).emailIsRequired;
      }
      if (!value.contains('@'))
      {
        return AppLocalizations.of(context).invalidEmailSymbol;
      }
      if (!value.emailEndsWithDomain)
      {
        return AppLocalizations.of(context).invalidEmailDomain;
      }
      if (!value.isEmail)
      {
        return AppLocalizations.of(context).enterEmaill;
      }
      return null;
    }
    catch (e)
    {
      return "${AppLocalizations.of(context).validateFailurEmail} ${e.toString()}";
    }
  }

  static String? fullNameValidation(String? value, BuildContext context)
  {
    try
    {
      if (value == null || value.trim().isEmpty)
      {
        return AppLocalizations.of(context).fullNameIsRequired;
      }
      if (!value.isFullName)
      {
        return AppLocalizations.of(context).invalidFullName;
      }
      return null;
    }
    catch (e)
    {
      return "${AppLocalizations.of(context).validateFailureFullName} ${e.toString()}";
    }
  }

  static String? passwordValidation(String? value, BuildContext context)
  {
    try
    {
      final password = value ?? "";
      if (password.isEmpty)
      {
        return AppLocalizations.of(context).passwordIsRequired;
      }
      if (!password.passwordIsLongEnough)
      {
        return AppLocalizations.of(context).passwordLength8Character;
      }
      if (!password.passwordHasUpperCase)
      {
        return AppLocalizations.of(context).passwordOneUpperCase;
      }
      if (!password.passwordHasLowerCase)
      {
        return AppLocalizations.of(context).passwordOneLowerCase;
      }
      if (!password.passwordHasDigit)
      {
        return AppLocalizations.of(context).passwordOneNumber;
      }
      if (!password.passwordHasSpecialChar)
      {
        return AppLocalizations.of(context).passwordOneSpecialCharacter;
      }
      if (!password.hasValidPassword)
      {
        return AppLocalizations.of(context).invalidPassword;
      }
      return null;
    }
    catch (e)
    {
      return "${AppLocalizations.of(context).validateFailurPassword} ${e.toString()}";
    }
  }
}