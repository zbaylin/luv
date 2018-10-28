type 'kind t = 'kind C.Types.Stream.stream Handle.t

val shutdown : _ t -> (Error.t -> unit) -> unit
(* DOC If backlog not provided, SOMAXCONN specified *)
val listen : ?backlog:int -> _ t -> (Error.t -> unit) -> unit
val accept : server:'kind t -> client:'kind t -> Error.t

(* DOC Document how to use allocate and read_stop together for in-place
   reading into a single buffer. *)
val read_start :
  ?allocate:(int -> Bigstring.t) ->
  _ t ->
  ((Bigstring.t * int, Error.t) Result.result -> unit) ->
    unit
val read_stop : _ t -> Error.t
(* TODO Is the data always written to the beginning of the buffer? *)

(* DOC how to use Array1.sub to create views into the arrays. *)
val write :
  ?send_handle:[< `TCP | `Pipe ] t ->
  _ t ->
  Bigstring.t list ->
  (Error.t -> unit) ->
    unit

val try_write : _ t -> Bigstring.t list -> (int, Error.t) Result.result
val is_readable : _ t -> bool
val is_writable : _ t -> bool
val set_blocking : _ t -> bool -> Error.t
val get_write_queue_size : _ t -> int

(**/**)

module Connect_request :
sig
  type t = [ `Connect ] Request.t
  val make : unit -> t
  val trampoline :
    (C.Types.Stream.Connect_request.t Ctypes.ptr -> Error.t -> unit)
      Ctypes.static_funptr
end

val coerce : _ t -> [ `Base ] t