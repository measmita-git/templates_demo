import 'package:flutter/material.dart';

import '../components/dt_color.dart';

class CustomDropdown extends StatefulWidget {
  final List<dynamic> options;
  final ValueChanged<dynamic> onChange;
  final dynamic value;
  final bool isSearchable;
  final bool allowClear;
  final String placeholder;
  final Widget prefixIcon;
  final bool hideDropdownIcon;
  final Color fillColor;
  final bool disabled;
  Color? borderColor;
  double? borderWidth;

  CustomDropdown({
    Key? key,
    required this.options,
    required this.onChange,
    this.value,
    this.borderColor,
    this.borderWidth = 0,
    this.disabled = false,
    this.isSearchable = false,
    this.allowClear = false,
    this.hideDropdownIcon = false,
    required this.prefixIcon,
    this.placeholder = "Select Item",
    required this.fillColor,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final FocusNode _focusNode = FocusNode();

  OverlayEntry? _overlayEntry;
  List<dynamic> results = [];
  TextEditingController _searchController = TextEditingController();

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (this.widget.disabled == true) {
      } else {
        if (_focusNode.hasFocus) {
          this._overlayEntry = this._createOverlayEntry();
          this.setState(() {
            results = widget.options;
          });
          Overlay.of(context)?.insert(_overlayEntry!);
        } else {
          _searchController.text = "";
          this._overlayEntry?.remove();

          this._overlayEntry = null;
        }
      }
    });
    this.setState(() {
      results = widget.options;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width,
        child: CompositedTransformFollower(
          link: this._layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(4),
            child: Container(
              constraints: BoxConstraints(maxHeight: 900),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: <Widget>[
                  ...results.map((optionItem) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          widget.onChange(optionItem['key']);
                          _searchController.text = optionItem['value'] ?? "";
                          this.setState(() {
                            results = widget.options;
                          });
                          try {
                            this._overlayEntry?.remove();
                            this._overlayEntry = null;
                            this._focusNode.unfocus();
                          } catch (e) {}
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                          child: Text(
                            optionItem['value'] ?? "",
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? label;
    if (mounted) {
      (widget.options).map((e) {
        if (e['key'] == widget.value) {
          label = e['value'];
        }
      }).toList();
    }

    bool hideDropdownIcon = widget.hideDropdownIcon
        ? true
        : (!widget.allowClear)
            ? false
            : label == null
                ? false
                : true;

    return CompositedTransformTarget(
      link: this._layerLink,
      child: Stack(children: [
        TextFormField(
          controller: _searchController,
          focusNode: this._focusNode,
          readOnly: widget.isSearchable ? false : true,
          onTap: () {
            if (_focusNode.hasFocus && !widget.isSearchable) {
              _focusNode.unfocus();
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15, bottom: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: widget.borderColor ?? Color(0xFFC4C4C4),
                width: widget.borderWidth ?? 1,
              ),
            ),
            filled: true,
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: label != null ? label : widget.placeholder,
            prefixIcon: widget.prefixIcon,
            suffixIcon: hideDropdownIcon
                ? SizedBox()
                : Icon(
                    Icons.arrow_drop_down,
                  ),
            enabled: true,
          ),
          onChanged: (val) {
            this.setState(() {
              results = widget.options
                  .where((element) => element['value']
                      .toString()
                      .toLowerCase()
                      .contains(val.toLowerCase()))
                  .toList();
            });
            this._overlayEntry?.markNeedsBuild();
            this._focusNode.requestFocus();
          },
        ),
        if (label != null && widget.allowClear)
          Positioned(
            right: 12,
            bottom: 0,
            child: InkWell(
              onTap: () {
                FocusScope.of(context).requestFocus();
                widget.onChange(null);
                this._focusNode.unfocus();
                _searchController.text = "";
                this._overlayEntry?.remove();
              },
              child: Container(
                height: 42,
                width: 42,
                alignment: Alignment.center,
                child: Icon(
                  Icons.close,
                  size: 16,
                ),
              ),
            ),
          )
      ]),
    );
  }
}

class CustomDropdownField extends FormField<dynamic> {
  CustomDropdownField({
    required FormFieldSetter<dynamic> onSaved,
    required FormFieldValidator<dynamic> validator,
    required final ValueChanged<dynamic> onChange,
    dynamic initialValue,
    required Color fillColor,
    bool isSearchable = false,
    String placeholder = "Select Item",
    required List<dynamic> options,
    required bool disabled,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<dynamic> state) {
            if (state.mounted &&
                (state.value != initialValue) &&
                (null != initialValue)) {
              Future.delayed(Duration(milliseconds: 100), () {
                state.didChange(initialValue);
              });
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdown(
                  prefixIcon: Icon(Icons.add),
                  options: options,
                  placeholder: placeholder,
                  value: (state.value ?? initialValue),
                  fillColor: fillColor,
                  disabled: disabled,
                  isSearchable: isSearchable,
                  onChange: (val) {
                    state.didChange(val);
                    if (onChange != null) {
                      onChange(val);
                    }
                  },
                ),
                if (state.hasError)
                  Text(
                    state.errorText ?? "",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  )
              ],
            );
          },
        );
}
