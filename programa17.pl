% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que divide 
%              una lista en dos partes.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que divide una lista en dos partes en C#.
%     static void Split<T>(List<T> list, int n, out List<T> part1, out List<T> part2)
%     {
%         if (n < 0 || n > list.Count)
%             throw new ArgumentException("El valor de N está fuera del rango válido.");
%         
%         part1 = list.GetRange(0, n); // Primera parte de la lista con N elementos.
%         part2 = list.GetRange(n, list.Count - n); // Resto de la lista.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6 };
%         Split(lista, 3, out List<int> parte1, out List<int> parte2);
%         
%         Console.WriteLine(string.Join(", ", parte1)); // Salida: 1, 2, 3
%         Console.WriteLine(string.Join(", ", parte2)); // Salida: 4, 5, 6
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Divide una lista en dos partes.
% La longitud de la primera parte está dada por el segundo argumento.
programa17(L, 0, [], L).  % Caso base: si N es 0, la primera parte es vacía y la segunda es la lista completa.
programa17([H|T], N, [H|L1], L2) :-  % Caso recursivo: reduce N y mueve el primer elemento a la primera parte.
    N > 0,
    N1 is N - 1,
    programa17(T, N1, L1, L2).

% Ejemplo de uso:
% ?- programa17([1, 2, 3, 4, 5, 6], 3, L1, L2).
% L1 = [1, 2, 3],
% L2 = [4, 5, 6].
% ----------------------------------------------
