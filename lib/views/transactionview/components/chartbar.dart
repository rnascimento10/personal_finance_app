import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({this.label, this.value, this.percentage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
        
          FittedBox(
            child: Text(
              "${value.toStringAsFixed(2)}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 13,
            height: 80,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          topLeft: Radius.zero,
                          topRight: Radius.zero),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
