# un commencement difficile

Nous avons commmencé notre travaille en essayant de comprendre comment marche prolog et comment fonctionne les NFA. 

Par la suite, nous avons commencé a implémenté la fonction nfa_search. Dans le fond, on cherche juste a faire un patern match sur 3 cas de step importants:
    - Si le step est un "success" comme cas de base
    - Si le step est de la forme step(...) donc on traite un de deux cas:
        - Si nous avons un passage a un prochain état qui est conditionel a l'entrée, donc nous avons besoins de tester le branchement avec le prochain charactère. Si celui ci est bon, nous acceptons et renvoyons le next step a executé. Sinon, on renvoi et on essaye la prochaine condition.
        - Si nous avons un passage a un prochain état inconditionel, nous "mangeons" un charactères et nous retournons le prochain état
    - Si le step est epsilon(...), nous traitons les mêmes cas que pour step mais nous ne consomont pas de charactères. 

Or, en retournais l'état, nous ne retournons pas son contenue donc nous avons besoins d'aller chercher dans notre NFA le contenu de l'état pour l'assigner a notre prochain "step". Celà est pris en charge par une fonction ```nfa_fetch_step_content(+NFA, +State, -Res)```. 

Probleme des listes vides




# Les tests

Nous avons très vite réalisé que de tester le tout a la main serais vraiment trop compliqué. Nous avons donc trouvé que c'étais assez facile de tester notre code de facon automatisé en utilisant le framework de test de SWIPL. En faite, tout nos cas de tests sont des tests d'intégration du fait que l'on test le ouput de la fonction search/3 avec le output de notre fonction re_search/3. Nous utilisons la fonction auxiliaire suivante pour faire celà: 

``` prolog
    find_search_result(NFA, Str, A, B) :-
        findall(S, search(NFA, Str, S), A),
        findall(X, re_search(NFA, Str, X), B).
```

ainsi, nous n'avons qu'a comparé le output de A avec celui de B. 
Pour voir les tests utilisé [tp2_test.plt (via github gist)](https://gist.github.com/jeankhoury0/a6e835df89e4d1432bd6e588435d5aae)