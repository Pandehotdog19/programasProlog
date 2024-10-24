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
pack([], []). % Caso base para lista vacía.
pack([H|T], [[H|Group]|Rest]) :- 
    take_while(T, H, Group, NewRest), % Modificamos para que devuelva también el resto de la lista.
    pack(NewRest, Rest). % Llamada recursiva para procesar el resto.

% Toma elementos mientras cumplan la condición (son iguales).
take_while([], _, [], []). % Caso base: si no hay más elementos.
take_while([H|T], H, [H|Group], Rest) :- % Si el elemento es igual al anterior, agrúpalo.
    take_while(T, H, Group, Rest). % Continua agrupando.
take_while([H|T], X, [], [H|T]) :- % Cuando cambia el elemento, corta la agrupación.
    H \= X. % Los elementos no son iguales.

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []). % Caso base para listas vacías.
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- 
    length([X|Xs], N),  % Calcula la longitud de la sublista.
    transform(Ys, Zs).  % Aplica recursivamente al resto de las sublistas.
    
% Ejemplo de uso:
% ?- programa10([a, a, b, b, c, a, a, d], R).
% R = [[2, a], [2, b], [1, c], [2, a], [1, d]].
% ===============================================
