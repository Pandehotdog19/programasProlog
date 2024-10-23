% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 22 de octubre de 2024
% Descripción: Duplica los elementos de una lista un número dado de veces.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Función que duplica los elementos de una lista un número dado de veces.
%     static List<T> Duplicate<T>(List<T> list, int times)
%     {
%         List<T> result = new List<T>();
%         foreach (var item in list) // Recorre cada elemento de la lista
%         {
%             for (int i = 0; i < times; i++) // Duplica el elemento 'times' veces
%             {
%                 result.Add(item); // Agrega el elemento duplicado a la lista de resultados
%             }
%         }
%         return result; // Retorna la lista resultante
%     }

%     // Función principal.
%     static void Main()
%     {
%         List<int> numbers = new List<int> { 1, 2, 3 }; // Lista de ejemplo
%         int times = 2; // Número de repeticiones
%         var duplicatedList = Duplicate(numbers, times); // Duplica los elementos
%         Console.WriteLine(string.Join(", ", duplicatedList)); // Imprime la lista duplicada
%     }
% }
% ----------------------------------------------

% Duplica los elementos de una lista un número dado de veces.
% Caso base: la lista vacía se mantiene vacía.
programa15([], _, []).

% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
programa15([H|T], N, R) :- 
    duplicate(H, N, D),        % Duplica el elemento H N veces.
    programa15(T, N, R1),          % Procesa el resto de la lista.
    append(D, R1, R).          % Combina la lista duplicada con el resto.

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).          % Caso base: 0 repeticiones resultan en una lista vacía.
duplicate(X, N, [X|R]) :- 
    N > 0,                    % Verifica que N sea mayor que 0.
    N1 is N - 1,              % Decrementa N en 1.
    duplicate(X, N1, R).      % Llama recursivamente para crear la lista.

% Ejemplo de uso:
% ?- programa15([1, 2, 3], 2, R). % Duplica los elementos de la lista [1, 2, 3] 2 veces y almacena el resultado en R.
