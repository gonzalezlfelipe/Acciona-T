import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'actividades_curso_record.g.dart';

abstract class ActividadesCursoRecord
    implements Built<ActividadesCursoRecord, ActividadesCursoRecordBuilder> {
  static Serializer<ActividadesCursoRecord> get serializer =>
      _$actividadesCursoRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Titulo')
  String get titulo;

  @nullable
  @BuiltValueField(wireName: 'Descripcion')
  String get descripcion;

  @nullable
  @BuiltValueField(wireName: 'Tipo')
  String get tipo;

  @nullable
  @BuiltValueField(wireName: 'Fecha_Creacion')
  DateTime get fechaCreacion;

  @nullable
  @BuiltValueField(wireName: 'Fecha_termino')
  DateTime get fechaTermino;

  @nullable
  @BuiltValueField(wireName: 'Nombre_QP')
  String get nombreQP;

  @nullable
  @BuiltValueField(wireName: 'Rol_QP')
  String get rolQP;

  @nullable
  @BuiltValueField(wireName: 'Uid_QP')
  DocumentReference get uidQP;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ActividadesCursoRecordBuilder builder) =>
      builder
        ..titulo = ''
        ..descripcion = ''
        ..tipo = ''
        ..nombreQP = ''
        ..rolQP = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ActividadesCurso');

  static Stream<ActividadesCursoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ActividadesCursoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ActividadesCursoRecord._();
  factory ActividadesCursoRecord(
          [void Function(ActividadesCursoRecordBuilder) updates]) =
      _$ActividadesCursoRecord;

  static ActividadesCursoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createActividadesCursoRecordData({
  String titulo,
  String descripcion,
  String tipo,
  DateTime fechaCreacion,
  DateTime fechaTermino,
  String nombreQP,
  String rolQP,
  DocumentReference uidQP,
}) =>
    serializers.toFirestore(
        ActividadesCursoRecord.serializer,
        ActividadesCursoRecord((a) => a
          ..titulo = titulo
          ..descripcion = descripcion
          ..tipo = tipo
          ..fechaCreacion = fechaCreacion
          ..fechaTermino = fechaTermino
          ..nombreQP = nombreQP
          ..rolQP = rolQP
          ..uidQP = uidQP));
