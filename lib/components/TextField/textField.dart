import 'package:flutter/material.dart';

Widget textField({
  required TextEditingController controller,
  required Color backgroundColor,
  Function(String)? onTextChanged,
  Function(String)? onSubmitted,
  String hintText = "",
  TextInputType keyboardType = TextInputType.text,
  TextInputAction imeActionType = TextInputAction.next,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 15.0,
  ),
  bool isFillColor = true,
  double borderRadius = 8.0,
  double cursorWidth = 2.0,
  Color cursorColor = Colors.black,
  bool showCursor = true,
  int maxLines = 1,
  int minLines = 1,
  TextAlign textAlign = TextAlign.start,
  bool autoCorrect = false,
  bool isEnable = true,
  double containerWidth = double.infinity,
  String? labelText,
  double labelFontSize = 14.0,
  Color labelFontColor = Colors.black,
  FontWeight labelFontWeight = FontWeight.w500,
  double contentGap = 6.0,
  EdgeInsets iconPadding =
      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  IconData? prefixIcon,
  Color? prefixIconColor = Colors.grey,
  double? prefixIconSize = 18.0,
  String? prefixImagePath,
  double prefixImageScale = 2.0,
  String? suffixImagePath,
  double suffixImageScale = 2.0,
  IconData? suffixIcon,
  Color? suffixIconColor = Colors.grey,
  double? suffixIconSize = 18.0,
  double fontSize = 18.0,
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.w500,
  bool showUnderlinedBorder = false,
  Color borderColor = Colors.grey,
  EdgeInsets containerPadding = const EdgeInsets.all(0.0),
  TextCapitalization textCapitalization = TextCapitalization.words,
}) {
  return Container(
    // color: Colors.red.shade100,
    padding: containerPadding,
    width: containerWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...[
          if (labelText != null)
            Text(
              labelText,
              style: TextStyle(
                fontSize: labelFontSize,
                color: labelFontColor,
                fontWeight: labelFontWeight,
              ),
            ),
          SizedBox(
            height: contentGap,
          ),
        ],
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: imeActionType,
          showCursor: showCursor,
          cursorColor: cursorColor,
          cursorWidth: cursorWidth,
          maxLines: maxLines,
          textAlign: textAlign,
          autocorrect: autoCorrect,
          enabled: isEnable,
          textCapitalization: textCapitalization,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Roboto',
            fontWeight: fontWeight,
            color: fontColor,
          ),
          minLines: minLines,
          onChanged: (value) {
            if (onTextChanged != null) {
              onTextChanged(value);
            }
          },
          onSubmitted: (value) {
            if (onSubmitted != null) {
              FocusManager.instance.primaryFocus?.unfocus();
              onSubmitted(value);
            }
          },
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      prefixIcon,
                      size: prefixIconSize,
                      color: prefixIconColor,
                    ),
                  )
                : prefixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          prefixImagePath,
                          scale: prefixImageScale,
                          // fit: BoxFit.con,
                        ),
                      )
                    : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      suffixIcon,
                      size: suffixIconSize,
                      color: suffixIconColor,
                    ),
                  )
                : suffixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          suffixImagePath,
                          scale: suffixImageScale,
                          // fit: BoxFit.con,
                        ),
                      )
                    : null,
            focusedBorder: showUnderlinedBorder
                ? UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor, strokeAlign: 1.0),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
            enabledBorder: showUnderlinedBorder
                ? UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor, strokeAlign: 1.0),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide.none,
                  ),
            hintText: hintText,
            contentPadding: contentPadding,
            filled: isFillColor,
            fillColor: backgroundColor,
          ),
        ),
      ],
    ),
  );
}

