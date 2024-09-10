import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  final _formKey = GlobalKey<FormState>();

  String _token = '';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Token',
                labelStyle: GoogleFonts.mulish(color: Colors.grey),
                border: const OutlineInputBorder(),
              ),
              autocorrect: false,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please fill this field";
                }
                return null;
              },
              onSaved: (value) => _token = value ?? _token,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()){
                  _formKey.currentState!.save();

                  // Backend API call here

                  // If Success
                  toastification.show(
                    context: context,
                    alignment: Alignment.topCenter,
                    title: const Text("Successful"),
                    description: const Text("Token has been entered successfully"),
                    style: ToastificationStyle.minimal,
                    type: ToastificationType.success,
                    autoCloseDuration: const Duration(seconds: 4),
                  );

                  // If Error
                  // toastification.show(
                  //   context: context,
                  //   alignment: Alignment.topCenter,
                  //   title: const Text("Failed"),
                  //   description: const Text("An error occurred while entering the token"),
                  //   style: ToastificationStyle.minimal,
                  //   type: ToastificationType.error,
                  //   autoCloseDuration: const Duration(seconds: 4),
                  // );

                  return;
                }
                
              },
              child: const Text("Enter"),
            ),
          ],
        )
        ),
      ),
    );
  }
}