import 'package:flutter/material.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/model/produk.dart';

class ProdukForm extends StatefulWidget {
  final Produk? produk;

  const ProdukForm({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String judul = "TAMBAH PRODUK ALFAEN";
  String tombolSubmit = "SIMPAN";

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  void isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "UBAH PRODUK ALFAEN";
        tombolSubmit = "UBAH";
        _kodeProdukTextboxController.text = widget.produk!.kodeProduk!;
        _namaProdukTextboxController.text = widget.produk!.namaProduk!;
        _hargaProdukTextboxController.text =
            widget.produk!.hargaProduk.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _kodeProdukTextField(),
                _namaProdukTextField(),
                _hargaProdukTextField(),
                _buttonSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _kodeProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Kode Produk harus diisi";
        }
        return null;
      },
    );
  }

  Widget _namaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama Produk harus diisi";
        }
        return null;
      },
    );
  }

  Widget _hargaProdukTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Harga"),
      keyboardType: TextInputType.number,
      controller: _hargaProdukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

  Widget _buttonSubmit() {
    return ElevatedButton(
      child: _isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(tombolSubmit),
      onPressed: _isLoading ? null : () {
        if (_formKey.currentState!.validate()) {
          setState(() {
            _isLoading = true;
          });

          Produk produk = Produk(
            id: widget.produk?.id,
            kodeProduk: _kodeProdukTextboxController.text,
            namaProduk: _namaProdukTextboxController.text,
            hargaProduk: int.parse(_hargaProdukTextboxController.text),
          );

          if (widget.produk == null) {
            // Tambah produk baru
            ProdukBloc.addProduk(produk: produk).then((value) {
              setState(() {
                _isLoading = false;
              });
              
              if (value) {
                Navigator.pop(context, true);
                
                // Tampilkan snackbar sukses di parent
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Produk berhasil ditambahkan')),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("Gagal"),
                    content: const Text("Gagal menambahkan produk"),
                    actions: [
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                );
              }
            }).catchError((error) {
              setState(() {
                _isLoading = false;
              });
              
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text("Error"),
                  content: Text(error.toString()),
                  actions: [
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              );
            });
          } else {
            // Update produk
            ProdukBloc.updateProduk(produk: produk).then((value) {
              setState(() {
                _isLoading = false;
              });
              
              if (value) {
                Navigator.pop(context, produk);
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("Gagal"),
                    content: const Text("Gagal mengubah produk"),
                    actions: [
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                );
              }
            }).catchError((error) {
              setState(() {
                _isLoading = false;
              });
              
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text("Error"),
                  content: Text(error.toString()),
                  actions: [
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              );
            });
          }
        }
      },
    );
  }
}
