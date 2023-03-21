let setup () =
  Raylib.init_window 800 450 "raylib [core] example - basic window";
  Raylib.set_target_fps 60

let change_rect rect x y =
  Raylib.Rectangle.set_x rect x;
  Raylib.Rectangle.set_y rect y

let within rect x1 y1 =
  let open Raylib.Rectangle in
  if
    x rect <= x1
    && x1 <= x rect +. width rect
    && y rect <= y1
    && y1 <= y rect +. height rect
  then true
  else false

let code_rect = Raylib.Rectangle.create 10. 100. 100. 40.
let on_screen = []
let default_x = 10
let default_y = 100
let defaul_spacing = 100

let rec loop () =
  if Raylib.window_should_close () then Raylib.close_window ()
  else
    let open Raylib in
    let rect_pos_x =
      if
        is_mouse_button_down MouseButton.Left
        && within code_rect
             (float_of_int (get_mouse_x ()))
             (float_of_int (get_mouse_y ()))
      then get_mouse_x () - 50
      else int_of_float (Rectangle.x code_rect)
    and rect_pos_y =
      if
        is_mouse_button_down MouseButton.Left
        && within code_rect
             (float_of_int (get_mouse_x ()))
             (float_of_int (get_mouse_y ()))
      then get_mouse_y () - 20
      else int_of_float (Rectangle.y code_rect)
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
    change_rect code_rect (float_of_int rect_pos_x) (float_of_int rect_pos_y);
    draw_rectangle_rec code_rect Color.gold;
    draw_text "Move Cat" (rect_pos_x + 10) (rect_pos_y + 5) 16 Color.black;
    end_drawing ();
    loop ()
