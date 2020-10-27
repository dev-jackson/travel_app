mixin ValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue?.isEmpty ?? true;
}
