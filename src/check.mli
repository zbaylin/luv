type t = [ `Check ] Handle.t

val init : ?loop:Loop.t -> unit -> (t, Error.t) Result.result
val start : t -> (t -> unit) -> Error.t
val stop : t -> Error.t