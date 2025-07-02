import 'package:flutter/material.dart';

class CommonTextFormFieldWidget {
  static Widget commanTextFormField({
    TextEditingController? controller, // Controls the text being edited
    bool? focus, // Determines whether the field should be auto-focused
    dynamic viewModel, // ViewModel to handle error removal and interaction
    String? lableText, // Label text for the form field
    String? hintText, // Hint text displayed inside the form field
    String? helperBlankText, // Helper text displayed below the form field
    bool? passwordLook, // Hides text if it's a password field
    TextInputType? keyType, // Type of keyboard for email or text input
    TextAlign? textAlignmentValue, // Aligns the text within the form field
    Color? color, // Background color of the form field
    Color? textColor, // Text color of the input
    Color? hintColor, // Color of the hint text
    Color? borderColor, // Border color of the form field
    int? maxLength, // Max length of the input text
    int? maxLines, // Max number of lines in the text field
    int? minLines, // Min number of lines in the text field
    bool? read, // Determines if the field is read-only
    bool? copyPaste, // Allows/disallows copy-paste interaction
    bool? prefix, // Determines if a prefix icon should be displayed
    bool? suffix,
    double? borderRadius, // The corner radius of the field's border
    double? hintFontSize, // Font size of the hint text
    double? paddingLeft, // Left padding for the input text
    double? paddingTop, // Top padding for the input text
    double? paddingRight, // Right padding for the input text
    double? paddingBottom, // Bottom padding for the input text
    IconData? icon, // Icon to display inside the field
    IconData? suffixIcon,
    Color? iconColor,
    Color? errorStyleColors,
    String? error, // Error message to be displayed
    FocusNode? focusNode,
    double? containerHeight,
    VoidCallback? onPressed,
    FormFieldValidator<String>?
        validator, // Manages focus state of the form field
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextFormField(
        controller: controller, // Text editing controller
        autofocus: focusNode != null
            ? focusNode.hasFocus
            : false, // Auto-focus handling
        focusNode: focusNode, // Focus node for managing focus state
        readOnly: read ?? false, // Makes field read-only if set
        enableInteractiveSelection:
            copyPaste, // Enables/disables text selection
        keyboardType: keyType, // Input type for keyboard (email, text, etc.)
        maxLines: maxLines ?? 1, // Max number of text lines
        minLines: minLines ?? 1, // Min number of text lines
        textAlign: textAlignmentValue ?? TextAlign.left, // Text alignment
        autocorrect: false, // Disables auto-correction
        enableSuggestions: false, // Disables text suggestions
        maxLength: maxLength ?? 100, // Max length of text input
        style: TextStyle(
            color: textColor ?? Colors.black), // Text style and color
        validator: validator,
        // The decoration for the input field
        decoration: InputDecoration(
          fillColor: color ?? Colors.transparent, // Background color
          filled: true, // Enables the background color fill
          contentPadding: EdgeInsets.only(
              left: paddingLeft ?? 10,
              top: paddingTop ?? 0,
              right: paddingRight ?? 15,
              bottom: paddingBottom ?? 0), // Padding inside the form field
          hintText: focusNode != null
              ? focusNode.hasFocus
                  ? "" // No hint if focused
                  : hintText // Display hint text if not focused
              : hintText,
          hintStyle: TextStyle(
              color: hintColor ?? Colors.grey, // Hint text color
              //fontFamily: StringResource.fontfamily, // Font family
              fontWeight: FontWeight.normal, // Font weight
              fontSize: hintFontSize ?? 13), // Font size of the hint text
          errorMaxLines: 3,
          helperText: helperBlankText, // Helper text
          helperStyle: const TextStyle(
              color: Colors.red, fontSize: 10), // Helper text style
          helperMaxLines: 3, // Maximum number of lines for helper text
          errorText: error?.isNotEmpty == true ? error : null,
          errorStyle: TextStyle(
            fontSize: 12,
            color: errorStyleColors ?? Colors.white,
          ),
          // Prefix icon (optional)
          prefixIcon: prefix == true
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(
                      50), // Circular border for prefix icon
                  child: Icon(
                    icon,
                    color: iconColor ?? Colors.white, // Icon color
                    size: 20, // Icon size
                  ))
              : null,
          suffixIcon: suffix == true
              ? IconButton(
                  icon: Icon(
                    color: iconColor ?? Colors.white,
                    passwordLook == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 20,
                  ),
                  onPressed:
                      onPressed, // Call the onPressed function to toggle visibility
                )
              : null,
          // Focused border styling
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ??
                    Colors.transparent), // Focused border color
            borderRadius: BorderRadius.circular(
                borderRadius ?? 0.0), // Border radius when focused
          ),
          // Enabled border styling
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ??
                    Colors.transparent), // Enabled border color
            borderRadius: BorderRadius.circular(
                borderRadius ?? 0.0), // Border radius when enabled
          ),
          // Error border styling
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    borderColor ?? Colors.transparent), // Error border color
            borderRadius: BorderRadius.circular(
                borderRadius ?? 0.0), // Border radius for error
          ),
          // Focused error border styling
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ??
                    Colors.transparent), // Focused error border color
            borderRadius: BorderRadius.circular(
                borderRadius ?? 0.0), // Border radius for focused error
          ),
          border: InputBorder.none, // No border by default
          // Disable the counter display
          counterText: '', // This removes the "10/100" counter from the UI
          counter: null, // Prevents the counter from being shown
        ),

        obscureText: passwordLook ?? false, // Hides text for password input
        onChanged: (value) {
          // viewModel.removeError(controller?.text
          //     .trim()
          //     .toString()); // Removes error when input changes
        },
      ),
    );
  }
}
