% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que genera todas
%              las combinaciones de K elementos seleccionados
%              de una lista dada.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que genera todas las combinaciones de K elementos de una lista.
%     static List<List<T>> Combinations<T>(List<T> list, int k)
%     {
%         List<List<T>> result = new List<List<T>>(); // Inicializa la lista de resultados.
%         CombinationsHelper(list, k, 0, new List<T>(), result); // Llama al método auxiliar.
%         return result; // Retorna la lista de combinaciones.
%     }
% 
%     // Método auxiliar que genera combinaciones recursivamente.
%     static void CombinationsHelper<T>(List<T> list, int k, int start, List<T> current, List<List<T>> result)
%     {
%         if (k == 0) // Si k es 0, se ha encontrado una combinación.
%         {
%             result.Add(new List<T>(current)); // Agrega la combinación actual a los resultados.
%             return;
%         }
% 
%         for (int i = start; i < list.Count; i++) // Itera sobre la lista.
%         {
%             current.Add(list[i]); // Agrega el elemento actual a la combinación.
%             CombinationsHelper(list, k - 1, i + 1, current, result); // Llama recursivamente.
%             current.RemoveAt(current.Count - 1); // Elimina el último elemento (backtracking).
%         }
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4 }; // Lista de entrada.
%         int k = 2; // Número de elementos en cada combinación.
%         List<List<int>> combinaciones = Combinations(lista, k); // Genera las combinaciones.
%         
%         // Imprime las combinaciones generadas.
%         foreach (var combinacion in combinaciones)
%         {
%             Console.WriteLine(string.Join(", ", combinacion));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
programa26(0, _, []).  % Caso base: 0 elementos significa una combinación vacía.
programa26(K, [H|T], [H|Comb]) :- 
    K > 0, 
    K1 is K - 1, 
    programa26(K1, T, Comb).  % Incluye el elemento H en la combinación.
programa26(K, [_|T], Comb) :- 
    K > 0, 
    programa26(K, T, Comb).  % Excluye el elemento actual y continúa.

% Ejemplo de uso:
% ?- programa26(2, [1, 2, 3, 4], Comb).
% Comb = [1, 2] ; 
% Comb = [1, 3] ; 
% Comb = [1, 4] ; 
% Comb = [2, 3] ; 
% Comb = [2, 4] ; 
% Comb = [3, 4] ; 
% false.
% ----------------------------------------------
