#load "unix.cma"

let () =
  if Sys.file_exists "libuv/build/gyp" then
    exit 0;

  (try Unix.mkdir "libuv/build" 0o755
  with Unix.Unix_error (Unix.EEXIST, _, _) -> ());

  Unix.symlink "../../gyp" "libuv/build/gyp"
