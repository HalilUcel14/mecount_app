import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import 'Icon_logo.dart';

class SpecialTextFormField extends StatefulWidget {
  const SpecialTextFormField({
    Key? key,
    this.contentPadding,
    this.defaultHeight = 100,
    this.labelText = 'labelText',
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.onSaved,
    this.onChanged,
    this.validator,
    required this.logoIconName,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.focusNode,
    this.rightWidget,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final double defaultHeight;
  final String labelText;
  final bool obscureText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? rightWidget;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String logoIconName;
  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  State<SpecialTextFormField> createState() => _SpecialTextFormFieldState();
}

class _SpecialTextFormFieldState extends State<SpecialTextFormField> {
  late bool obscureTexted;

  @override
  void initState() {
    obscureTexted = widget.obscureText;
    super.initState();
  }

  void changeObscure() {
    obscureTexted = !obscureTexted;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          height: widget.defaultHeight * 0.55,
          width: double.infinity > 500 ? 500 : double.infinity,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: widget.focusNode,
                  keyboardType: widget.keyboardType,
                  controller: widget.controller,
                  onSaved: widget.onSaved,
                  onChanged: widget.onChanged,
                  obscureText: obscureTexted,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    contentPadding: widget.contentPadding ??
                        EdgeInsets.only(left: widget.defaultHeight * 1),
                    labelText: widget.labelText,
                    labelStyle: widget.labelStyle,
                    hintText: widget.hintText,
                    hintStyle: widget.hintStyle,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: _outlinedBorder(context),
                    errorBorder: _outlinedBorder(context),
                    focusedErrorBorder: _outlinedBorder(context),
                    disabledBorder: _outlinedBorder(context),
                    enabledBorder: _outlinedBorder(context),
                    focusedBorder: _outlinedBorder(context),
                  ),
                ),
              ),
              widget.rightWidget ?? const SizedBox.shrink(),
            ],
          ),
          // Container Text Form Decoration
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              context.dynamicShortSize(0.1),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: context.dynamicShortSize(0.04),
                offset: const Offset(1, -1),
                blurStyle: BlurStyle.solid,
                color: Colors.grey,
              ),
              BoxShadow(
                blurRadius: context.dynamicShortSize(0.04),
                offset: const Offset(-1, 1),
                blurStyle: BlurStyle.solid,
                color: Colors.grey,
              ),
            ],
          ),
        ),

        ///
        /// Logo
        ///

        InkWell(
          onTap: () => changeObscure(),
          child: IconsLogo.sgv(
            size: widget.defaultHeight * 0.85,
            color: obscureTexted ? Colors.red : Colors.blue,
            logoIconName: widget.logoIconName,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _outlinedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.dynamicShortSize(0.1)),
      borderSide: const BorderSide(
        color: Colors.transparent,
        style: BorderStyle.solid,
      ),
      gapPadding: 20,
    );
  }
}



























// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class SpecialTextFormField extends Stack {
//   SpecialTextFormField.user({
//     Key? stackKey,
//     AlignmentGeometry stackAlignment = AlignmentDirectional.centerStart,
//     TextDirection? stackTextDirection,
//     StackFit stackFit = StackFit.loose,
//     Clip stackClipBehavior = Clip.hardEdge,
//     //
//     // Container
//     //
//     Key? cKey,
//     AlignmentGeometry? cAlignment,
//     EdgeInsetsGeometry? cPadding,
//     Color? cColor,
//     Decoration? cDecoration,
//     Decoration? cForegroundDecoration,
//     double? cWidth,
//     double? cHeight,
//     BoxConstraints? cConstraints,
//     EdgeInsetsGeometry? cMargin,
//     Matrix4? cTransform,
//     AlignmentGeometry? cTransformAlignment,
//     Clip cClipBehavior = Clip.none,
//     //
//     // TextFormField
//     //
//     Key? key,
//     TextEditingController? controller,
//     String? initialValue,
//     FocusNode? focusNode,
//     InputDecoration? decoration = const InputDecoration(),
//     TextInputType? keyboardType,
//     TextCapitalization textCapitalization = TextCapitalization.none,
//     TextInputAction? textInputAction,
//     TextStyle? style,
//     StrutStyle? strutStyle,
//     TextDirection? textDirection,
//     TextAlign textAlign = TextAlign.start,
//     TextAlignVertical? textAlignVertical,
//     bool autofocus = false,
//     bool readOnly = false,
//     ToolbarOptions? toolbarOptions,
//     bool? showCursor,
//     String obscuringCharacter = '•',
//     bool obscureText = false,
//     bool autocorrect = true,
//     SmartDashesType? smartDashesType,
//     SmartQuotesType? smartQuotesType,
//     bool enableSuggestions = true,
//     int? maxLines = 1,
//     int? minLines,
//     bool expands = false,
//     int? maxLength,
//     void Function(String)? onChanged,
//     void Function()? onTap,
//     void Function()? onEditingComplete,
//     void Function(String)? onFieldSubmitted,
//     void Function(String?)? onSaved,
//     String? Function(String?)? validator,
//     bool? enabled,
//     double cursorWidth = 2.0,
//     double? cursorHeight,
//     Radius? cursorRadius,
//     Color? cursorColor,
//     Brightness? keyboardAppearance,
//     EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
//     bool? enableInteractiveSelection,
//     TextSelectionControls? selectionControls,
//     Widget? Function(BuildContext,
//             {required int currentLength,
//             required bool isFocused,
//             required int? maxLength})?
//         buildCounter,
//     ScrollPhysics? scrollPhysics,
//     Iterable<String>? autofillHints,
//     AutovalidateMode? autovalidateMode,
//     ScrollController? scrollController,
//     List<TextInputFormatter>? inputFormatters,
//     String? restorationId,
//     bool enableIMEPersonalizedLearning = true,
//     MaxLengthEnforcement? maxLengthEnforcement,
//     MouseCursor? mouseCursor,
//   }) : super(
//           key: stackKey,
//           children: [
//             Container(
//               key: cKey,
//               alignment: cAlignment,
//               padding: cPadding,
//               margin: cMargin,
//               color: cColor,
//               decoration: cDecoration,
//               foregroundDecoration: cForegroundDecoration,
//               width: cWidth,
//               height: cHeight,
//               constraints: cConstraints,
//               transform: cTransform,
//               transformAlignment: cTransformAlignment,
//               clipBehavior: cClipBehavior,
//               child: TextFormField(
//                 autocorrect: autocorrect,
//                 autofillHints: autofillHints,
//                 autofocus: autofocus,
//                 autovalidateMode: autovalidateMode,
//                 buildCounter: buildCounter,
//                 controller: controller,
//                 cursorColor: cursorColor,
//                 cursorHeight: cursorHeight,
//                 cursorRadius: cursorRadius,
//                 cursorWidth: cursorWidth,
//                 decoration: decoration,
//                 enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
//                 enableInteractiveSelection: enableInteractiveSelection,
//                 enableSuggestions: enableSuggestions,
//                 enabled: enabled,
//                 expands: expands,
//                 focusNode: focusNode,
//                 initialValue: initialValue,
//                 inputFormatters: inputFormatters,
//                 key: key,
//                 keyboardAppearance: keyboardAppearance,
//                 keyboardType: keyboardType,
//                 maxLength: maxLength,
//                 maxLengthEnforcement: maxLengthEnforcement,
//                 maxLines: maxLines,
//                 minLines: minLines,
//                 mouseCursor: mouseCursor,
//                 obscureText: obscureText,
//                 obscuringCharacter: obscuringCharacter,
//                 onChanged: onChanged,
//                 onEditingComplete: onEditingComplete,
//                 onFieldSubmitted: onFieldSubmitted,
//                 onSaved: onSaved,
//                 onTap: onTap,
//                 readOnly: readOnly,
//                 restorationId: restorationId,
//                 scrollController: scrollController,
//                 scrollPadding: scrollPadding,
//                 scrollPhysics: scrollPhysics,
//                 selectionControls: selectionControls,
//                 showCursor: showCursor,
//                 smartDashesType: smartDashesType,
//                 smartQuotesType: smartQuotesType,
//                 strutStyle: strutStyle,
//                 style: style,
//                 textAlign: textAlign,
//                 textAlignVertical: textAlignVertical,
//                 textCapitalization: textCapitalization,
//                 textDirection: textDirection,
//                 textInputAction: textInputAction,
//                 toolbarOptions: toolbarOptions,
//                 validator: validator,
//               ),
//             ),
//             Container(

//             ),
//           ],
//         );
// }
