let device_ready _ =
  let d = Dialogs.t () in
  d#alert
    (Network_information.connection_to_str (Network_information.current ()))
    (fun () -> ())
    ();
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler device_ready) Js._false
