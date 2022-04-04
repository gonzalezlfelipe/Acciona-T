import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reporte_record.g.dart';

abstract class ReporteRecord
    implements Built<ReporteRecord, ReporteRecordBuilder> {
  static Serializer<ReporteRecord> get serializer => _$reporteRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Lugar')
  String get lugar;

  @nullable
  @BuiltValueField(wireName: 'Tipo_reporte')
  String get tipoReporte;

  @nullable
  @BuiltValueField(wireName: 'Descripcion')
  String get descripcion;

  @nullable
  @BuiltValueField(wireName: 'Uid_QP')
  DocumentReference get uidQP;

  @nullable
  @BuiltValueField(wireName: 'Img_ref')
  String get imgRef;

  @nullable
  @BuiltValueField(wireName: 'Nombre_QP')
  String get nombreQP;

  @nullable
  @BuiltValueField(wireName: 'Rol_QP')
  String get rolQP;

  @nullable
  @BuiltValueField(wireName: 'Comentario_AE')
  String get comentarioAE;

  @nullable
  @BuiltValueField(wireName: 'Fecha_reporte')
  DateTime get fechaReporte;

  @nullable
  @BuiltValueField(wireName: 'Reporte_visto')
  bool get reporteVisto;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReporteRecordBuilder builder) => builder
    ..lugar = ''
    ..tipoReporte = ''
    ..descripcion = ''
    ..imgRef = ''
    ..nombreQP = ''
    ..rolQP = ''
    ..comentarioAE = ''
    ..reporteVisto = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reporte');

  static Stream<ReporteRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ReporteRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReporteRecord._();
  factory ReporteRecord([void Function(ReporteRecordBuilder) updates]) =
      _$ReporteRecord;

  static ReporteRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createReporteRecordData({
  String lugar,
  String tipoReporte,
  String descripcion,
  DocumentReference uidQP,
  String imgRef,
  String nombreQP,
  String rolQP,
  String comentarioAE,
  DateTime fechaReporte,
  bool reporteVisto,
}) =>
    serializers.toFirestore(
        ReporteRecord.serializer,
        ReporteRecord((r) => r
          ..lugar = lugar
          ..tipoReporte = tipoReporte
          ..descripcion = descripcion
          ..uidQP = uidQP
          ..imgRef = imgRef
          ..nombreQP = nombreQP
          ..rolQP = rolQP
          ..comentarioAE = comentarioAE
          ..fechaReporte = fechaReporte
          ..reporteVisto = reporteVisto));
