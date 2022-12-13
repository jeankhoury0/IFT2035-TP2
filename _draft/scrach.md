search(["(", name(k,*(any)), "=", name(v,*(any)), ")"]
,"(age=23) and (position=straight)", 
Res)




["(", name(k,*(any)), "=", name(v,*(any)), ")"]

"("
OR
name(k,*(any))
OR
= 
or
name(v,*(any))
or 
)

[''="(age=23) and (position=straight)", k="age=23) and (position", v="straight"]


nfa_search([s0 = step(s1), s1 = epsilon([], [s0, s2])), s2 = success], "hello", Res).
nfa_search([s0 = step(s1), s1 = epsilon([], [s0, s2]), s2 = success],"hello", Res).


nfa_search([s0 = step([(108 -> s1), (101 -> s1)]), s1 = epsilon([], [s0, s2]), s2 = success], "hello", Res).



---------
Step(accept_char, State) :- NextState IF match accept_char 
Step(State) :- NextState

s0 = step(["a" -> S1], ["b" -> S0])


search(["(", name(k,*(any)), "=", name(v,*(any)), ")"], "(age=23) and (position=straight)", Res)

## IMPORTANT SHIT
- in s1 not S1

## Stuff to include in the rapport
- 

## Test Function 

to check for success
nfa_search([S0 = step(S0)], "hello", Res).

to check normal step excecution
nfa_search([S0 = step(s1), s1 = success], "h", Res).

nfa_search([s0 = step([('a' -> s1), ('b' -> s0)]), s1 = success], "aab", Res).


----------------------------

nfa_search([s0 = step([('a' -> s1), ('b' -> s0)]), s1 = success], "aab", Res).

1. Detection de *step* patern match
2. 

% nfa_handle_step(+Step, +String, -State, -Tail)
nfa_handle_step(
    Step: [('a' -> s1), ('b' -> s0)])],
    String: bab, 
    state: unknown_for_now,
    tail: unknown_for_now
    )

nfa_handle_step 
- Cas ou step(s1)
    > nfa_handle_step(Step, [Char | Tail], Step, Tail).
    retourner a l'appel: 
        - State: step where we are now
        - Tail: what is left AKA what we didnt eat
- Cas ou le array
    > nfa_handle_step(
        [(Cond, StateToBe)| Rest],
        [Char | Str],
        State, Tail)
    if Cond == Char:
        State = StateToBe
        Tail = Str
    else: 
        nfa_handle_step(Rest, [Char | Str], )
        


a
s0 = step(s1)
s0 = step(ANY, s1)




nfa_search_step 


step(S0)
step([char -> step ])
step([(char1 -> step1), char2 -> step2]) case

epsilon = epsilon([], [L|Ls])






[ s1b = step([('a' -> s1a)]), s1a = epsilon([], [s1b, s2]), s2 = step([('a' -> s3)]), s3 = success ] 


nfa_search([ s1b = step([(97 -> s1a)]), s1a = epsilon([], [s1b, s2]), s2 = step([(97 -> s3)]), s3 = success ], "aaaa", Res).



epsilon([], [s0, s1])



nfa_match(NFA, epsilon(Marks, [NextState | NextStates]), Mark, Str, Group, Tail):-
    writeln("THIS WORK"),
    writeln(NextStates),
    nfa_fetch_step_content(NFA, NextState, NewStep),
    writeln("here"),
    writeln(NewStep),
    writeln("nope"),
    nfa_match(NFA, NewStep, Mark, Str, Group, Tail);
    nfa_fetch_step_content(NFA, NextState, NewStep),
    writeln("THIS GOT executed"),
    nfa_match(NFA, epsilon(Marks, NextStates), Mark, Str, Group, Tail)
    .
    %% missisng the NextStates




----------



[s0 = step([(108 -> s1), (101 -> s1)]), s1 = step(s2), s2 = success]


----------


search(["(", name(k,*(any)), "=", name(v,*(any)), ")"], "(age=23) and (position=straight)", Res)


[
    s41= step([(40->s37)]),
    s37= epsilon([beg(k)],[s40,s36]),
    s38 = epsilon([end(k)],[s36]),
    s39 = epsilon([],[s40,s36]),
    s40 = step(s39),
    s36 = step([(61->s32)]),
    s32 = epsilon([beg(v)],[s35,s31]),
    s33 = epsilon([end(v)],[s31]),
    s34 = epsilon([],[s35,s31]),
    s35 = step(s34),
    s31 = step([(41->s30)]),
    s30 = success]


[
    s65=step([(40->s61)]),
    s61=epsilon([beg(k)],[s63]),
    s62=epsilon([end(k)],[s60]),
    s63=epsilon([],[s64,s62]),
    s64=step(s63),
    s60=step([(61->s56)]),
    s56=epsilon([beg(v)],[s58]),
    s57=epsilon([end(v)],[s55]),
    s58=epsilon([],[s59,s57]),
    s59=step(s58),
    s55=step([(41->s54)])]