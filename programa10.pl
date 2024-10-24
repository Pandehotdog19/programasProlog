% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que codifica 
%              una lista usando codificación Run-Length.
% ===============================================

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
programa10(L, R) :- 
    pack(L, P), 
    transform(P, R).

% Agrupa elementos consecutivos en sublistas.
pack([], []).
pack([H|T], [[H|Group]|Rest]) :- 
    take_while(T, H, Group, Rest).

% Toma elementos mientras cumplan la condición.
take_while([], _, [], []).
take_while([H|T], H, [H|Group], Rest) :- 
    take_while(T, H, Group, Rest).
take_while([H|T], X, [], [H|T]) :- 
    H \= X.

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- 
    length([X|Xs], N), 
    transform(Ys, Zs).

% Ejemplo de uso:
% ?- programa10([a, a, b, b, c, a, a, d], R).
% R = [[2, a], [2, b], [1, c], [2, a], [1, d]].
% ===============================================
