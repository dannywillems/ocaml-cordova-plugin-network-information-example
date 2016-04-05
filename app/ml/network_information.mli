(* -------------------------------------------------------------------------- *)
type connection =
  | Unknown [@js "unknown"]
  | Ethernet [@js "ethernet"]
  | Wifi [@js "wifi"]
  | Cell_2G [@js "2g"]
  | Cell_3G [@js "3g"]
  | Cell_4G [@js "4g"]
  | Cell [@js "cellular"]
  | None [@js "none"]
  [@@js.enum]

[@@@js.stop]
val connection_to_str : connection -> string
[@@@js.start]

[@@@js.implem
let connection_to_str c = match c with
  | Unknown     -> "unknown"
  | Ethernet    -> "ethernet"
  | Wifi        -> "wifi"
  | Cell_2G     -> "2g"
  | Cell_3G     -> "3g"
  | Cell_4G     -> "4g"
  | Cell        -> "cellular"
  | None        -> "none"
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val current : unit -> connection
[@@js.get "navigator.connection.type"]
(* -------------------------------------------------------------------------- *)
