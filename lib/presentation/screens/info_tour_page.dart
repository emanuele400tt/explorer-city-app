import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfoTourPage extends StatefulWidget {
  final String cityName;

  const InfoTourPage({super.key, required this.cityName});

  @override
  State<InfoTourPage> createState() => _InfoTourPageState();
}

class _InfoTourPageState extends State<InfoTourPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendInfoRequest() async {
    if (_formKey.currentState!.validate()) {
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );

        await FirebaseFirestore.instance.collection('richieste_tour').add({
          'citta': widget.cityName,
          'email': _emailController.text,
          'messaggio': _messageController.text,
          'data_invio': FieldValue.serverTimestamp(),
        });
        if (mounted) {
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Richiesta inviata Correttamente")),
          );

          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Errore: $e")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Richiedi Info: ${widget.cityName}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: widget.cityName,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Città selezionata",
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Campo 2 -> email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "La tua Email",
                  hintText: "esempio@mail.it",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Inserisci l'email";
                  if (!value.contains('@') || !value.contains('.'))
                    return "Inserisci un'email valida";
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _messageController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Messaggio",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Scrivi un messaggio";
                  return null;
                },
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _sendInfoRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Invia Richiesta",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