Widget otpBoxes({
  required List<TextEditingController> controllers,
  double containerWidth = 50.0,
  double containerHeight = 50.0,
  Color containerBgColor = Colors.deepPurple,
  double containerBorderRadius = 10.0,
  TextAlign textAlign = TextAlign.center,
  TextInputType keyboardType = TextInputType.number,
  int maxLength = 1,
  double fontSize = 24.0,
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.w500,
  required Function(List<String>) onSubmitted,
  TextCapitalization textCapitalization = TextCapitalization.words,
}) {
  void handleEditingComplete() {
    List<String> otpValues =
        controllers.map((controller) => controller.text).toList();
    onSubmitted(otpValues);
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(
      controllers.length,
      (index) {
        return Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: containerBgColor,
            borderRadius: BorderRadius.all(
              Radius.circular(containerBorderRadius),
            ),
          ),
          child: Center(
            child: TextField(
              controller: controllers[index],
              textAlign: textAlign,
              keyboardType: keyboardType,
              textInputAction: index == controllers.length - 1
                  ? TextInputAction.done
                  : TextInputAction.next,
              maxLength: maxLength,
              textCapitalization: textCapitalization,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'Roboto',
                fontWeight: fontWeight,
                color: fontColor,
              ),
              decoration: const InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(0),
              ),
              onEditingComplete: () {
                if (index == controllers.length - 1) {
                  handleEditingComplete();
                  FocusManager.instance.primaryFocus?.unfocus();
                } else {
                  FocusManager.instance.primaryFocus?.nextFocus();
                }
              },
            ),
          ),
        );
      },
    ),
  );
}

Widget outlinedTextField({
  required TextEditingController controller,
  Color backgroundColor = Colors.transparent,
  Function(String)? onTextChanged,
  Function(String)? onSubmitted,
  String hintText = "",
  TextInputType keyboardType = TextInputType.text,
  TextInputAction imeActionType = TextInputAction.next,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 15.0,
  ),
  bool isFillColor = true,
  double borderRadius = 8.0,
  double cursorWidth = 2.0,
  Color cursorColor = Colors.black,
  bool showCursor = true,
  int maxLines = 1,
  int minLines = 1,
  TextAlign textAlign = TextAlign.start,
  Color borderColor = Colors.black,
  double borderWidth = 1.0,
  bool autoCorrect = false,
  TextCapitalization textCapitalization = TextCapitalization.words,
  bool isEnable = true,
  double containerWidth = double.infinity,
  String? labelText = "",
  double labelFontSize = 14.0,
  Color labelFontColor = Colors.black,
  FontWeight labelFontWeight = FontWeight.w500,
  double contentGap = 6.0,
  EdgeInsets iconPadding =
      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  IconData? prefixIcon,
  Color? prefixIconColor = Colors.grey,
  double? prefixIconSize = 18.0,
  String? prefixImagePath,
  double prefixImageScale = 2.0,
  String? suffixImagePath,
  double suffixImageScale = 2.0,
  IconData? suffixIcon,
  Color? suffixIconColor = Colors.grey,
  double? suffixIconSize = 18.0,
  double fontSize = 18.0,
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return SizedBox(
    width: containerWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText,
            style: TextStyle(
              fontSize: labelFontSize,
              color: labelFontColor,
              fontWeight: labelFontWeight,
            ),
          ),
        SizedBox(
          height: contentGap,
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: imeActionType,
          showCursor: showCursor,
          cursorColor: cursorColor,
          cursorWidth: cursorWidth,
          maxLines: maxLines,
          textAlign: textAlign,
          textCapitalization: textCapitalization,
          autocorrect: autoCorrect,
          enabled: isEnable,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Roboto',
            fontWeight: fontWeight,
            color: fontColor,
          ),
          minLines: minLines,
          onChanged: (value) {
            if (onTextChanged != null) {
              onTextChanged(value);
            }
          },
          onSubmitted: (value) {
            if (onSubmitted != null) {
              FocusManager.instance.primaryFocus?.unfocus();
              onSubmitted(value);
            }
          },
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      prefixIcon,
                      size: prefixIconSize,
                      color: prefixIconColor,
                    ),
                  )
                : prefixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          prefixImagePath,
                          scale: prefixImageScale,
                        ),
                      )
                    : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      suffixIcon,
                      size: suffixIconSize,
                      color: suffixIconColor,
                    ),
                  )
                : suffixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          suffixImagePath,
                          scale: suffixImageScale,
                        ),
                      )
                    : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            ),
            hintText: hintText,
            contentPadding: contentPadding,
            filled: isFillColor,
            fillColor: backgroundColor,
          ),
        ),
      ],
    ),
  );
}

