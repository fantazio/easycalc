let _ints="ints"
let _floats="floats"
let _strings="strings"



let apply ops x y =
  try
    let x = Obj.repr x
    and y = Obj.repr y
    in
    match Obj.tag x, Obj.tag y with
    | 1000, 1000 ->
        (Hashtbl.find ops _ints) (Obj.obj x) (Obj.obj y)
    | 253, 253 ->
        (Hashtbl.find ops _floats) (Obj.obj x) (Obj.obj y)
    | 1000, 253 ->
        (Hashtbl.find ops _floats) (float_of_int (Obj.obj x)) (Obj.obj y)
    | 253, 1000 ->
        (Hashtbl.find ops _floats) (Obj.obj x) (float_of_int (Obj.obj y))
    | 252, 252 ->
        (Hashtbl.find ops _strings) (Obj.obj x) (Obj.obj y)
    | _ -> raise Not_found
  with Not_found -> failwith "Unsupported types"

let add x y =
  let ops = Hashtbl.create 2 in
  Hashtbl.add ops _ints
    (fun x y -> ((Obj.magic x) + (Obj.magic y)) |> Obj.magic);
  Hashtbl.add ops _floats
    (fun x y -> ((Obj.magic x) +. (Obj.magic y)) |> Obj.magic);
  Hashtbl.add ops _strings
    (fun x y -> ((Obj.magic x) ^ (Obj.magic y)) |> Obj.magic);
  apply ops x y

let sub x y =
  let ops = Hashtbl.create 2 in
  Hashtbl.add ops _ints
    (fun x y -> ((Obj.magic x) - (Obj.magic y)) |> Obj.magic);
  Hashtbl.add ops _floats
    (fun x y -> ((Obj.magic x) -. (Obj.magic y)) |> Obj.magic);
  apply ops x y

let mul x y =
  let ops = Hashtbl.create 2 in
  Hashtbl.add ops _ints
    (fun x y -> ((Obj.magic x) * (Obj.magic y)) |> Obj.magic);
  Hashtbl.add ops _floats
    (fun x y -> ((Obj.magic x) *. (Obj.magic y)) |> Obj.magic);
  apply ops x y

let div x y =
  let ops = Hashtbl.create 2 in
  Hashtbl.add ops _ints
    (fun x y -> ((Obj.magic x) / (Obj.magic y)) |> Obj.magic);
  Hashtbl.add ops _floats
    (fun x y -> ((Obj.magic x) /. (Obj.magic y)) |> Obj.magic);
  apply ops x y
