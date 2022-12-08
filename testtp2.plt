% ["testtp2.plt"]
% run_tests.
:- include(re).

:- begin_tests(noncomplex).

    test("[C] single character with C match") :-
        find_search_result(a, "a", A, B),
        A == B. 

    test("[C] single character with C nomatch") :-
        NFA = a ,
        find_search_result(NFA, "b", A, B),
        A == B. 

    test("[ANY] single any with C match") :-
        NFA = any ,
        find_search_result(NFA, "b", A, B),
        A == B.

    test("[ANY] single any with empty match") :-
        NFA = any ,
        find_search_result(NFA, "", A, B),
        A == B.  

    test("[IN] [a,b,c] with abc") :-
        NFA = in([a,b,c]),
        find_search_result(NFA, "abc", A, B),
        A == B. 

    test("[IN] [a,c,b,z] with xyb") :-
        NFA = in([a,c,b,z]),
        find_search_result(NFA, "xyb", A, B),
        A == B.

    test("[IN] [a] with bcd") :-
        NFA = in([a]),
        find_search_result(NFA, "bcd", A, B),
        A == B.

    test("[IN] abc with bcd") :-
        NFA = in("abc"),
        find_search_result(NFA, "bcd", A, B),
        A == B.


    test("[IN] [a] with bacd") :-
        NFA = in([a]),
        find_search_result(NFA, "bacd", A, B),
        A == B.

    test("[NOTIN] [^abc] with abc") :- 
        NFA = notin([a,b,c]),
        find_search_result(NFA, "abc", A, B),
        A == B.

    test("[NOTIN] [^abc] with abdc") :- 
        NFA = notin([a,b,c]),
        find_search_result(NFA, "abdc", A, B),
        A == B.

        % case with String, might not work if only accept list
        test("[NOTIN] not(abc) with abdc") :- 
        NFA = notin("abc"),
        find_search_result(NFA, "abdc", A, B),
        A == B.

    test("[NOTIN] [^abc] with abdc") :- 
        NFA = notin([a,b,c]),
        find_search_result(NFA, "abdc", A, B),
        A == B.

    test("[EPSILON] accepte la chaine vide") :-
        NFA = "",
        find_search_result(NFA, "aaa", A, B), 
        A == B.

    test("[CONCAT] accepte [a, b] avec ab") :-
        NFA = "[a, b]",
        find_search_result(NFA, "ab", A, B),
        A == B. 


    test("[AND] accepte [any, b] avec cab") :-
        NFA = "[a, b]",
        find_search_result(NFA, "cab", A, B),
        A == B. 

    test("[OR] accepte or(a,b) avec abcd") :-
        NFA = "a" \/ "b",
        find_search_result(NFA, "cab", A, B),
        A == B. 

    test("[OR] accepte or(a,b) avec dc") :-
        NFA = "a" \/ "b",
        find_search_result(NFA, "dc", A, B),
        A == B.

    test("[OR] accepte or(a,b,c) avec abcd") :-
        NFA = "a" \/ "b" \/ "c",
        find_search_result(NFA, "abcd", A, B),
        A == B.  

    test("[OPTIONAL] accepte ?(a) avec abc") :-
        NFA = ?(a),
        find_search_result(NFA, "abc", A, B),
        A == B.  

    test("[OPTIONAL] accepte ?(a) avec c") :-
        NFA = ?(a),
        find_search_result(NFA, "c", A, B),
        A == B.  

    test("[OPTIONAL] accepte ?(a) avec a") :-
        NFA = ?(a),
        find_search_result(NFA, "a", A, B),
        A == B.  

    test("[STAR] accepte *(a) avec aaaaaaa") :- 
        NFA = *(a), 
        find_search_result(NFA, "aaaaaa", A, B),
        A == B. 

    test("[STAR] accepte *(a) avec baaaaaaa") :- 
        NFA = *(a), 
        find_search_result(NFA, "baaaaaa", A, B),
        A == B.  

    test("[STAR] accepte *(a) avec baavaaaaa") :- 
        NFA = *(a), 
        find_search_result(NFA, "baavaaaaa", A, B),
        A == B.  


    test("[*NOTNULL] accepte +(a) avec <vide> ") :-
        NFA = +(a),
        find_search_result(NFA, "", A, B),
        A == B. 

    test("[*NOTNULL] accepte +(a) avec abcd ") :-
        NFA = +(a),
        find_search_result(NFA, "abcd", A, B),
        A == B. 


:- end_tests(noncomplex).

:- begin_tests(complex).

    test("in with *" ) :-
        NFA = *(in([a, b, c])),
        STR = "abc",
        find_search_result(NFA, STR, A, B), 
        A == B.

    test("notin with *") :-
        NFA = *(notin([a, b, c])),
        STR = "abcd",
        find_search_result(NFA, STR, A, B), 
        A == B. 


:- end_tests(complex).

find_search_result(NFA, STR, A, B) :-
    findall(S, search(NFA, STR, S), A),
    findall(X, re_search(NFA, STR, X), B).
