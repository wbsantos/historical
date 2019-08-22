BeginPackage["CATemplates`CATemplate`",
  {
    "CATemplates`CA`",
    "CATemplates`TemplateOperations`Expansion`PostExpansionFn`IdentityFn`"
  }];

TemplateCoreVars::usage = "TemplateCoreVars[templateCore_List] := Gives all variables from a templateCore.";
TemplateVarFromNeighbourhood::usage = "Returns the template symbol orresponding to a given neighbourhood";
RawCore::usage="RawCore[t_List]: Receives a template core and drops any special sintax construct from it. Currently, it removes expressions of the form x \[Element] {__}.";
CoreVarsFromConstants::usage = "CoreVarsFromConstants[replacementRules_]: Receives a list of replacement rules, and converts any symbol of the type C[i_Integer] into its corresponding template core variable, preserving the index-variable duality.";

BuildTemplate::usage=
    "BuildTemplate[k_Integer, r_Real, core_List, expansion_Function]
  Builds a template that represents the subspace of the CA space given by k and r, described by the variables in <core>.
  <expansion> is the function used by ExpandTemplate to expand the built template.
BuildTemplate[k_Integer, r_Real, core_List, expansion_Function, N_Integer]
  <N> is the value of modulus used by the template generator to create <core>.";
BaseTemplateCore::usage="BaseTemplateCore[k_Integer, r_Real] := Gives only the core of BaseTemplate[k, r].";
BaseTemplate::usage="BaseTemplate[k_Integer, r_Real] := Gives the base template for the space of radius r k-ary rules.";

ValidTemplateCoreQ::usage = "Determines if a template core has a valid sintax.";

valueRestrictions::usage="valueRestrictions[t_Association]: Gets the value restrictions imposed on template t. Currently, returns all expressions of the form x \[Element] {__} present in the t's core.";
k::usage="k[t_] = Gets the number of possible states (k) for cells of the space represented by template t.";
r::usage="r[t_] = Gets the radius (r) of the family represented by template t.";
templateCore::usage="templateCore[t_] = Gets the core of template t (list of variables + fixed positions).";
expansionFunction::usage="expansionFunction[t_] = Gets the expansion function used by template t.";
postExpansionFn::usage="postExpansionFn[t_] = Gets the post expansion function used by template t.";
templateMod::usage="templateMod[t_] = Gets a templateMod number used by template t.";

Begin["`Private`"];

(* template core functions *)

BaseTemplateCore[k_Integer:2, r_Real:1.0] :=
    Symbol["x" <> ToString[#]] & /@ Range[(k^(Ceiling[r * 2] + 1)) -1, 0, -1];

TemplateCoreVars[template_Association] :=
    TemplateCoreVars[templateCore[template]];

TemplateCoreVars[templateCore_List] := 
 With[{
	symbols = Select[Union[Cases[templateCore, _Symbol, Infinity]], 
					# =!= Less && # =!= LessEqual &&  # =!= Greater && # =!= GreaterEqual &], 
	byIndex = FromDigits[StringDrop[SymbolName[#], 1]] &}, 
	SortBy[symbols, byIndex]]
  
TemplateVarFromNeighbourhood[neighbourhood_List, k_Integer: 2] :=
    Symbol["x" <> ToString@FromDigits[neighbourhood, k]];

RawCore[template_]:= template /. Element[x_,set_] -> x;

CoreVarsFromConstants[replacementRules_List] :=
    With[{freeVariableReplacementRules = Reverse /@ Select[Sort[replacementRules], MatchQ[#,Rule[_Symbol, C[_]]]&]},
      replacementRules /. freeVariableReplacementRules];

(* Builder functions *)

BuildTemplate[k_Integer, r_Real, core_List, postExpansionFn_, restrictions_List] :=
    Association["k" -> k, "r" -> r, "core" -> core, "postExpansionFn" -> postExpansionFn, "restrictions" -> restrictions];

BuildTemplate[k_Integer, r_Real, core_List, postExpansionFn_, N_Integer, restrictions_List] :=
    Association["k" -> k, "r" -> r, "core" -> core, "postExpansionFn" -> postExpansionFn, "N" -> N, "restrictions" -> restrictions];
	
	
BuildTemplate[k_Integer, r_Real, core_List] :=
    Association["k" -> k, "r" -> r, "core" -> core, "postExpansionFn" -> IdentityFn, "restrictions" -> {}];

BuildTemplate[k_Integer, r_Real, core_List, postExpansionFn_] :=
    Association["k" -> k, "r" -> r, "core" -> core, "postExpansionFn" -> postExpansionFn, "restrictions" -> {}];

BuildTemplate[k_Integer, r_Real, core_List, postExpansionFn_, N_Integer] :=
    Association["k" -> k, "r" -> r, "core" -> core, "postExpansionFn" -> postExpansionFn, "N" -> N, "restrictions" -> {}];

BaseTemplate[k_Integer:2, r_Real:1.0] :=
    BuildTemplate[k, r, BaseTemplateCore[k,r]];

(* Validators *)

ValidTemplateCoreQ[templateCore_] :=
    And @@ (MatchQ[#, (_Symbol | _Mod | _ConditionalExpression | _Integer | _Plus | _Times | _ \[Element] {__})] & /@ templateCore);

(* Accessor functions *)

k[t_Association] := t[["k"]];

r[t_Association] := t[["r"]];

templateMod[t_Association] := t[["N"]];

templateCore[t_Association] := t[["core"]];

expansionFunction[t_Association] := t[["expansionFunction"]];

postExpansionFn[t_Association] := t[["postExpansionFn"]];

valueRestrictions[template_Association]:=
    Cases[templateCore[template], x_ \[Element] set_, Infinity];

End[];

EndPackage[];
