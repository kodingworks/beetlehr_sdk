/// Parses a time string and returns a Duration object.
///
/// The [time] parameter represents the time string to be parsed.
/// If [time] is null, null is returned.
/// The time string is expected to be in the format "HH:mm:ss".
///
/// Returns a Duration object representing the parsed time.
/// If any component of the time is not provided or cannot be parsed as an integer, it defaults to zero.
Duration? durationTimeParse(String? time) {
  if (time == null) {
    return null;
  }
  var parse = time.split(':');
  return Duration(
    hours: int.tryParse(parse.first) ?? 0,
    minutes: int.tryParse(parse[1]) ?? 0,
    seconds: int.tryParse(parse[2]) ?? 0,
  );
}
