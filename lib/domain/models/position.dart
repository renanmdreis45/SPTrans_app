import 'dart:convert';

class PositionModel {
  String hr;
  List<L> l;

  PositionModel({
    required this.hr,
    required this.l,
  });

  PositionModel copyWith({
    String? hr,
    List<L>? l,
  }) =>
      PositionModel(
        hr: hr ?? this.hr,
        l: l ?? this.l,
      );

  factory PositionModel.fromRawJson(String str) =>
      PositionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PositionModel.fromJson(Map<String, dynamic> json) => PositionModel(
        hr: json["hr"],
        l: List<L>.from(json["l"].map((x) => L.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hr": hr,
        "l": List<dynamic>.from(l.map((x) => x.toJson())),
      };
}

class L {
  String c;
  int cl;
  int sl;
  String lt0;
  String lt1;
  int qv;
  List<V> vs;

  L({
    required this.c,
    required this.cl,
    required this.sl,
    required this.lt0,
    required this.lt1,
    required this.qv,
    required this.vs,
  });

  L copyWith({
    String? c,
    int? cl,
    int? sl,
    String? lt0,
    String? lt1,
    int? qv,
    List<V>? vs,
  }) =>
      L(
        c: c ?? this.c,
        cl: cl ?? this.cl,
        sl: sl ?? this.sl,
        lt0: lt0 ?? this.lt0,
        lt1: lt1 ?? this.lt1,
        qv: qv ?? this.qv,
        vs: vs ?? this.vs,
      );

  factory L.fromRawJson(String str) => L.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory L.fromJson(Map<String, dynamic> json) => L(
        c: json["c"] ?? "",
        cl: json["cl"] ?? 0,
        sl: json["sl"] ?? 0,
        lt0: json["lt0"] ?? "",
        lt1: json["lt1"] ?? "",
        qv: json["qv"] ?? 0,
        vs: List<V>.from(json["vs"].map((x) => V.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "c": c,
        "cl": cl,
        "sl": sl,
        "lt0": lt0,
        "lt1": lt1,
        "qv": qv,
        "vs": List<dynamic>.from(vs.map((x) => x.toJson())),
      };
}

class V {
  int p;
  bool a;
  DateTime ta;
  double py;
  double px;

  V({
    required this.p,
    required this.a,
    required this.ta,
    required this.py,
    required this.px,
  });

  V copyWith({
    int? p,
    bool? a,
    DateTime? ta,
    double? py,
    double? px,
  }) =>
      V(
        p: p ?? this.p,
        a: a ?? this.a,
        ta: ta ?? this.ta,
        py: py ?? this.py,
        px: px ?? this.px,
      );

  factory V.fromRawJson(String str) => V.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory V.fromJson(Map<String, dynamic> json) => V(
        p: json["p"],
        a: json["a"],
        ta: DateTime.parse(json["ta"]),
        py: json["py"]?.toDouble(),
        px: json["px"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "p": p,
        "a": a,
        "ta": ta.toIso8601String(),
        "py": py,
        "px": px,
      };
}