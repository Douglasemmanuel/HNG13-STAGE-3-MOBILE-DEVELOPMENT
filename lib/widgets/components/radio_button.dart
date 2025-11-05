import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioContainerExample extends StatefulWidget {
  final String header;
  final String title;
  final int value;
  final int? selectedValue;
  final ValueChanged<int?> onChanged;

  const RadioContainerExample({
    Key? key,
    required this.header,
    required this.title,
    required this.value,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RadioContainerExample> createState() => _RadioContainerExampleState();
}

class _RadioContainerExampleState extends State<RadioContainerExample> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedValue == widget.value;

    return GestureDetector(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        width: 569,
        height: 69,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
            width: 24,
            height: 24,
            child: Radio<int>(
              value: widget.value,
              groupValue: widget.selectedValue,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (states) => isSelected ? const Color(0xFFFBB03B) : Colors.grey,
              ),
              onChanged: widget.onChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // removes extra padding
            ),
          ),
              // Radio<int>(
              //   value: widget.value,
              //   groupValue: widget.selectedValue,
              //   fillColor: MaterialStateProperty.resolveWith<Color>(
              //     (states) => isSelected ? const Color(0xFFFBB03B) : Colors.grey,
              //   ),
              //   onChanged: widget.onChanged,
              // ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.header,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