Widget obscureOutlinedTextField({
  required TextEditingController controller,
  Color backgroundColor = Colors.transparent,
  Function(String)? onTextChanged,
  Function(String)? onSubmitted,
  String hintText = "",
  TextInputType keyboardType = TextInputType.text,
  TextInputAction imeActionType = TextInputAction.next,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 15.0,
  ),
  bool isFillColor = true,
  double borderRadius = 8.0,
  double cursorWidth = 2.0,
  Color cursorColor = Colors.black,
  bool showCursor = true,
  bool secureText = false,
  int maxLines = 1,
  int minLines = 1,
  TextAlign textAlign = TextAlign.start,
  Color borderColor = Colors.black,
  double borderWidth = 1.0,
  bool autoCorrect = false,
  bool isEnable = true,
  double containerWidth = double.infinity,
  String? labelText = "ds",
  double labelFontSize = 14.0,
  Color labelFontColor = Colors.black,
  FontWeight labelFontWeight = FontWeight.w500,
  double contentGap = 6.0,
  String obscuringCharacter = "•",
  EdgeInsets iconPadding =
      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  IconData? prefixIcon,
  Color? prefixIconColor = Colors.grey,
  double? prefixIconSize = 18.0,
  String? prefixImagePath,
  double prefixImageScale = 2.0,
  String? suffixImagePath,
  double suffixImageScale = 2.0,
  IconData? suffixIcon,
  Color? suffixIconColor = Colors.grey,
  double? suffixIconSize = 18.0,
  double fontSize = 18.0,
  TextCapitalization textCapitalization = TextCapitalization.words,
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return SizedBox(
    width: containerWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText,
            style: TextStyle(
              fontSize: labelFontSize,
              color: labelFontColor,
              fontWeight: labelFontWeight,
            ),
          ),
        SizedBox(
          height: contentGap,
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: imeActionType,
          showCursor: showCursor,
          cursorColor: cursorColor,
          cursorWidth: cursorWidth,
          textCapitalization: textCapitalization,
          obscureText: secureText,
          obscuringCharacter: obscuringCharacter,
          maxLines: maxLines,
          textAlign: textAlign,
          autocorrect: autoCorrect,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Roboto',
            fontWeight: fontWeight,
            color: fontColor,
          ),
          enabled: isEnable,
          minLines: minLines,
          onChanged: (value) {
            if (onTextChanged != null) {
              onTextChanged(value);
            }
          },
          onSubmitted: (value) {
            if (onSubmitted != null) {
              FocusManager.instance.primaryFocus?.unfocus();
              onSubmitted(value);
            }
          },
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      prefixIcon,
                      size: prefixIconSize,
                      color: prefixIconColor,
                    ),
                  )
                : prefixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          prefixImagePath,
                          scale: prefixImageScale,
// fit: BoxFit.con,
                        ),
                      )
                    : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      suffixIcon,
                      size: suffixIconSize,
                      color: suffixIconColor,
                    ),
                  )
                : suffixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          suffixImagePath,
                          scale: suffixImageScale,
// fit: BoxFit.con,
                        ),
                      )
                    : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            ),
            hintText: hintText,
            contentPadding: contentPadding,
            filled: isFillColor,
            fillColor: backgroundColor,
          ),
        ),
      ],
    ),
  );
}

