let on_device_ready () =
  let d = Cordova_dialogs.t () in
  d#alert
    (Cordova_network_information.connection_to_str
    (Cordova_network_information.current ()))
    ()

let _ = Cordova.Event.device_ready on_device_ready
