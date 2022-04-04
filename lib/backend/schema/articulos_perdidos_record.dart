import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'articulos_perdidos_record.g.dart';

abstract class ArticulosPerdidosRecord
    implements Built<ArticulosPerdidosRecord, ArticulosPerdidosRecordBuilder> {
  static Serializer<ArticulosPerdidosRecord> get serializer =>
      _$articulosPerdidosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Nombre_articulo')
  String get nombreArticulo;

  @nullable
  @BuiltValueField(wireName: 'Detalle')
  String get detalle;

  @nullable
  @BuiltValueField(wireName: 'Img_ref')
  String get imgRef;

  @nullable
  @BuiltValueField(wireName: 'N_contacto')
  String get nContacto;

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
  @BuiltValueField(wireName: 'Fecha_publicacion')
  DateTime get fechaPublicacion;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ArticulosPerdidosRecordBuilder builder) =>
      builder
        ..nombreArticulo = ''
        ..detalle = ''
        ..imgRef = ''
        ..nContacto = ''
        ..nombreQP = ''
        ..rolQP = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Articulos_perdidos');

  static Stream<ArticulosPerdidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ArticulosPerdidosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ArticulosPerdidosRecord._();
  factory ArticulosPerdidosRecord(
          [void Function(ArticulosPerdidosRecordBuilder) updates]) =
      _$ArticulosPerdidosRecord;

  static ArticulosPerdidosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createArticulosPerdidosRecordData({
  String nombreArticulo,
  String detalle,
  String imgRef,
  String nContacto,
  String nombreQP,
  String rolQP,
  DocumentReference uidQP,
  DateTime fechaPublicacion,
}) =>
    serializers.toFirestore(
        ArticulosPerdidosRecord.serializer,
        ArticulosPerdidosRecord((a) => a
          ..nombreArticulo = nombreArticulo
          ..detalle = detalle
          ..imgRef = imgRef
          ..nContacto = nContacto
          ..nombreQP = nombreQP
          ..rolQP = rolQP
          ..uidQP = uidQP
          ..fechaPublicacion = fechaPublicacion));
