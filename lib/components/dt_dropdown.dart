import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'dt_color.dart';
import 'dt_search_page.dart';


class DTDropdown extends StatefulWidget {
  final List<dynamic>? options;
  final ValueChanged<dynamic>? onChange;
  final dynamic value;
  final bool isSearchable;
  final bool allowClear;
  final String placeholder;
  final Widget? prefixIcon;
  final bool hideDropdownIcon;
  final Color? fillColor;
  final bool disabled;
  final DropdownType? dropdownType;
  final bool loading;
  final minValue;

  DTDropdown(
      {Key? key,
        this.options,
        this.onChange,
        this.value,
        this.dropdownType,
        this.loading = false,
        this.disabled = false,
        this.isSearchable = false,
        this.allowClear = false,
        this.hideDropdownIcon = false,
        this.prefixIcon,
        this.placeholder = "Select Item",
        this.minValue = 1,
        this.fillColor})
      : super(key: key);

  @override
  _DTDropdownState createState() => _DTDropdownState();
}

class _DTDropdownState extends State<DTDropdown> {
  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;
  List<dynamic>? results = [];
  final TextEditingController _searchController = TextEditingController();

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
  }

  openOption() async {
    DropdownType dropdownType = (null != widget.dropdownType)
        ? widget.dropdownType!
        : widget.isSearchable
        ? DropdownType.fullSearch
        : DropdownType.modal;
    if (dropdownType == DropdownType.fullSearch) {
      //full screen search
      List<DTDropdownModal>? vals = widget.options
          ?.map((e) => DTDropdownModal(
          key: "${e['key'] ?? "N/A"}", value: "${e['value'] ?? "N/A"}"))
          .toList();
      final result = await showSearch<String>(
        context: context,
        delegate: DTValueSearch(vals!),
      );
      if (null != result) {
        widget.onChange!(result);
      }
    } else {
      //modal
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(widget.placeholder ?? "Select Value"),
              contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
              content: (widget.options?.length == 0)
                  ? Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24, horizontal: 24),
                  child: Text(
                    "No Any Item",
                    style: TextStyle(),
                  ))
                  : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView.builder(
                      itemCount: widget.options?.length ?? 0,
                      itemBuilder: (BuildContext context, int i) {
                        final optionItem = widget.options?[i];
                        if (optionItem != null) {
                          return i < widget.minValue - 1
                              ? Material(
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                border: i == 0
                                    ? null
                                    : const Border(
                                  top: BorderSide(
                                    color: DTColor.greyTextColor,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 24,
                                horizontal: 24,
                              ),
                              child: Text(
                                optionItem['value'] ?? "",
                                style: TextStyle(
                                  color: DTColor.primaryTextColor.withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                              : Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                widget.onChange!(optionItem['key']);
                                Navigator.of(context).pop();
                                _searchController.text =
                                    optionItem['value'] ?? "";
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: i == 0
                                      ? null
                                      : const Border(
                                    top: BorderSide(
                                      color: Color(0xFFC4C4C4),
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24,
                                  horizontal: 24,
                                ),
                                child: Text(
                                  optionItem['value'] ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return SizedBox.shrink(); // Return an empty widget if optionItem is null
                        }
                      },
                    )

                  ],
                ),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    String? label;
    if (mounted) {
      (widget.options)?.map((e) {
        // print("searching for $e ${widget.value} ${e['key'] == widget.value}");
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
      link: _layerLink,
      child: Stack(children: [
        TextFormField(
          controller: _searchController,
          focusNode: _focusNode,
          readOnly: true,
          onTap: () {
            if (!widget.disabled) {
              openOption();
            }
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(11),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: label ?? widget.placeholder,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.loading
                ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 8,
                  width: 8,
                  child: CircularProgressIndicator()),
            )
                : hideDropdownIcon
                ? const SizedBox()
                : const Icon(
              Icons.arrow_drop_down,
            ),
            fillColor: widget.fillColor ?? Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: DTColor.calculatorBorder,),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: DTColor.calculatorBorder,),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          onChanged: (val) {
            setState(() {
              results = widget.options
                  ?.where((element) => element['value']
                  .toString()
                  .toLowerCase()
                  .contains(val.toLowerCase()))
                  .toList();
            });
            _overlayEntry.markNeedsBuild();
          },
        ),
        if (label != null && widget.allowClear)
          Positioned(
            right: 12,
            bottom: 0,
            child: InkWell(
              onTap: () {
                FocusScope.of(context).requestFocus();
                widget.onChange!(null);
                _focusNode.unfocus();
                _searchController.text = "";
                _overlayEntry.remove();
              },
              child: Container(
                height: 42,
                width: 42,
                alignment: Alignment.center,
                child: const Icon(
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

class DTDropdownFormField extends StatelessWidget {
  final String? attribute;
  final String? Function(String?)? validator;
  final List<dynamic> options;
  final ValueChanged<dynamic>? onChange;
  final dynamic value;
  final bool isSearchable;
  final bool allowClear;
  final String? hintText;
  final Widget? prefixIcon;
  final bool hideDropdownIcon;
  final Color? fillColor;
  final bool disabled;
  final bool loading;

  const DTDropdownFormField(
      {Key? key,
        this.attribute,
        this.validator,
        this.loading = false,
        required this.options,
        this.onChange,
        this.value,
        this.isSearchable = false,
        this.allowClear = false,
        this.hintText,
        this.prefixIcon,
        this.hideDropdownIcon = false,
        this.fillColor,
        this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        builder: (FormFieldState<dynamic> state) {
          if (state.value != value && (null != value)) {
            Future.delayed(const Duration(milliseconds: 100), () {
              state.didChange(value);
            });
          }
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DTDropdown(
                  options: options,
                  placeholder: hintText ?? '',
                  value: value,
                  fillColor: fillColor,
                  allowClear: allowClear,
                  loading: loading,
                  hideDropdownIcon: hideDropdownIcon,
                  disabled: disabled,
                  isSearchable: isSearchable,
                  onChange: (val) {
                    state.didChange(val);
                    if (onChange != null) {
                      onChange!(val);
                    }
                  },
                ),
                if (state.hasError)
                  Text(
                    state.errorText ?? "",
                    style: const TextStyle(fontSize: 12, color: Colors.red),
                  )
              ]);
        },
        name: attribute!,
        validator: validator);
  }
}

enum DropdownType { modal, fullSearch }

class DTDropdownModal {
  final String key;
  final String value;

  DTDropdownModal({required this.key, required this.value});

  @override
  String toString() {
    return value;
  }
}
