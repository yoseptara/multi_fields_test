import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final fieldsKey = [
    GlobalKey<FormFieldState>(),
    GlobalKey<FormFieldState>(),
    GlobalKey<FormFieldState>(),
    GlobalKey<FormFieldState>(),
  ];

  final ValueNotifier<bool> isFormValidated = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FormBuilder(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(
                fieldKey: fieldsKey[0],
                borderIdeal: const Color(0xffe1e7ea),
                onChange: (_) => isValid(),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'required field';
                  }

                  return null;
                },
              ),
              InputField(
                fieldKey: fieldsKey[1],
                borderIdeal: const Color(0xffe1e7ea),
                onChange: (_) => isValid(),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'required field';
                  }

                  return null;
                },
              ),
              InputField(
                fieldKey: fieldsKey[2],
                borderIdeal: const Color(0xffe1e7ea),
                onChange: (_) => isValid(),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'required field';
                  }

                  return null;
                },
              ),
              InputField(
                fieldKey: fieldsKey[3],
                borderIdeal: const Color(0xffe1e7ea),
                onChange: (_) => isValid(),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'required field';
                  }

                  return null;
                },
              ),
              ValueListenableBuilder<bool>(
                  valueListenable: isFormValidated,
                  builder: (context, value, __) {
                    return TextButton(
                      style: TextButton.styleFrom(backgroundColor: isFormValidated.value ? Colors.black : Colors.grey.shade200),
                      onPressed: isFormValidated.value ? () {} : null,
                      child: Text(
                        isFormValidated.value ? 'Can continue' : 'Cannot continue',
                        style: TextStyle(
                          color: isFormValidated.value ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  bool isFieldsValid() {
    return fieldsKey.every((key) {
      final isValid = key.currentState?.isValid;
      if (isValid != null && isValid) {
        return true;
      }

      return false;
    });
  }

  bool isFormValid() {
    return formKey.currentState?.isValid ?? false;
  }

  void isValid() {
    isFormValidated.value = isFieldsValid();
    // isFormValidated.value = isFormValid();
  }
}

class InputField extends StatefulWidget {
  final GlobalKey<FormFieldState>? fieldKey;
  final TextEditingController? textFieldController;
  final Color? textFieldBgColor;
  final Color? borderHighlight;
  final double? borderHeight;
  final Color borderIdeal;
  final Color? borderError;
  final Color? iconColor;
  final TextStyle? textErrorStyle;
  final TextStyle? textContentStyle;
  final TextStyle? textHintLabelStyle;
  final TextStyle? textCounterStyle;
  final String? initialValue;
  final String? label;
  final Widget? iconSuffix;
  final String? errorPrompt;
  final int? inputLimit;
  final bool? showLengthCounter;
  final int minimumInputAllowed;
  final bool? textUpperCase;
  final bool? textNameCase;
  final bool? textSentenceCase;
  final String? regex;
  final bool forSearch;
  final bool obscureText;
  final String? obscureCharacter;
  final bool keepSuffixIcon;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final bool shouldValidate;
  final bool? autoFocus;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final Function(String? text)? onChange;
  final void Function(String? text)? onSaved;
  final Function(String? text)? onSubmitted;
  final Widget? iconPrefix;
  final bool showLabel;
  final Widget? trailingIcon;

  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;
  final BoxConstraints? suffixIconConstraints;
  final AutovalidateMode? autovalidateMode;

  /// return [errorMsg] when have error, or [null] if no error
  final String? Function(String? text)? validator;
  final bool? isErrorFromRes;

  const InputField({
    super.key,
    this.fieldKey,
    this.textFieldController,
    this.borderHighlight,
    this.borderHeight,
    required this.borderIdeal,
    this.initialValue,
    this.label,
    this.borderError,
    this.errorPrompt,
    this.inputLimit,
    this.showLengthCounter,
    this.textUpperCase,
    this.textNameCase,
    this.textSentenceCase,
    this.regex,
    this.obscureText = false,
    this.obscureCharacter,
    this.textErrorStyle,
    this.forSearch = false,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onChange,
    this.onSaved,
    this.iconSuffix,
    this.textFieldBgColor,
    this.textContentStyle,
    this.textHintLabelStyle,
    this.textCounterStyle,
    this.minimumInputAllowed = 1,
    this.padding,
    this.shouldValidate = true,
    this.autovalidateMode,
    this.validator,
    this.keepSuffixIcon = false,
    this.onSubmitted,
    this.autoFocus,
    this.focusNode,
    this.textInputAction = TextInputAction.unspecified,
    this.iconPrefix,
    this.showLabel = true,
    this.inputFormatter,
    this.keyboardType,
    this.suffixIconConstraints,
    this.isErrorFromRes,
    this.iconColor,
    this.trailingIcon,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late _TextFormNotifier state;

  @override
  void initState() {
    super.initState();
    final errorMsg = widget.isErrorFromRes == true ? '' : null;
    state = _TextFormNotifier(
      state: _TextFormState(
        errorMessage: errorMsg,
        currentLength: widget.textFieldController?.text.length ??
            widget.initialValue?.length,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant InputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isErrorFromRes == true) {
      state.value = state.value.copyWith(
        errorMessage: '',
      );
    }
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: state,
          builder: (context, value, child) {
            return Container(
              padding: widget.forSearch
                  ? widget.padding ??
                  const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 5)
                  : widget.padding ??
                  const EdgeInsets.only(
                      left: 15, right: 15, top: 0, bottom: 0),
              decoration: BoxDecoration(
                color: widget.textFieldBgColor,
                border: Border.all(
                    color: _getBorderColor(value) ?? widget.borderIdeal,
                    width: widget.borderHeight ?? 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Focus(
                onFocusChange: ((focus) {
                  state.value = state.value.copyWith(
                    isFocused: focus,
                  );
                }),
                child: child ?? const SizedBox(),
              ),
            );
          },
          child: Row(
            children: [
              Expanded(
                // child: FormBuilderTextField(
                //   name:
                //       '${DateTime.now().microsecondsSinceEpoch.toString()}-${widget.label ?? ''}',
                //   initialValue: widget.initialValue,
                //   keyboardType: widget.keyboardType,
                //   controller: widget.textFieldController,
                //   autofocus: widget.autoFocus ?? false,
                //   style: widget.textContentStyle,
                //   onTapOutside: (b) {
                //     FocusManager.instance.primaryFocus?.unfocus();
                //   },
                //   enabled: widget.enabled,
                //   readOnly: widget.readOnly,
                //   onTap: widget.onTap,
                //   obscureText: widget.obscureText,
                //   obscuringCharacter: widget.obscureCharacter ?? '•',
                //   textInputAction: widget.forSearch
                //       ? TextInputAction.search
                //       : widget.textInputAction,
                //   onSubmitted: (value) {
                //     if (widget.onSubmitted != null) {
                //       widget.onSubmitted!(value);
                //     }
                //   },
                //   textCapitalization: widget.textUpperCase != null &&
                //           widget.textUpperCase == true
                //       ? TextCapitalization.characters
                //       : widget.textNameCase != null &&
                //               widget.textNameCase == true
                //           ? TextCapitalization.words
                //           : widget.textSentenceCase != null &&
                //                   widget.textSentenceCase == true
                //               ? TextCapitalization.sentences
                //               : TextCapitalization.none,
                //   inputFormatters: widget.inputFormatter ??
                //       [
                //         FilteringTextInputFormatter.allow(
                //             RegExp(widget.regex ?? "[a-zA-Z0-9 ]")),
                //         LengthLimitingTextInputFormatter(widget.inputLimit)
                //       ],
                //   autovalidateMode: widget.autovalidateMode,
                //   validator: (text) {
                //     if (widget.forSearch || !widget.shouldValidate) {
                //       return null;
                //     }
                //
                //     String? errorMsg;
                //     if (widget.validator != null) {
                //       //custom validation
                //       errorMsg = widget.validator?.call(text);
                //     } else {
                //       //default validation
                //       final isInvalid = text == null ||
                //           text.isEmpty ||
                //           text.length < widget.minimumInputAllowed;
                //
                //       if (isInvalid) {
                //         errorMsg = '${widget.label} ${widget.errorPrompt}';
                //       }
                //     }
                //
                //     WidgetsBinding.instance.addPostFrameCallback((_) {
                //       state.value = state.value.setErrorMessage(errorMsg);
                //     });
                //
                //     return errorMsg != null ? '' : null;
                //   },
                //   onChanged: (text) {
                //     if (widget.showLengthCounter == true) {
                //       state.value = state.value.copyWith(
                //         currentLength: text?.length,
                //       );
                //     }
                //
                //     if (widget.onChange != null) {
                //       widget.onChange!(text);
                //     }
                //   },
                //   onSaved: widget.onSaved,
                //   focusNode: widget.focusNode,
                //   decoration: widget.forSearch
                //       ? InputDecoration(
                //           border: InputBorder.none,
                //           errorStyle: const TextStyle(height: 0),
                //           icon: const Icon(Icons.search),
                //           suffixIcon: widget.keepSuffixIcon ||
                //                   widget.textFieldController?.text != ''
                //               ? IconButton(
                //                   onPressed: (() {
                //                     if (widget.onChange != null) {
                //                       widget.onChange!('');
                //                     }
                //                     widget.textFieldController?.clear();
                //                   }),
                //                   icon: widget.iconSuffix ?? Container(),
                //                 )
                //               : null,
                //           hintText: widget.label ?? '',
                //           hintStyle: widget.textHintLabelStyle,
                //         )
                //       : InputDecoration(
                //           border: InputBorder.none,
                //           errorStyle: const TextStyle(height: 0),
                //           suffixIconConstraints: widget.suffixIconConstraints,
                //           suffixIcon: widget.keepSuffixIcon ||
                //                   widget.textFieldController?.text == ''
                //               ? widget.iconSuffix
                //               : null,
                //           icon: widget.iconPrefix,
                //           labelText: widget.showLabel ? widget.label : null,
                //           labelStyle: widget.textHintLabelStyle,
                //           hintText: !widget.showLabel ? widget.label : null,
                //           hintStyle: widget.textHintLabelStyle,
                //         ),
                // ),
                child: TextFormField(
                  key: widget.fieldKey,
                  initialValue: widget.initialValue,
                  keyboardType: widget.keyboardType,
                  controller: widget.textFieldController,
                  autofocus: widget.autoFocus ?? false,
                  style: widget.textContentStyle,
                  onTapOutside: (b) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  enabled: widget.enabled,
                  readOnly: widget.readOnly,
                  onTap: widget.onTap,
                  obscureText: widget.obscureText,
                  obscuringCharacter: widget.obscureCharacter ?? '•',
                  textInputAction: widget.forSearch
                      ? TextInputAction.search
                      : widget.textInputAction,
                  onFieldSubmitted: (value) {
                    if (widget.onSubmitted != null) {
                      widget.onSubmitted!(value);
                    }
                  },
                  textCapitalization: widget.textUpperCase != null &&
                      widget.textUpperCase == true
                      ? TextCapitalization.characters
                      : widget.textNameCase != null &&
                      widget.textNameCase == true
                      ? TextCapitalization.words
                      : widget.textSentenceCase != null &&
                      widget.textSentenceCase == true
                      ? TextCapitalization.sentences
                      : TextCapitalization.none,
                  inputFormatters: widget.inputFormatter ??
                      [
                        FilteringTextInputFormatter.allow(
                            RegExp(widget.regex ?? "[a-zA-Z0-9 ]")),
                        LengthLimitingTextInputFormatter(widget.inputLimit)
                      ],
                  autovalidateMode: widget.autovalidateMode,
                  validator: (text) {
                    if (widget.forSearch || !widget.shouldValidate) {
                      return null;
                    }

                    String? errorMsg;
                    if (widget.validator != null) {
                      //custom validation
                      errorMsg = widget.validator?.call(text);
                    } else {
                      //default validation
                      final isInvalid = text == null ||
                          text.isEmpty ||
                          text.length < widget.minimumInputAllowed;

                      if (isInvalid) {
                        errorMsg = '${widget.label} ${widget.errorPrompt}';
                      }
                    }

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      state.value = state.value.setErrorMessage(errorMsg);
                    });

                    return errorMsg != null ? '' : null;
                  },
                  onChanged: (text) {
                    if (widget.showLengthCounter == true) {
                      state.value = state.value.copyWith(
                        currentLength: text.length,
                      );
                    }

                    if (widget.onChange != null) {
                      widget.onChange!(text);
                    }
                  },
                  onSaved: widget.onSaved,
                  focusNode: widget.focusNode,
                  decoration: widget.forSearch
                      ? InputDecoration(
                    border: InputBorder.none,
                    errorStyle: const TextStyle(height: 0),
                    icon: const Icon(Icons.search),
                    suffixIcon: widget.keepSuffixIcon ||
                        widget.textFieldController?.text != ''
                        ? IconButton(
                      onPressed: (() {
                        if (widget.onChange != null) {
                          widget.onChange!('');
                        }
                        widget.textFieldController?.clear();
                      }),
                      icon: widget.iconSuffix ?? Container(),
                    )
                        : null,
                    hintText: widget.label ?? '',
                    hintStyle: widget.textHintLabelStyle,
                  )
                      : InputDecoration(
                    border: InputBorder.none,
                    errorStyle: const TextStyle(height: 0),
                    suffixIconConstraints: widget.suffixIconConstraints,
                    suffixIcon: widget.keepSuffixIcon ||
                        widget.textFieldController?.text == ''
                        ? widget.iconSuffix
                        : null,
                    icon: widget.iconPrefix,
                    labelText: widget.showLabel ? widget.label : null,
                    labelStyle: widget.textHintLabelStyle,
                    hintText: !widget.showLabel ? widget.label : null,
                    hintStyle: widget.textHintLabelStyle,
                  ),
                ),
              ),
              widget.trailingIcon != null && widget.iconSuffix == null
                  ? widget.trailingIcon!
                  : Container()
            ],
          ),
        ),
        const SizedBox(height: 7.0),
        ValueListenableBuilder(
          valueListenable: state,
          builder: (context, value, _) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (value.errorMessage != null)
                  Expanded(
                    child: Text(
                      value.errorMessage!,
                      textAlign: TextAlign.start,
                      style: widget.textErrorStyle,
                      maxLines: 2,
                    ),
                  ),
                const SizedBox(width: 8),
                if (widget.showLengthCounter == true &&
                    widget.inputLimit != null)
                  Expanded(
                    child: Text(
                      '${value.currentLength?.toString() ?? '0'}/${widget.inputLimit}',
                      style: widget.textCounterStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  Color? _getBorderColor(_TextFormState state) {
    if (state.errorMessage != null) {
      return widget.borderError;
    }

    if (state.isFocused == true) {
      return widget.borderHighlight;
    }

    return widget.borderIdeal;
  }
}


class _TextFormNotifier extends ValueNotifier<_TextFormState> {
  _TextFormNotifier({_TextFormState? state}) : super(state ?? _TextFormState());
}

class _TextFormState {
  final bool? isFocused;
  final String? errorMessage;
  final int? currentLength;

  _TextFormState({
    this.isFocused,
    this.errorMessage,
    this.currentLength,
  });

  _TextFormState copyWith({
    bool? isFocused,
    String? errorMessage,
    int? currentLength,
  }) {
    return _TextFormState(
      isFocused: isFocused ?? this.isFocused,
      errorMessage: errorMessage ?? this.errorMessage,
      currentLength: currentLength ?? this.currentLength,
    );
  }

  _TextFormState setErrorMessage(
      String? errorMessage,
      ) {
    return _TextFormState(
      isFocused: isFocused,
      errorMessage: errorMessage,
      currentLength: currentLength,
    );
  }
}