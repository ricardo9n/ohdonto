abstract class Usecase<TReturn, TParam> {
  Future<TReturn> call({required TParam? param});
}
