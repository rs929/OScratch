let setup () =
  Raylib.init_window 800 450 "raylib [core] example - basic window";
  Raylib.set_target_fps 60

let rec draw_block () =
  let open Raylib in
  begin_drawing ();
  draw_rectangle (get_mouse_x () - 5) (get_mouse_y () - 5) 10 10 Color.blue;
  end_drawing ();
  draw_block ()

let default_x = 10
let default_y = 100
let defaul_spacing = 100

let rec loop () =
  if Raylib.window_should_close () then Raylib.close_window ()
  else
    let open Raylib in
    let rect_pos_x =
      if is_mouse_button_down MouseButton.Left then get_mouse_x ()
      else default_x
    and rect_pos_y =
      if is_mouse_button_down MouseButton.Left then get_mouse_y ()
      else default_y
    in
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
    draw_rectangle rect_pos_x rect_pos_y 100 20 Color.gold;
    draw_text "Move Cat" (rect_pos_x + 10) (rect_pos_y + 5) 16 Color.black;
    end_drawing ();
    loop ()
