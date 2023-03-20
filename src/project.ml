let setup () =
  Raylib.init_window 800 450 "raylib [core] example - basic window";
  Raylib.set_target_fps 60

let rec loop () =
  if Raylib.window_should_close () then Raylib.close_window ()
  else
    let open Raylib in
    begin_drawing ();
    clear_background Color.raywhite;
    draw_text "OScratch" 10 10 48 Color.blue;
    draw_rectangle 0 60 (Raylib.get_screen_width ()) 3 Color.black;
    draw_rectangle
      (Raylib.get_screen_width () / 4)
      60 3
      (Raylib.get_screen_height ())
      Color.black;
    draw_text "Code Blocks" 10 68 16 Color.black;
    draw_text "Workspace"
      ((Raylib.get_screen_width () / 4) + 10)
      68 16 Color.black;
    end_drawing ();
    loop ()
