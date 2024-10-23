% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista
%              de listas de acuerdo con la frecuencia
%              de la longitud de las sublistas.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que cuenta la frecuencia de la longitud de sublistas y las ordena.
%     static List<KeyValuePair<int, int>> LengthFrequency<T>(List<List<T>> lists)
%     {
%         // Crea un diccionario para contar la frecuencia de las longitudes.
%         var frequency = new Dictionary<int, int>();
%         
%         foreach (var list in lists)
%         {
%             int length = list.Count;  // Obtiene la longitud de la sublista.
%             if (frequency.ContainsKey(length))
%                 frequency[length]++; // Incrementa la frecuencia.
%             else
%                 frequency[length] = 1; // Inicializa la frecuencia.
%         }
%         
%         // Ordena por la longitud y retorna como una lista de pares (longitud, frecuencia).
%         return frequency.OrderBy(kvp => kvp.Key).ToList();
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
%         var frecuencias = LengthFrequency(lista); // Obtiene la frecuencia de las longitudes.
%         
%         // Imprime las longitudes y sus frecuencias.
%         foreach (var pair in frecuencias)
%         {
%             Console.WriteLine($"Longitud: {pair.Key}, Frecuencia: {pair.Value}");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
programa29(L, F) :- 
    map_list_to_pairs(length, L, P),  % Crea pares de longitud y sublistas.
    msort(P, SP),                     % Ordena los pares por la longitud.
    encode(SP, F).                    % Codifica la frecuencia de las longitudes.

% Ejemplo de uso:
% ?- programa29([[1, 2], [1, 2, 3, 4], [1], [1, 2, 3]], F).
% F = [[1, 1], [2, 2], [4, 1]].
% ----------------------------------------------
