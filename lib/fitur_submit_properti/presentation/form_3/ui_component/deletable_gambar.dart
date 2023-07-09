// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DeletableGambar extends StatelessWidget{
  final XFile image;
  final void Function() onClickDelete;

  const DeletableGambar({
    super.key,
    required this.image,
    required this.onClickDelete
  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black,
            width: 0.5
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
                File(image.path),
                height: 241,
                width: 270,
                fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            top: 8,
            right: 8,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
                ),
                child: InkWell(
                    onTap: onClickDelete,
                    child: const Icon(Icons.close , size: 12,)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}