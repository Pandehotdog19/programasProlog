% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que agrupa los elementos
%              de un conjunto en subconjuntos disjuntos dados
%              los tamaños de los subgrupos.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que agrupa los elementos en subconjuntos disjuntos dados los tamaños.
%     static List<List<T>> Group<T>(List<T> elements, List<int> sizes)
%     {
%         List<List<T>> groups = new List<List<T>>(); // Inicializa la lista de grupos.
%         GroupHelper(elements, sizes, groups); // Llama al método auxiliar.
%         return groups; // Retorna los grupos generados.
%     }
% 
%     // Método auxiliar que agrupa recursivamente.
%     static void GroupHelper<T>(List<T> elements, List<int> sizes, List<List<T>> groups)
%     {
%         if (sizes.Count == 0) return; // Si no hay tamaños, termina.
% 
%         int size = sizes[0]; // Obtiene el tamaño del primer grupo.
%         var combinations = GetCombinations(elements, size); // Obtiene las combinaciones de ese tamaño.
%         
%         foreach (var combination in combinations) // Itera sobre las combinaciones.
%         {
%             groups.Add(combination); // Agrega la combinación a los grupos.
%             var remaining = elements.Except(combination).ToList(); // Elimina los elementos de la combinación.
%             GroupHelper(remaining, sizes.Skip(1).ToList(), groups); // Llama recursivamente con los elementos restantes.
%         }
%     }
% 
%     // Función que obtiene todas las combinaciones de un tamaño dado.
%     static List<List<T>> GetCombinations<T>(List<T> list, int k)
%     {
%         List<List<T>> result = new List<List<T>>();
%         if (k == 0) return new List<List<T>> { new List<T>() }; // Caso base.
%         
%         for (int i = 0; i < list.Count; i++)
%         {
%             var head = list[i];
%             var tail = list.Skip(i + 1).ToList(); // Obtiene el resto de la lista.
%             foreach (var combination in GetCombinations(tail, k - 1))
%             {
%                 combination.Insert(0, head); // Agrega el elemento actual a la combinación.
%                 result.Add(combination); // Agrega la combinación generada.
%             }
%         }
%         return result; // Retorna todas las combinaciones.
%     }
% 
%     static void Main()
%     {
%         List<int> elements = new List<int> { 1, 2, 3, 4, 5 }; // Lista de elementos.
%         List<int> sizes = new List<int> { 2, 3 }; // Tamaños de los grupos.
%         var groups = Group(elements, sizes); // Agrupa los elementos.
%         
%         // Imprime los grupos generados.
%         foreach (var programa27 in groups)
%         {
%             Console.WriteLine(string.Join(", ", programa27));
%         }
%     }
% }
% ----------------------------------------------


% combination(N, List, Comb) - Encuentra una combinación de tamaño N en la lista List.
combination(0, _, []).  % Caso base: una combinación de tamaño 0 es la lista vacía.
combination(N, [H|T], [H|Comb]) :- 
    N > 0, 
    N1 is N - 1, 
    combination(N1, T, Comb).  % Incluye H en la combinación.
combination(N, [_|T], Comb) :- 
    N > 0, 
    combination(N, T, Comb).  % No incluye H en la combinación.

% Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
programa27([], [], []).  % Caso base: no hay elementos ni tamaños.
programa27([N|Ns], Es, [G|Gs]) :- 
    combination(N, Es, G),           % Obtiene una combinación de tamaño N.
    subtract(Es, G, Rest),           % Resta los elementos seleccionados de la lista original.
    programa27(Ns, Rest, Gs).        % Llama recursivamente para los siguientes tamaños.

% Ejemplo de uso:
% ?- programa27([2, 3], [1, 2, 3, 4, 5], Gs).
% Gs = [[1, 2], [3, 4, 5]] ; 
% Gs = [[1, 3], [2, 4, 5]] ; 