Widget obscureTextField({
  required TextEditingController controller,
  required Color backgroundColor,
  Function(String)? onTextChanged,
  Function(String)? onSubmitted,
  Function? onSuffixIconClick,
  String hintText = "",
  TextInputType keyboardType = TextInputType.text,
  TextInputAction imeActionType = TextInputAction.next,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 15.0,
  ),
  bool isFillColor = true,
  double borderRadius = 8.0,
  double cursorWidth = 2.0,
  Color cursorColor = Colors.black,
  bool showCursor = true,
  bool secureText = false,
  int maxLines = 1,
  int minLines = 1,
  TextAlign textAlign = TextAlign.start,
  bool autoCorrect = false,
  bool isEnable = true,
  double containerWidth = double.infinity,
  String? labelText = "",
  double labelFontSize = 14.0,
  TextCapitalization textCapitalization = TextCapitalization.words,
  Color labelFontColor = Colors.black,
  FontWeight labelFontWeight = FontWeight.w500,
  double contentGap = 6.0,
  String obscuringCharacter = "•",
  EdgeInsets iconPadding =
      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  IconData? prefixIcon,
  Color? prefixIconColor = Colors.grey,
  double? prefixIconSize = 18.0,
  String? prefixImagePath,
  double prefixImageScale = 2.0,
  String? suffixImagePath,
  double suffixImageScale = 2.0,
  IconData? suffixIcon,
  Color? suffixIconColor = Colors.grey,
  double? suffixIconSize = 18.0,
  double fontSize = 18.0,
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.w500,
  EdgeInsets containerPadding = const EdgeInsets.all(0.0),
}) {
  return Container(
    padding: containerPadding,
    width: containerWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...[
          if (labelText != null)
            Text(
              labelText,
              style: TextStyle(
                fontSize: labelFontSize,
                color: labelFontColor,
                fontWeight: labelFontWeight,
              ),
            ),
          SizedBox(
            height: contentGap,
          ),
        ],
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: imeActionType,
          showCursor: showCursor,
          cursorColor: cursorColor,
          cursorWidth: cursorWidth,
          obscureText: secureText,
          obscuringCharacter: obscuringCharacter,
          maxLines: maxLines,
          textCapitalization: textCapitalization,
          textAlign: textAlign,
          autocorrect: autoCorrect,
          enabled: isEnable,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Roboto',
            fontWeight: fontWeight,
            color: fontColor,
          ),
          minLines: minLines,
          onChanged: (value) {
            if (onTextChanged != null) {
              onTextChanged(value);
            }
          },
          onSubmitted: (value) {
            if (onSubmitted != null) {
              FocusManager.instance.primaryFocus?.unfocus();
              onSubmitted(value);
            }
          },
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      prefixIcon,
                      size: prefixIconSize,
                      color: prefixIconColor,
                    ),
                  )
                : prefixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          prefixImagePath,
                          scale: prefixImageScale,
// fit: BoxFit.con,
                        ),
                      )
                    : null,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: () {
                      if (onSuffixIconClick != null) {
                        onSuffixIconClick();
                      }
                    },
                    child: Padding(
                      padding: iconPadding,
                      child: Icon(
                        suffixIcon,
                        size: suffixIconSize,
                        color: suffixIconColor,
                      ),
                    ),
                  )
                : suffixImagePath != null
                    ? GestureDetector(
                        onTap: () {
                          if (onSuffixIconClick != null) {
                            onSuffixIconClick();
                          }
                        },
                        child: Padding(
                          padding: iconPadding,
                          child: Image.asset(
                            suffixImagePath,
                            scale: suffixImageScale,
// fit: BoxFit.con,
                          ),
                        ),
                      )
                    : null,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            contentPadding: contentPadding,
            filled: isFillColor,
            fillColor: backgroundColor,
          ),
        ),
      ],
    ),
  );
}

