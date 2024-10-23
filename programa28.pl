% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista
%              de listas de acuerdo con la longitud de
%              las sublistas.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que ordena una lista de listas de acuerdo con la longitud de las sublistas.
%     static List<List<T>> LSort<T>(List<List<T>> lists)
%     {
%         return lists.OrderBy(l => l.Count).ToList(); // Ordena las listas por su longitud.
%     }
% 
%     static void Main()
%     {
%         List<List<int>> lista = new List<List<int>>
%         {
%             new List<int> { 1, 2 },
%             new List<int> { 1, 2, 3, 4 },
%             new List<int> { 1 },
%             new List<int> { 1, 2, 3 }
%         };
% 
%         List<List<int>> listaOrdenada = LSort(lista); // Ordena la lista de listas.
%         
%         // Imprime la lista ordenada.
%         foreach (var sublista in listaOrdenada)
%         {
%             Console.WriteLine($"[{string.Join(", ", sublista)}]");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
programa28(L, S) :- 
    map_list_to_pairs(length, L, P),   % Crea pares de longitud y sublistas.
    keysort(P, SP),                     % Ordena los pares por la longitud.
    pairs_values(SP, S).                % Extrae las sublistas ordenadas.

% Ejemplo de uso:
% ?- programa28([[1, 2], [1, 2, 3, 4], [1], [1, 2, 3]], S).
% S = [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4]].
% ----------------------------------------------
