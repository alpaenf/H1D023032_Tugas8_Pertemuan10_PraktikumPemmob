import 'package:flutter/material.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/login_page.dart';

class ProdukPage extends StatefulWidget {
const ProdukPage({Key? key}) : super(key: key);

@override
_ProdukPageState createState() => _ProdukPageState();
}
class _ProdukPageState extends State<ProdukPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk Alfaen'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProdukForm()),
                ).then((value) {
                  setState(() {}); // Refresh list setelah tambah
                });
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                _showLogoutDialog();
              },
            )
          ],
        ),
      ),
      body: FutureBuilder<List<Produk>>(
        future: ProdukBloc.getProduks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 50, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {}); // Retry
                    },
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          }
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          List<Produk> listProduk = snapshot.data ?? [];
          
          if (listProduk.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.inbox, size: 50, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('Belum ada produk'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProdukForm()),
                      ).then((value) {
                        setState(() {}); // Refresh
                      });
                    },
                    child: const Text('Tambah Produk'),
                  ),
                ],
              ),
            );
          }
          
          return ListView.builder(
            itemCount: listProduk.length,
            itemBuilder: (context, index) {
              return ItemProduk(
                produk: listProduk[index],
                onTap: () async {
                  var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProdukDetail(produk: listProduk[index]),
                    ),
                  );
                  
                  // Refresh list setelah kembali dari detail
                  if (result != null) {
                    setState(() {});
                    
                    if (result == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Produk berhasil dihapus')),
                      );
                    } else if (result is Produk) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Produk berhasil diupdate')),
                      );
                    }
                  }
                },
              );
            },
          );
        },
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;
  final VoidCallback onTap;
  
  const ItemProduk({Key? key, required this.produk, required this.onTap}) 
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk!),
          subtitle: Text('Rp ${produk.hargaProduk}'),
        ),
      ),
    );
  }
}