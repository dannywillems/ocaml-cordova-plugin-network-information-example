let device_ready _ =
  let d = Cordova_dialogs.t () in
  d#alert
    (Cordova_network_information.connection_to_str
    (Cordova_network_information.current ()))
    (fun () -> ())
    ();
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler device_ready) Js._false