Widget dropDownTextField({
  required List<dynamic> items,
  required String selectedValue,
  required Function(Object?) onValueChange,
  EdgeInsets iconPadding =
      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  IconData? prefixIcon,
  Color? prefixIconColor = Colors.grey,
  double? prefixIconSize = 18.0,
  String? prefixImagePath,
  double prefixImageScale = 2.0,
  String? suffixImagePath,
  double suffixImageScale = 2.0,
  IconData? suffixIcon,
  Color? suffixIconColor = Colors.grey,
  double? suffixIconSize = 18.0,
  TextAlign textAlign = TextAlign.start,
  bool showBorder = false,
  Color borderColor = Colors.black,
  double borderWidth = 1.0,
  double borderRadius = 8.0,
  EdgeInsets contentPadding =
      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
  Color backgroundColor = Colors.black12,
  EdgeInsets menuContainerMargin =
      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  EdgeInsets menuContainerPadding =
      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  double menuItemFontSize = 14.0,
  Color menuItemFontColor = Colors.black,
  FontWeight menuItemFontWeight = FontWeight.w500,
  bool enableFeedback = false,
  Color menuBackgroundColor = Colors.limeAccent,
  String hintText = "Select option",
  int hintFontMaxLine = 1,
  TextOverflow hintFontOverflow = TextOverflow.ellipsis,
  TextAlign hintTextAlign = TextAlign.start,
  double hintFontSize = 14.0,
  FontWeight hintFontWeight = FontWeight.w500,
  Color hintFontColor = Colors.black,
}) {
  return FormField<String>(
    builder: (FormFieldState<String> state) {
      return InputDecorator(
        textAlign: textAlign,
        isEmpty: true,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: iconPadding,
                  child: Icon(
                    prefixIcon,
                    size: prefixIconSize,
                    color: prefixIconColor,
                  ),
                )
              : prefixImagePath != null
                  ? Padding(
                      padding: iconPadding,
                      child: Image.asset(
                        prefixImagePath,
                        scale: prefixImageScale,
// fit: BoxFit.con,
                      ),
                    )
                  : null,
          focusedBorder: OutlineInputBorder(
            borderSide: showBorder
                ? BorderSide(
                    color: borderColor,
                    width: borderWidth,
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: showBorder
                ? BorderSide(
                    color: borderColor,
                    width: borderWidth,
                  )
                : BorderSide.none,
          ),
          contentPadding: contentPadding,
          filled: true,
          fillColor: backgroundColor,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            elevation: 9,
            icon: suffixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      suffixIcon,
                      size: suffixIconSize,
                      color: suffixIconColor,
                    ),
                  )
                : suffixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          suffixImagePath,
                          scale: suffixImageScale,
                        ),
                      )
                    : null,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontFamily: "verdana_regular",
            ),
            items: items.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: menuContainerMargin,
                  padding: menuContainerPadding,
                  color: menuBackgroundColor,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: menuItemFontSize,
                      fontWeight: menuItemFontWeight,
                      color: menuItemFontColor,
                    ),
                  ),
                ),
              );
            }).toList(),
            hint: Text(
              hintText,
              maxLines: hintFontMaxLine,
              overflow: hintFontOverflow,
              softWrap: true,
              textAlign: hintTextAlign,
              style: TextStyle(
                fontSize: hintFontSize,
                fontWeight: hintFontWeight,
                color: hintFontColor,
              ),
            ),
            isExpanded: true,
            isDense: true,
            enableFeedback: enableFeedback,
            dropdownColor: menuBackgroundColor,
            onChanged: (value) {
              onValueChange(value);
            },
            value: null,
          ),
        ),
      );
    },
  );
}

Widget multiLineTextField({
  required TextEditingController controller,
  required Color backgroundColor,
  Function(String)? onTextChanged,
  Function(String)? onSubmitted,
  String hintText = "",
  TextInputType keyboardType = TextInputType.text,
  TextInputAction imeActionType = TextInputAction.next,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 15.0,
  ),
  bool isFillColor = true,
  double borderRadius = 8.0,
  double cursorWidth = 2.0,
  Color cursorColor = Colors.black,
  bool showCursor = true,
  int maxLines = 5,
  int minLines = 1,
  TextAlign textAlign = TextAlign.start,
  bool autoCorrect = false,
  bool isEnable = true,
  double containerWidth = double.infinity,
  String? labelText,
  double labelFontSize = 14.0,
  Color labelFontColor = Colors.black,
  FontWeight labelFontWeight = FontWeight.w500,
  double contentGap = 6.0,
  EdgeInsets iconPadding =
      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  IconData? prefixIcon,
  Color? prefixIconColor = Colors.grey,
  double? prefixIconSize = 18.0,
  String? prefixImagePath,
  double prefixImageScale = 2.0,
  String? suffixImagePath,
  double suffixImageScale = 2.0,
  IconData? suffixIcon,
  Color? suffixIconColor = Colors.grey,
  double? suffixIconSize = 18.0,
  double fontSize = 18.0,
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.w500,
  bool showUnderlinedBorder = false,
  Color borderColor = Colors.grey,
  EdgeInsets containerPadding = const EdgeInsets.all(0.0),
  TextCapitalization textCapitalization = TextCapitalization.words,
}) {
  return Container(
    padding: containerPadding,
    width: containerWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText,
            style: TextStyle(
              fontSize: labelFontSize,
              color: labelFontColor,
              fontWeight: labelFontWeight,
            ),
          ),
        SizedBox(
          height: contentGap,
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: imeActionType,
          showCursor: showCursor,
          cursorColor: cursorColor,
          cursorWidth: cursorWidth,
          maxLines: maxLines,
          // Allowing the TextField to support multiple lines
          minLines: minLines,
          // Minimum number of lines
          textAlign: textAlign,
          autocorrect: autoCorrect,
          enabled: isEnable,
          textCapitalization: textCapitalization,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Roboto',
            fontWeight: fontWeight,
            color: fontColor,
          ),
          onChanged: (value) {
            if (onTextChanged != null) {
              onTextChanged(value);
            }
          },
          onSubmitted: (value) {
            if (onSubmitted != null) {
              FocusManager.instance.primaryFocus?.unfocus();
              onSubmitted(value);
            }
          },
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      prefixIcon,
                      size: prefixIconSize,
                      color: prefixIconColor,
                    ),
                  )
                : prefixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          prefixImagePath,
                          scale: prefixImageScale,
                        ),
                      )
                    : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: iconPadding,
                    child: Icon(
                      suffixIcon,
                      size: suffixIconSize,
                      color: suffixIconColor,
                    ),
                  )
                : suffixImagePath != null
                    ? Padding(
                        padding: iconPadding,
                        child: Image.asset(
                          suffixImagePath,
                          scale: suffixImageScale,
                        ),
                      )
                    : null,
            focusedBorder: showUnderlinedBorder
                ? UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor, strokeAlign: 1.0),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
            enabledBorder: showUnderlinedBorder
                ? UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor, strokeAlign: 1.0),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide.none,
                  ),
            hintText: hintText,
            contentPadding: contentPadding,
            filled: isFillColor,
            fillColor: backgroundColor,
          ),
        ),
      ],
    ),
  );
}

