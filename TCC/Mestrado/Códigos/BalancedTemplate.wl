(* ::Package:: *)

BeginPackage["CATemplates`TemplateGeneration`BalancedTemplate`",
  {
    "CATemplates`CA`",
    "CATemplates`CATemplate`",
    "CATemplates`TemplateOperations`Expansion`PostExpansionFn`FilterNotAllowed`",
    "CATemplates`TemplateOperations`Expansion`PostExpansionFn`FilterOutOfRange`"

  }];

BalancedTemplate::usage="Generates a template representative of all the balanced rules of a given space (defined by k and r)."

BalancedTemplateNew::usage="New method to generates a template representative of all the balanced rules of a given space (defined by k and r)."

TotalBalancedTemplates::usage="Shows the total of balanced rules rules of a given space (defined by k and r)."

TotalVar::usage="Shows the total of vars."

FilterOutOfRangeB::usage="FilterOutOfRangeB[template_, expansion_] := Returns expansion if it has only elements inside of Range[0, k-1]. Otherwise, returns the vanishing function (##) & []";

f::usage="Teste";

p::usage="Teste";

Begin["`Private`"];

FilterOutOfRangeB[template_Association, expansion_List] :=
  If[SubsetQ[Range[0, k[template] - 1], If[IntegerPart[#] == #, IntegerPart[#], #] & /@ expansion],
    IntegerPart[#] & /@ expansion,
    (* If the expansion is supposed to be filtered, we return the special ##&[] function, which vanishes once evaluated.
       More info on:
       http://stackoverflow.com/questions/8877324/how-to-remove-the-null-symbol-in-a-table-in-mathematica *)
    (##) & []
  ];

TotalVar[k_Integer: 2, r_Real: 1.0] := (k^(Ceiling[r * 2] + 1));

TotalBalancedTemplates[k_Integer: 2, r_Real: 1.0] := Factorial[TotalVar[k, r]] / (Factorial[TotalVar[k, r] / k] ^ k);

f[k_Integer, r_Real, x_Integer] := (x + 1)^(TotalVar[k, r]/k);

BalancedTemplateNew[k_Integer: 2, r_Real: 1.0] :=
 BuildTemplate[	k, 
				r, 
				Join[
						Symbol["x" <> ToString[#]] & /@ Range[TotalVar[k, r] - 1, 1, -1],  
						{							
							(
								(
									Total[f[k, r, #] & /@ Mod[Range[0, TotalVar[k, r]  - 1], k]] 
									- 
									(Total[f[k, r, Symbol["x" <> ToString[#]]] & /@ Range[TotalVar[k, r] - 1, 1, -1]])
								)
								^
								(
									1.
									/
									(TotalVar[k, r]/k)
								)
							)
							-
							1
						}
					], 
					{FilterOutOfRangeB}
			];
			
BalancedTemplate[k_Integer: 2, r_Real: 1.0] :=
 BuildTemplate[	k, 
				r, 
				Join[
						Symbol["x" <> ToString[#]] & /@ Range[TotalVar[k, r] - 1, 1, -1],  
						{
							(
								Total[
										Symbol["x" <> ToString[#]] & /@ Range[TotalVar[k, r] - 1, 1, -1]
									]
								-
								(
									(k-1)*k/2
									*
									TotalVar[k, r]
									/
									k
								)
							)
							*
							-1
						}
					], 
					{FilterOutOfRange}
			];
			
End[];
EndPackage[];