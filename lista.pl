%! Obter o número de elementos de uma lista.
nelementos([],0).
nelementos([X|L1],S) :- nelementos( L1 , S1 ) , S is S1 + 1.



%! Obter o maior valor de uma lista de inteiros.
maior([X],X).
maior([X,Y|Resto],Maior) :- X >= Y , ! ,  maior([X|Resto],Maior).
maior([X,Y|Resto],Maior) :- maior([Y|Resto],Maior).



%! Obter o valor médio de uma lista de inteiros.
medio( [] , 0 ).
medio( L3 , M ) :- nelementos( L3 , C ) , soma( L3 , D ) , C \== 0 , M is D/C.

soma( [] , 0).
soma( [Y|L2] , Soma ) :- soma( L2 ,S2 ) , Soma is S2 + Y.

nelementos( [] , 0 ).
nelementos( [X|L1] , A ) :- nelementos( L1 , S1 ) , A is S1 + 1.



%! Inserir um elemento no fim da lista.
inserirfim(Elem,Lista, Lista2) :- inverter(Lista,L) , inverter([Elem|L],Lista2) .

inverter([],[]).
inverter([Elem|Resto],Lista) :- inverter(Resto,Resto1), concatenar(Resto1,[Elem],Lista).

concatenar([],Lista,Lista).
concatenar([Elemento|Lista1], Lista2 , [Elemento|Lista3]) :- concatenar(Lista1,Lista2,Lista3).



%! Obter o último elemento de uma lista.
ultimo([Elem],Elem).
ultimo([_|Resto],Elem) :- ultimo(Resto,Elem).



%! Verificar se um elemento X é adjacente a um elemento Y
adjacente(X,Y,[X,Y|_]).
adjacente(X,Y,[_|,Resto]) :- adjacente(X,Y,Resto).

Gerar	uma	lista	com	os	elementos	de	uma	faixa	(inclusive).

gerar(C,C,[C]).
gerar(A,B,[A|Lista]) :-  A > B,
                                 subtracao(A,1,R),
                                 gerar(R,B,Lista).
gerar(A,B,[A|Lista]) :-  A < B,
                                 soma(A,1,R),
                                 gerar(R,B,Lista).


soma(A,B,R) :- R is A + B.
subtracao(A,B,R) :- R is A - B.

incrementar([],[]).
incrementar([X|L1],[S|Lista]) :- incrementar(L1,Lista) , S is X + 1 .



%! Reverter uma lista.Dica: use o predicado concatenar.
reverter([],[]).
reverter([Elem|Resto],Lista) :- reverter(Resto,Resto1), concatenar(Resto1,[Elem],Lista).

concatenar([],Lista,Lista).
concatenar([Elemento|Lista1], Lista2 , [Elemento|Lista3]) :- concatenar(Lista1,Lista2,Lista3).



%! Incrementar em uma unidade cada elemento de uma lista de inteiros.
incrementar([],[]).
incrementar([X|L1],[S|Lista]) :- incrementar(L1,Lista) , S is X + 1 .



%! Linearizar uma lista de inteiros.Dica: use o predicado concatenar.
linearizar([],[]).
linearizar([Cabeca|Cauda],Lista) :- lista(Cabeca),
                                        linearizar(Cabeca,CabecaB),
                                        linearizar(Cauda,CaudaB),
                                        concatenar(CabecaB,CaudaB,Lista).
linearizar([Cabeca|Cauda],[Cabeca|CaudaA]) :- not(lista(Cabeca)),
                                                        linearizar(Cauda,CaudaA).

lista([]).
lista([_|_]).

concatenar([],Lista,Lista).
concatenar([Elemento|Lista1], Lista2 , [Elemento|Lista3]) :- concatenar(Lista1,Lista2,Lista3).

retorna([],[]).
retorna([X|L1],[X|L]) :- retorna(L1,L).



%! Remover de uma lista um elemento (todas as suas ocorrências).
remover(_,[],[]).
remover(Elemento,[Elemento|Cauda],L) :- remover(Elemento,Cauda,L).
remover(Elemento,[Elemento1|Cauda],[Elemento1|Cauda1]) :- Elemento \== Elemento1 , remover(Elemento,Cauda,Cauda1).



%! Rotacionar uma lista uma posição.
rotacionar([],[]).
rotacionar(L, R) :- excluiNprimeiros(1,L,L1), mantemNprimeiros(1,L,L2) , concatenar(L1,L2,R).

concatenar([],Lista,Lista).
concatenar([Elemento|Lista1], Lista2 , [Elemento|Lista3]) :- concatenar(Lista1,Lista2,Lista3).

mantemNprimeiros(0,L1,[]).
mantemNprimeiros(N,[X|L1],[X|Lista]) :- subtrai(N,1,P),mantemNprimeiros(P,L1,Lista).

excluiNprimeiros(0,L1,L1).
excluiNprimeiros(N,[X|L1],Lista) :- subtrai(N,1,P),excluiNprimeiros(P,L1,Lista).

subtrai(A,B,C) :- C is A-B.



%! Rotacionar uma lista n posições
rotacionarn([],[]).
rotacionarn(N,L,R) :- nelementos(L,Tamanho),
                        fatorMinimo(Tamanho,N,Deslocamento),
                        excluiNprimeiros(Deslocamento,L,L1),
                        mantemNprimeiros(Deslocamento,L,L2) ,
                        concatenar(L1,L2,R).

concatenar([],Lista,Lista).
concatenar([Elemento|Lista1], Lista2 , [Elemento|Lista3]) :- concatenar(Lista1,Lista2,Lista3).

mantemNprimeiros(0,L1,[]).
mantemNprimeiros(N,[X|L1],[X|Lista]) :- subtrai(N,1,P),mantemNprimeiros(P,L1,Lista).

excluiNprimeiros(0,L1,L1).
excluiNprimeiros(N,[X|L1],Lista) :- subtrai(N,1,P),excluiNprimeiros(P,L1,Lista).

subtrai(A,B,C) :- C is A-B.

nelementos([],0).
nelementos([X|L1],S) :- nelementos( L1 , S1 ) , S is S1 + 1.

divisao(A,B,R) :- R is A/B.

fatorMinimo(Tamanho,Valor,Resultado) :- Valor > Tamanho,
                                                subtrai(Valor,Tamanho,R),fatorMinimo(Tamanho,R,Resultado).
fatorMinimo(Tamanho,Valor,Resultado) :- Valor =< Tamanho,
                                                Resultado is Valor.
	

	
%! Ordenar uma lista de inteiros.
ordenar(Lista,ListaOrd) :- trocar(Lista,Lista1),!,ordenar(Lista1,ListaOrd).
ordenar(ListaOrd,ListaOrd).

maior(X,Y) :- X > Y.

trocar([X,Y|Cau],[Y,X|Cau]) :- maior(X,Y).
trocar([Z|Cau],[Z|Cau1]) :- trocar(Cau,Cau1).												