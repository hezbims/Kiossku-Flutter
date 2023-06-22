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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
              File(image.path),
              height: 241,
              fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          top: 16,
          right: 16,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
              child: IconButton(
                  onPressed: onClickDelete,
                  icon: const Icon(Icons.close)
              ),
            ),
          ),
        ),
      ],
    );
  }
}