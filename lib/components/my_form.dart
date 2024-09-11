import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import 'package:http/http.dart' as http;

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  final _formKey = GlobalKey<FormState>();

  String _token = '';
  String _response = '';

  void _showSuccessToast(String description){
    toastification.show(
      context: context,
      alignment: Alignment.topCenter,
      title: const Text("Successful"),
      description: Text(description),
      style: ToastificationStyle.minimal,
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 4),
    );
  }

  void _showFailedToast(String description){
    toastification.show(
      context: context,
      alignment: Alignment.topCenter,
      title: const Text("Failed"),
      description: Text(description),
      style: ToastificationStyle.minimal,
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 4),
    );
  }

  Future<void> _handleSubmit() async {
    final url = Uri.parse('');

    // Reset the form (Temporary)
    _formKey.currentState!.reset();

    try{
      final response = await http.post(
        url,
        body: {
          json.encode({'token': _token}),
        },
      );

      if(response.statusCode == 200){
        _formKey.currentState!.reset();
        setState(() {
          _response = 'Token entered successfully';
        });
        _showSuccessToast(_response);
      } else {
        setState(() {
          _response = 'An error occurred while entering the token';
        });
        _showFailedToast(_response);
      }

    } catch (error) {
      setState(() {
        _response = 'Error: $error';
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      _handleSubmit();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: 172,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.electric_bolt),
                prefixIconColor: Colors.grey,
                labelText: 'Token',
                labelStyle: GoogleFonts.mulish(color: Colors.grey),
                border: const OutlineInputBorder(),
              ),
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent[200],
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Enter", style: GoogleFonts.mulish(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        )
        ),
      ),
    );
  }
}