% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que inserta un
%              elemento en una lista en la posición dada.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que inserta un elemento en una lista en la posición dada.
%     static List<T> InsertAt<T>(List<T> list, T item, int k)
%     {
%         if (k < 1 || k > list.Count + 1) return list;  // Verifica si K está fuera de los límites.
%         list.Insert(k - 1, item);  // Inserta el elemento en la posición k-1 (índice en C#).
%         return list;  // Retorna la lista modificada.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 4, 5 };
%         List<int> listaModificada = InsertAt(lista, 3, 3);  // Inserta el 3 en la posición 3.
%         
%         Console.WriteLine(string.Join(", ", listaModificada));  // Salida: 1, 2, 3, 4, 5
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Inserta un elemento en una lista en la posición dada.
% El índice K debe ser mayor que 0.

programa21(X, L, 1, [X|L]).    % Si K es 1, inserta el elemento al principio.
programa21(X, [H|T], K, [H|R]) :- 
    K > 1,                    % Si K es mayor que 1, continúa buscando.
    K1 is K - 1,              % Disminuye K en 1.
    programa21(X, T, K1, R).    % Llama recursivamente hasta encontrar la posición.

% Ejemplo de uso:
% ?- programa21(3, [1, 2, 4, 5], 3, R).
% R = [1, 2, 3, 4, 5].
% ----------------------------------------------
