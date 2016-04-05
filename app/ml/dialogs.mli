type button_response =
  | Ok [@js 1]
  | Cancel [@js 2]
  | Back_button [@js 0]
  [@@js.enum]

class notification : Ojs.t ->
  object
    inherit Ojs.obj
    (* Show an alert with a button *)
    (* alert [message] [callback] *)
    method alert :  string                                      ->
                    (unit -> unit)                              ->
                    ?title:(string [@js.default "Alert"])       ->
                    ?button_text:(string [@js.default "OK"])    ->
                    unit                                        ->
                    unit

    (* Show an alert with two buttons:
      * - message
      * - callback when the button is pressed taking the index of the pressed
      * button as argument.
      * - title of the alert box
      * - array of 2 elements for buttons text.
      *)
    method confirm :  string                                      ->
                      (button_response -> unit)                   ->
                      ?title:(string [@js.default "Confirm"])     ->
                      ?button_labels:(string array [@js.default
                        [|"OK";"Cancel"|]])                       ->
                      unit                                        ->
                      unit

    (* Show a prompt with a button:
      * - message
      * - callback when the button is pressed taking the index of the pressed
      * button as argument.
      * - title of the alert box
      * - array of 2 elements for buttons text
      * - default text in the input
      *)
    method prompt : string                                              ->
                    (button_response -> unit)                           ->
                    ?title:(string [@js.default "Prompt"])              ->
                    ?button_label:(string array [@js.default [|"OK";
                      "Cancel"|]])                                      ->
                    ?default_text:(string [@js.default ""])             ->
                    unit                                                ->
                    unit

    (* Beep
     * - The number of times to repeat the beep
     * *)
    method beep   : int -> unit
  end

(* -------------------------------------------------------------------------- *)
val t : unit -> notification
[@@js.get "navigator.notification"]
(* -------------------------------------------------------------------------- *)
