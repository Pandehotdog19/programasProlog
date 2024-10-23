% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que elimina el
%              k-ésimo elemento de una lista.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que elimina el k-ésimo elemento de una lista.
%     static List<T> RemoveAt<T>(List<T> list, int k)
%     {
%         if (k < 1 || k > list.Count) return list;  // Verifica si K está fuera de los límites.
%         list.RemoveAt(k - 1);  // Elimina el k-ésimo elemento (el índice en C# comienza en 0).
%         return list;  // Retorna la lista modificada.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
%         List<int> listaModificada = RemoveAt(lista, 3);  // Elimina el 3er elemento.
%         
%         Console.WriteLine(string.Join(", ", listaModificada));  // Salida: 1, 2, 4, 5
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Elimina el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.

programa20(X, [X|T], 1, T).    % Si K es 1, elimina el primer elemento.
programa20(X, [H|T], K, [H|R]) :- 
    K > 1,                    % Si K es mayor que 1, continúa buscando.
    K1 is K - 1,              % Disminuye K en 1.
    programa20(X, T, K1, R).    % Llama recursivamente hasta encontrar el k-ésimo elemento.

% Ejemplo de uso:
% ?- programa20(X, [1, 2, 3, 4, 5], 3, R).
% X = 3,
% R = [1, 2, 4, 5].
% ----------------------------------------------
