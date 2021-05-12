part of 'shared.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final bool isDisabled;
  final bool isLoading;
  final void Function() onPressed;
  final Color buttonColor;
  final Color labelColor;
  final double labelSize;
  final double height;
  final EdgeInsets? padding;
  final Color? borderColor;

  CustomButton({
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.buttonColor = kColorPrimary,
    this.labelColor = Colors.white,
    this.labelSize = 14,
    this.height = 44,
    this.padding,
    this.borderColor,
  });

  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(this.padding),
        backgroundColor: MaterialStateProperty.all(this.buttonColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: this.borderColor ?? Colors.transparent),
        )),
      ),
      onPressed: this.isDisabled
          ? null
          : this.isLoading
              ? null
              : this.onPressed,
      child: Container(
        width: double.infinity,
        height: this.height,
        child: Center(
          child: this.isLoading
              ? LoadingIndicator()
              : Text(
                  this.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: this.labelColor,
                    fontSize: this.labelSize,
                  ),
                ),
        ),
      ),
    );
  }
}
