import 'package:flutter/material.dart';
import 'package:hires/core/utils/math_utils.dart';

customEmployerNavBuilder({
  required var title,
  required var usePrv,
  required var onTap,
  required var icon,

}) {
  return Builder(
      builder: (context) {
        if (usePrv.role_id != 2) {
          return Container();
        }
        else {
          return Padding(
            padding: EdgeInsets.only(
                top: getVerticalSize(16)),
            child: GestureDetector(
              onTap: () => onTap(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment
                    .center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      height: getVerticalSize(
                        21.67,
                      ),
                      width: getHorizontalSize(
                        17.33,
                      ),
                      child: icon
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalSize(12),
                    ),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: getFontSize(
                          15,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
  );
}