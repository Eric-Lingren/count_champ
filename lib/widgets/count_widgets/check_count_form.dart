import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:count_champ/logic/cubits/count_cubit/count_cubit.dart';
import 'package:provider/src/provider.dart';

class CheckCountForm extends StatefulWidget {
  final double runningCount;

  const CheckCountForm({Key? key, required this.runningCount})
      : super(key: key);

  @override
  _CheckCountFormState createState() => _CheckCountFormState();
}

class _CheckCountFormState extends State<CheckCountForm> {
  final formController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    //* Cleans up the controller when the widget is disposed.
    formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    return SizedBox(
      width: 200,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              controller: formController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9 -.]')),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a number';
                }
                try {
                  double.parse(value);
                } on FormatException {
                  return 'Please enter a valid number';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Whats The Count?",
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                enabledBorder: UnderlineInputBorder(      
                  borderSide: BorderSide(color: Colors.white),   
                ),  
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),  
              ),
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  //* Hides the keyboard
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  //* Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    context.read<CountCubit>().checkRunningCount(
                        formController.text, widget.runningCount);
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
