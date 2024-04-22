import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaja_namaz/data/controllers/wakto_controller.dart';

GetBuilder<WaktoController> waktoRow(Size size, bool isRegular, String wakto) {
  return GetBuilder<WaktoController>(
    builder: (waktoController) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(120),
              onTap: () {
                final player = AudioPlayer();
                player.play(AssetSource('audio/buttonSound.wav'));
                isRegular
                    ? waktoController.regularDecrement(wakto)
                    : waktoController.kosorDecrement(wakto);
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.11,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(
                  CupertinoIcons.minus,
                  size: 30,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.033,
                  width: size.width * 0.25,
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      wakto,
                      style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      (isRegular
                              ? waktoController.regularWaktoValue(wakto)
                              : waktoController.kosorWaktoValue(wakto)) ??
                          '0',
                      style: const TextStyle(
                          fontSize: 32,
                          fontFamily: 'poppins',
                          color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              borderRadius: BorderRadius.circular(120),
              onTap: () async {
                final player = AudioPlayer();
                await player.play(AssetSource('audio/buttonSound.wav'));
                isRegular
                    ? waktoController.regularIncrement(wakto)
                    : waktoController.kosorIncrement(wakto);
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.11,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(
                  CupertinoIcons.add,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
