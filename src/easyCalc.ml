let add x y =
  let x = Obj.repr x
  and y = Obj.repr y
  in
  match Obj.tag x, Obj.tag y with
  | 1000, 1000 -> float_of_int ((Obj.magic x : int) + (Obj.magic y : int))
  | 253, 253 -> (Obj.magic x : float) +. (Obj.magic y : float)
  | 1000, 253 -> float_of_int (Obj.magic x : int) +. (Obj.magic y : float)
  | 253, 1000 -> (Obj.magic x : float) +. float_of_int (Obj.magic y : int)
  | _ -> failwith "Unsupported types"
