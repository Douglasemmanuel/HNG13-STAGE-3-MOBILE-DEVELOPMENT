import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioContainerExample extends StatefulWidget {
  final String header;
  final String title;
  final int value;
  final int? selectedValue;
  final ValueChanged<int?> onChanged;

  const RadioContainerExample({
    super.key,
    required this.header,
    required this.title,
    required this.value,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  State<RadioContainerExample> createState() => _RadioContainerExampleState();
}

class _RadioContainerExampleState extends State<RadioContainerExample> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedValue == widget.value;

    final screenWidth = MediaQuery.of(context).size.width;

    // Change font size based on screen width
    final titleFontSize = screenWidth < 800 ? 12.0 : 14.0;
    final headerFontSize = screenWidth < 800 ? 14.0 : 16.0;

    return GestureDetector(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        width: screenWidth < 800 ? screenWidth * 0.9 : 569,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Radio<int>(
                value: widget.value,
                groupValue: widget.selectedValue,
                fillColor: WidgetStateProperty.resolveWith<Color>(
                  (states) => isSelected ? const Color(0xFFFBB03B) : Colors.grey,
                ),
                onChanged: widget.onChanged,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.header,
                  style: GoogleFonts.poppins(
                    fontSize: headerFontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
