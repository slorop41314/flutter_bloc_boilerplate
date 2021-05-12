part of 'shared.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  final bool secureText;
  final bool showValue;
  final Function? onTapTrailingIcon;
  final Widget? leadingIcon;
  final void Function(String value)? onSubmit;
  final void Function(String value)? onChanged;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool isDisabled;

  CustomInput({
    this.controller,
    this.label,
    this.placeholder,
    this.secureText = false,
    this.showValue = false,
    this.onTapTrailingIcon,
    this.leadingIcon,
    this.onSubmit,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isRequired = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.label != null
            ? Column(
                children: [
                  Text(this.label!),
                  SizedBox(height: 8),
                ],
              )
            : SizedBox(),
        Container(
          color: this.isDisabled ? Colors.grey[200] : Colors.white,
          height: 40,
          child: TextFormField(
            enabled: !this.isDisabled,
            onChanged: this.onChanged,
            obscureText: this.showValue,
            style: Theme.of(context).textTheme.bodyText1,
            keyboardType: this.keyboardType,
            controller: controller,
            onFieldSubmitted: this.onSubmit,
            decoration: InputDecoration(
              // hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
              //       color: kColorInputPlaceholder,
              //     ),
              hintText: this.placeholder,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 0,
              ),
              border: OutlineInputBorder(),
              prefixIcon: this.leadingIcon,
              suffixIcon: this.secureText
                  ? InkWell(
                      onTap: () {
                        if (this.onTapTrailingIcon != null) {
                          this.onTapTrailingIcon!();
                        }
                      },
                      child: this.showValue
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
