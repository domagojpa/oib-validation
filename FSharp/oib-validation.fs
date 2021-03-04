open System

let modulo11_10 x1 x2 = if (x1 + x2) % 10 = 0 then 10 else (x1 + x2) % 10
let digits s = s |> Seq.map(string >> int) |> Seq.to_list |> List.rev
let CheckOib (x:String) =
  if x.Length <> 11 then false
  else  
    let succ, value = Int64.TryParse(x)
    if succ then
      let l = digits x
      l.Head = 11 - (l.Tail |> List.fold(fun x1 x2 -> (modulo11_10 x1 x2) * 2 % 11) 10)
    else
      false

Console.WriteLine((CheckOib "your_oib"))