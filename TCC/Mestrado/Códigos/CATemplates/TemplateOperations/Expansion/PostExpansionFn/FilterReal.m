BeginPackage["CATemplates`TemplateOperations`Expansion`PostExpansionFn`FilterReal`", {"CATemplates`CATemplate`"}];

FilterReal::usage="FilterReal[template_, expansion_] := Returns expansion if it has only elements inside of Range[0, k-1]. Otherwise, returns the vanishing function (##) & []";

Begin["`Private`"];

(* Propagates the Vanish function upwards if it receives one. *)
FilterReal[template_Association, Sequence[]] := (##) & [];

FilterReal[template_Association, expansion_List] :=
    If[SubsetQ[Range[0, k[template] - 1], 
    If[IntegerPart[#] == #, IntegerPart[#], #] & /@ expansion],
       IntegerPart[#] & /@ expansion,
       (* If the expansion is supposed to be filtered, 
   we return the special ##&[] function, which vanishes once evaluated.
          More info on:
          http://stackoverflow.com/questions/8877324/how-to-remove-
   the-null-symbol-in-a-table-in-mathematica *)
       (##) & []
     ];

End[];
EndPackage[];
