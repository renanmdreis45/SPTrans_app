import 'dart:convert';

List<BusLineModel> BusLineModelFromJson(String str) => List<BusLineModel>.from(json.decode(str).map((x) => BusLineModel.fromJson(x)));

String BusLineModelToJson(List<BusLineModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusLineModel {
    int cl;
    bool lc;
    String lt;
    int sl;
    int tl;
    String tp;
    String ts;

    BusLineModel({
        required this.cl,
        required this.lc,
        required this.lt,
        required this.sl,
        required this.tl,
        required this.tp,
        required this.ts,
    });

    factory BusLineModel.fromJson(Map<String, dynamic> json) => BusLineModel(
        cl: json["cl"],
        lc: json["lc"],
        lt: json["lt"],
        sl: json["sl"],
        tl: json["tl"],
        tp: json["tp"],
        ts: json["ts"],
    );

    Map<String, dynamic> toJson() => {
        "cl": cl,
        "lc": lc,
        "lt": lt,
        "sl": sl,
        "tl": tl,
        "tp": tp,
        "ts": ts,
    };
}
