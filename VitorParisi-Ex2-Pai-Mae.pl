%------- FUNCOES PARA EXECUTAR ----------
pai(joao,carlos).
pai(joao, lia).
pai(jose,pedro).
pai(jose, bento).
pai(pedro, claudia).
pai(pedro, mauro).
pai(mauro,eduardo).
pai(mauro,paula).


mae(maria,carlos).
mae(maria,lia).
mae(alice,pedro).
mae(alice,bento).
mae(lia, claudia).
mae(lia, mauro).

m(maria). 
m(lia).
m(alice). 
m(claudia). 
m(paula).
h(joao). 
h(carlos). 
h(jose). 
h(bento). 
h(pedro). 
h(mauro). 
h(eduardo).

%avo(X,paula)
%avoa(lia,X)
avo(A,C) :- h(A),pai(A,B), pai(B,C).
avo(A,C) :- h(A),pai(A,B), mae(B,C).
avoa(A,C) :- m(A),mae(A,B), pai(B,C).
avoa(A,C) :- m(A),mae(A,B), mae(B,C).

%irma(X,mauro).
%irma(X,claudia).
irmao(A,B) :- h(A),pai(P,A), pai(P,B), mae(M,A), mae(M,B), A \== B.
irma(A,B) :- m(A),pai(P,A), pai(P,B), mae(M,A), mae(M,B), A \== B.

%tio_avo(X,paula)
%tio_avo(bento,X).
tio_avo(A,D) :- avo(B,D), irmao(A,B).
tio_avo(A,D) :- avoa(B,D), irmao(A,B).
tio_avoa(A,D) :- avo(B,D), irma(A,B).
tio_avoa(A,D) :- avoa(B,D), irma(A,B).

%tio(bento,X).
%tia(X,paula).
tio(A,C) :- pai(B,C), irmao(A,B).
tio(A,C) :- mae(B,C), irmao(A,B).
tia(A,C) :- pai(B,C), irma(A,B).
tia(A,C) :- mae(B,C), irma(A,B).

%filha(lia,X).
%filho(lia,X).
filho(A,B) :-h(B), pai(B,A).
filho(A,B) :-h(B), mae(B,A).
filha(A,B) :-m(B),pai(B,A).
filha(A,B) :-m(B),mae(B,A).

%neto(mauro,X).
%neta(X,joao).
neto(A,C) :- h(A),filho(B,C), filho(A,B).
neto(A,C) :- h(A),filha(B,C), filho(A,B).
neta(A,C) :- m(A),filho(B,C), filha(A,B).
neta(A,C) :- m(A),filha(B,C), filha(A,B).
