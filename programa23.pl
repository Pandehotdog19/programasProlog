% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que extrae un número
%              dado de elementos aleatorios de una lista.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% ... [tu código en C# aquí] ...
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Obtiene el elemento en la posición I de la lista L.
element_at(X, [X|_], 1). % Si la posición es 1, el primer elemento es X.
element_at(X, [_|T], I) :- 
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1). % Recurre en la cola de la lista con posición decreciente.

% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
programa23(_, 0, []).  % Caso base: si N es 0, la lista resultante es vacía.
programa23(L, N, [X|R]) :- 
    length(L, Len),            % Obtiene la longitud de la lista.
    random(1, Len, I),         % Genera un índice aleatorio entre 1 y Len.
    element_at(X, L, I),       % Obtiene el elemento en la posición I de la lista.
    delete(L, X, L1),          % Elimina el elemento seleccionado de la lista.
    N1 is N - 1,               % Decrementa N.
    programa23(L1, N1, R).     % Llama recursivamente para seleccionar el resto.

% Ejemplo de uso:
% ?- programa23([1, 2, 3, 4, 5], 2, R).
% R = [X1, X2].  (donde X1 y X2 son elementos aleatorios de la lista).
% ----------------------------------------------
