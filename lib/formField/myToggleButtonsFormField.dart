// formFields/myToggleButtonsFormField.dart ********************

import 'package:bc_ind_gama/widgets/myToggleButtons.dart';
import 'package:flutter/material.dart';

class MyToggleButtonsFormField<T> extends FormField<T> {
  MyToggleButtonsFormField({
    Key key,
    this.initialValue,
    @required this.items,
    @required this.itemBuilder,
    @required this.selectedItemBuilder,
    this.decoration = const InputDecoration(),
    this.onChanged,
    FormFieldSetter<T> onSaved,
    FormFieldValidator<T> validator,
    bool autovalidate = false,
    TextStyle textStyle,
    BoxConstraints constraints,
    Color color,
    Color selectedColor,
    Color disabledColor,
    Color fillColor,
    Color focusColor,
    Color highlightColor,
    Color hoverColor,
    Color splashColor,
    List<FocusNode> focusNodes,
    bool renderBorder = true,
    Color borderColor,
    Color selectedBorderColor,
    Color disabledBorderColor,
    BorderRadius borderRadius,
    double borderWidth,
  })  : assert(decoration != null),
        assert(renderBorder != null),
        assert(autovalidate != null),
        assert(items != null),
        assert(itemBuilder != null),
        assert(selectedItemBuilder != null),
        assert(initialValue == null || items.contains(initialValue)),
        super(
          key: key,
          onSaved: onSaved,
          initialValue: initialValue,
          validator: validator,
          autovalidate: autovalidate,
          builder: (FormFieldState<T> field) {
            final InputDecoration effectiveDecoration =
                decoration.applyDefaults(
              Theme.of(field.context).inputDecorationTheme,
            );
            return InputDecorator(
              decoration:
                  effectiveDecoration.copyWith(errorText: field.errorText),
              isFocused: focusNodes?.any((focusNode) => focusNode.hasFocus),
              child: MyToggleButtons(
                items: items,
                value: field.value,
                itemBuilder: itemBuilder,
                selectedItemBuilder: selectedItemBuilder,
                onPressed: field.didChange,
                textStyle: textStyle,
                constraints: constraints,
                color: color,
                selectedColor: selectedColor,
                disabledColor: disabledColor,
                fillColor: fillColor,
                focusColor: focusColor,
                highlightColor: highlightColor,
                hoverColor: hoverColor,
                splashColor: splashColor,
                focusNodes: focusNodes,
                renderBorder: renderBorder,
                borderColor: borderColor,
                selectedBorderColor: selectedBorderColor,
                disabledBorderColor: disabledBorderColor,
                borderRadius: borderRadius,
                borderWidth: borderWidth,
              ),
            );
          },
        );

  final List<T> items;
  final ValueChanged<T> onChanged;
  final T initialValue;
  final Widget Function(BuildContext, T) itemBuilder;
  final Widget Function(BuildContext, T) selectedItemBuilder;
  final InputDecoration decoration;

  @override
  FormFieldState<T> createState() => _MyToggleButtonsFormFieldState<T>();
}

class _MyToggleButtonsFormFieldState<T> extends FormFieldState<T> {
  @override
  MyToggleButtonsFormField<T> get widget => super.widget;

  @override
  void didChange(T value) {
    super.didChange(value);
    if (this.hasError) {
      this.validate();
    }
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
  }
}
