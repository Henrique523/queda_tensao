import 'dart:math';

final num cupperResistivity = 2.82 * pow(10, -8);

final List<Map<String, dynamic>> infoDiameterCables = [
  {
    "diameter": 16,
    "twoChargedCircuits": 60,
    "threeChargedCircuits": 53,
  },
  {
    "diameter": 25,
    "twoChargedCircuits": 79,
    "threeChargedCircuits": 70,
  },
  {
    "diameter": 35,
    "twoChargedCircuits": 97,
    "threeChargedCircuits": 86,
  },
  {
    "diameter": 50,
    "twoChargedCircuits": 118,
    "threeChargedCircuits": 104,
  },
  {
    "diameter": 70,
    "twoChargedCircuits": 150,
    "threeChargedCircuits": 133,
  },
  {
    "diameter": 95,
    "twoChargedCircuits": 181,
    "threeChargedCircuits": 161,
  },
  {
    "diameter": 120,
    "twoChargedCircuits": 210,
    "threeChargedCircuits": 186,
  },
  {
    "diameter": 150,
    "twoChargedCircuits": 241,
    "threeChargedCircuits": 214,
  },
  {
    "diameter": 185,
    "twoChargedCircuits": 275,
    "threeChargedCircuits": 245,
  },
  {
    "diameter": 240,
    "twoChargedCircuits": 324,
    "threeChargedCircuits": 288,
  },
  {
    "diameter": 300,
    "twoChargedCircuits": 372,
    "threeChargedCircuits": 331,
  },
  {
    "diameter": 400,
    "twoChargedCircuits": 446,
    "threeChargedCircuits": 397,
  },
  {
    "diameter": 500,
    "twoChargedCircuits": 512,
    "threeChargedCircuits": 456,
  },
  {
    "diameter": 630,
    "twoChargedCircuits": 592,
    "threeChargedCircuits": 527,
  },
  {
    "diameter": 800,
    "twoChargedCircuits": 687,
    "threeChargedCircuits": 612,
  },
  {
    "diameter": 1000,
    "twoChargedCircuits": 790,
    "threeChargedCircuits": 704,
  },
];