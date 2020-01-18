(* This file is part of Luv, released under the MIT license. See LICENSE.md for
   details, or visit https://github.com/aantron/luv/blob/master/LICENSE.md. *)



type t = [ `Check ] Handle.t

val init : ?loop:Loop.t -> unit -> (t, Error.t) result
val start : t -> (unit -> unit) -> (unit, Error.t) result
val stop : t -> (unit, Error.t) result