Widget outlinedTextFieldWithSuffixIcon({
  required TextEditingController controller,
  Color backgroundColor = Colors.transparent,
  Function(String)? onTextChanged,
  Function(String)? onSubmitted,
  String hintText = "",
  TextInputType keyboardType = TextInputType.text,
  TextInputAction imeActionType = TextInputAction.next,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 15.0,
  ),
  bool isFillColor = true,
  double borderRadius = 8.0,
  double cursorWidth = 2.0,
  Color cursorColor = Colors.black,
  bool showCursor = true,
  int maxLines = 1,
  int minLines = 1,
  TextAlign textAlign = TextAlign.start,
  Color borderColor = Colors.black,
  double borderWidth = 1.0,
  bool autoCorrect = false,
  TextCapitalization textCapitalization = TextCapitalization.words,
  bool isEnable = true,
  double containerWidth = double.infinity,
  String? labelText = "",
  double labelFontSize = 14.0,
  Color labelFontColor = Colors.black,
  FontWeight labelFontWeight = FontWeight.w500,
  double contentGap = 6.0,
  EdgeInsets iconPadding =
  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  IconData? prefixIcon,
  Color? prefixIconColor = Colors.grey,
  double? prefixIconSize = 18.0,
  String? prefixImagePath,
  double prefixImageScale = 2.0,
  String? suffixImagePath,
  double suffixImageScale = 2.0,
  required IconData suffixIcon,
  Color? suffixIconColor = Colors.grey,
  double? suffixIconSize = 18.0,
  double fontSize = 18.0,
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.w500,
  bool secureText = false,
  required Function onSuffixAction,
})
{
  return SizedBox(
    width: containerWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText,
            style: TextStyle(
              fontSize: labelFontSize,
              color: labelFontColor,
              fontWeight: labelFontWeight,
            ),
          ),
        SizedBox(
          height: contentGap,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  textInputAction: imeActionType,
                  showCursor: showCursor,
                  cursorColor: cursorColor,
                  cursorWidth: cursorWidth,
                  maxLines: maxLines,
                  textAlign: textAlign,
                  textCapitalization: textCapitalization,
                  autocorrect: autoCorrect,
                  enabled: isEnable,
                  obscureText: secureText,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Roboto',
                    fontWeight: fontWeight,
                    color: fontColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  minLines: minLines,
                  onChanged: (value) {
                    if (onTextChanged != null) {
                      onTextChanged(value);
                    }
                  },
                  onSubmitted: (value) {
                    if (onSubmitted != null) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      onSubmitted(value);
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    contentPadding: contentPadding,
                    filled: isFillColor,
                    fillColor: backgroundColor,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  onSuffixAction();
                },
                icon: suffixImagePath != null
                    ? Padding(
                  padding: iconPadding,
                  child: Image.asset(
                    suffixImagePath,
                    scale: suffixImageScale,
                    // fit: BoxFit.con,
                  ),
                )
                    : Padding(
                  padding: iconPadding,
                  child: Icon(
                    suffixIcon,
                    size: suffixIconSize,
                    color: suffixIconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
