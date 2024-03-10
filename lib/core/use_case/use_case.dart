import 'package:fpdart/fpdart.dart';

import '../errors/failures.dart';

/// Abstract class that represents a use case in the application.
/// It receives a [Params] object and returns a [Future] of [Either] [Failure] or [Type].
abstract class UseCase<Type, Params> {
  /// Executes the use case with the given [params].
  ///
  /// Returns a [Future] containing either a [Failure] or the expected [Type].
  Future<Either<Failure, Type>> call(Params params);
}
