import 'package:flutter/material.dart';
import 'package:kaja_namaz/data/models/namaz_collection_model.dart';

mySnackbar(context, msg, [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14, fontFamily: 'poppins', fontWeight: FontWeight.bold),
      ),
      width: MediaQuery.sizeOf(context).width * 0.85,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(milliseconds: 3500),
      padding: const EdgeInsets.all(15),
      clipBehavior: Clip.hardEdge,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

NamazCollection setInitailNamazCount( String count){
  NamazCollection namazCollection = NamazCollection(
    namazes: Namazes(
      regular: Regular(
        fajr: count,
        zuhar: count,
        asar: count,
        maghrib: count,
        isha: count,
        vitr: count,
      ),
      kosor: Kosor(
        fajr: "0",
        zuhar: "0",
        asar: "0",
        maghrib: "0",
        isha: "0",
      ),
    ),
  );

  return namazCollection;
}
