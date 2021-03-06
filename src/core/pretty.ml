(** Pretty printing for external and internal syntax.

    @see http://caml.inria.fr/resources/doc/guides/format.html
    This explains the various "@" escape sequences used inside format
    strings, which control boxes.
*)

(* Explanation of formatting markup:

   "@[" opens a box (open_box 0).  You may specify more information
          with an argument, e.g., "@[<hov n>" is equivalent to open_hovbox n.

   "@]" closes a box (close_box ()).

   "@ " outputs a breakable space (print_space ()).

   "@," outputs a break hint (print_cut ()).

   "@." ends the pretty-printing, closing all boxes still opened (print_newline ()).

   "@;<n m>" emits a "full" break hint (print_break n m).

   "@?" outputs pending material in the pretty-printer queue (print_flush ()).

  Important tips:
    - Use "@ " for a break.  Don't use " @ " unless you want more than one space.
    - If you want a newline (for example, before the branch of a case expression),
      you need to do something like this:

           "@[<v>@[%a@]@ @[%a@]@]"

      The "@[<v>" begins a "vertical-only box", in which all breaks are newlines.
      (With a normal box, a break will only write a newline if the right margin is reached.)
      The @[ @] around the two %a's are "horizontal-or-vertical boxes", to ensure that
      breaks generated by the formatting functions called via %a aren't all vertical.
      Otherwise, you'll get output like

           case blah
                ([g]
                 T
                 ..) of
*)

module Common = Prettycom
module Int = Prettyint
module Ext = Prettyext
