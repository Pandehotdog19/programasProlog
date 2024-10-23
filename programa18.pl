% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que extrae
%              una porción de una lista, dado un rango.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que extrae una porción de una lista desde el índice I hasta K.
%     static List<T> Slice<T>(List<T> list, int i, int k)
%     {
%         if (i < 1 || k < 1 || i > k || k > list.Count)
%             throw new ArgumentException("Índices fuera de rango.");
%         
%         return list.GetRange(i - 1, k - i + 1); // Extrae la sublista desde el índice I a K.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6 };
%         List<int> porcion = Slice(lista, 2, 4); // Extrae los elementos entre los índices 2 y 4.
%         
%         Console.WriteLine(string.Join(", ", porcion)); // Salida: 2, 3, 4
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Extrae una porción de una lista dado un rango.
% Los índices I y K deben ser mayores que 0.

% Caso base: cuando I y K son 1, se extrae solo el primer elemento.
programa18([H|_], 1, 1, [H]).

% Caso recursivo: si I es 1 y K > 1, extrae el primer elemento y sigue con la cola.
programa18([H|T], 1, K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    programa18(T, 1, K1, R).

% Caso recursivo: si I > 1, se ignoran los primeros elementos hasta llegar al índice I.
programa18([_|T], I, K, R) :-
    I > 1,
    I1 is I - 1,
    K1 is K - 1,
    programa18(T, I1, K1, R).

% Ejemplo de uso:
% ?- programa18([a, b, c, d, e, f], 2, 4, L).
% L = [b, c, d].
% ----------------------------------------------
