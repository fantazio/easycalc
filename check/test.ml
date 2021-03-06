open EasyCalc

let good = ref 0

let err = ref 0

let string_of_any x =
  let x = Obj.repr x in
  match Obj.tag x with
  | 252 -> (Obj.magic x)
  | 253 -> string_of_float (Obj.magic x)
  | 1000 -> string_of_int (Obj.magic x)
  | _ -> failwith "No string conversion"


let test op x y expect error =
  let got = op x y in
  if got <> expect then begin
    prerr_endline ("Error: " ^ error ^ "  got : " ^ string_of_any got
      ^ " expected: " ^ string_of_any expect);
    incr err
  end
  else
    incr good


let print_res () =
  print_endline ("\x1b[0;32mGood: " ^ string_of_int !good);
  print_endline ("\x1b[0;31mErr: " ^ string_of_int !err);
  print_endline ("\x1b[0;34mTotal: " ^ string_of_int (!err + !good));
  let ratio = float_of_int !good /. float_of_int (!good + !err) in
  print_endline ("\x1b[0;36mSuccess ratio: " ^ string_of_float (100. *. ratio) ^"%")

let () =
  test add 1 2 3 "add 1 2";
  test add 1. 2 3. "add 1. 2";
  test add 1 2. 3. "add 1 2.";
  test add 1. 2. 3. "add 1. 2.";
  test add "str" "ing" "string" "add \"str\" \"ing\"";

  test sub 1 2 (-1) "sub 1 2";
  test sub 1. 2 (-1.) "sub 1. 2";
  test sub 1 2. (-1.) "sub 1 2.";
  test sub 1. 2. (-1.) "sub 1. 2.";

  test mul 1 2 2 "mul 1 2";
  test mul 1. 2 2. "mul 1. 2";
  test mul 1 2. 2. "mul 1 2.";
  test mul 1. 2. 2. "mul 1. 2.";

  test div 1 2 0 "div 1 2";
  test div 1. 2 0.5 "div 1. 2";
  test div 1 2. 0.5 "div 1 2.";
  test div 1. 2. 0.5 "div 1. 2.";
  print_res ()
