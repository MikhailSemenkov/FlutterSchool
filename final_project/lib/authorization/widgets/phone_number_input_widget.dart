import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberInputWidget extends StatefulWidget {
  const PhoneNumberInputWidget({Key? key, required Function onInput})
      : _onInput = onInput,
        super(key: key);

  final Function _onInput;

  @override
  State<PhoneNumberInputWidget> createState() => _PhoneNumberInputWidgetState();
}

class _PhoneNumberInputWidgetState extends State<PhoneNumberInputWidget> {
  String _phoneNumber = '';

  bool _isValid = false;

  _validateNumber(phone) {
    final country =
        countries.firstWhere((element) => element.code == phone.countryISOCode);
    if (phone.number.length >= country.minLength &&
        phone.number.length <= country.maxLength) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    setState(() {
      _phoneNumber = phone.completeNumber;
    });
    widget._onInput(_phoneNumber, _isValid);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IntlPhoneField(
      style: theme.textTheme.bodyMedium,
      dropdownTextStyle: theme.textTheme.bodyMedium,
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.grey,
      ),
      cursorColor: theme.colorScheme.onBackground,
      pickerDialogStyle: PickerDialogStyle(
        searchFieldInputDecoration: InputDecoration(
          enabled: false,
          labelText: 'Choose your country',
          labelStyle: theme.textTheme.titleSmall,
        ),
        backgroundColor: theme.colorScheme.background,
      ),
      decoration: InputDecoration(
        labelText: 'Phone Number',
        errorStyle: TextStyle(color: theme.colorScheme.error),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 18,
          color: (_isValid || _phoneNumber.isEmpty)
              ? theme.colorScheme.onBackground
              : theme.colorScheme.error,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: theme.colorScheme.onBackground),
        ),
      ),
      initialCountryCode: 'UA',
      onChanged: _validateNumber,
    );
  }
}
