import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter{
  final String sample;
  final String separator;

  PhoneNumberFormatter({required this.sample, required this.separator});
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.isNotEmpty){
      if(newValue.text.length > oldValue.text.length){
        if(newValue.text.length < sample.length && sample[newValue.text.length - 1] == separator){
          if(newValue.text.length-1==2){
            return TextEditingValue(
              text: '${oldValue.text} (${newValue.text.substring(newValue.text.length -1)}',
              selection: TextSelection.collapsed(offset: newValue.selection.end + 2,),
            );
          }else{
            return TextEditingValue(
              text: '${oldValue.text} ${newValue.text.substring(newValue.text.length -1)}',
              selection: TextSelection.collapsed(offset: newValue.selection.end + 1,),
            );
          }
        }

        if(sample[newValue.text.length-1] == ')' ){
          return TextEditingValue(
            text: '${oldValue.text}) ${newValue.text.substring(newValue.text.length -1)}',
            selection: TextSelection.collapsed(offset: newValue.selection.end +2 ,),
          );
        }
      }
    }
    throw UnimplementedError();
  }

}