let apply op x y =
  let x = Obj.repr x
  and y = Obj.repr y
  in
  match Obj.tag x, Obj.tag y with
  | 1000, 1000 -> op (float_of_int (Obj.magic x : int)) (float_of_int (Obj.magic y : int))
  | 253, 253 -> op (Obj.magic x : float) (Obj.magic y : float)
  | 1000, 253 -> op (float_of_int (Obj.magic x : int)) (Obj.magic y : float)
  | 253, 1000 -> op (Obj.magic x : float) (float_of_int (Obj.magic y : int))
  | _ -> failwith "Unsupported types"

let add x y = apply ( +. ) x y
let sub x y = apply ( -. ) x y
let mul x y = apply ( *. ) x y
let div x y = apply ( /. ) x y
