import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'eventos_record.g.dart';

abstract class EventosRecord
    implements Built<EventosRecord, EventosRecordBuilder> {
  static Serializer<EventosRecord> get serializer => _$eventosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Titulo_Evento')
  String get tituloEvento;

  @nullable
  @BuiltValueField(wireName: 'Descripcion')
  String get descripcion;

  @nullable
  @BuiltValueField(wireName: 'Fecha_publicacion')
  DateTime get fechaPublicacion;

  @nullable
  @BuiltValueField(wireName: 'Fecha_inicio')
  DateTime get fechaInicio;

  @nullable
  @BuiltValueField(wireName: 'Fecha_termino')
  DateTime get fechaTermino;

  @nullable
  @BuiltValueField(wireName: 'Uid_QP')
  DocumentReference get uidQP;

  @nullable
  @BuiltValueField(wireName: 'Nombre_QP')
  String get nombreQP;

  @nullable
  @BuiltValueField(wireName: 'Rol_QP')
  String get rolQP;

  @nullable
  @BuiltValueField(wireName: 'Img_ref')
  String get imgRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EventosRecordBuilder builder) => builder
    ..tituloEvento = ''
    ..descripcion = ''
    ..nombreQP = ''
    ..rolQP = ''
    ..imgRef = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Eventos');

  static Stream<EventosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EventosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EventosRecord._();
  factory EventosRecord([void Function(EventosRecordBuilder) updates]) =
      _$EventosRecord;

  static EventosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEventosRecordData({
  String tituloEvento,
  String descripcion,
  DateTime fechaPublicacion,
  DateTime fechaInicio,
  DateTime fechaTermino,
  DocumentReference uidQP,
  String nombreQP,
  String rolQP,
  String imgRef,
}) =>
    serializers.toFirestore(
        EventosRecord.serializer,
        EventosRecord((e) => e
          ..tituloEvento = tituloEvento
          ..descripcion = descripcion
          ..fechaPublicacion = fechaPublicacion
          ..fechaInicio = fechaInicio
          ..fechaTermino = fechaTermino
          ..uidQP = uidQP
          ..nombreQP = nombreQP
          ..rolQP = rolQP
          ..imgRef = imgRef));
