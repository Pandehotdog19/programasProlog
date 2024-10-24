% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que genera una
%              permutación aleatoria de los elementos
%              de una lista.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que genera una permutación aleatoria de los elementos de una lista.
%     static List<T> RandomPermutation<T>(List<T> list)
%     {
%         Random random = new Random(); // Crea un generador de números aleatorios.
%         List<T> permutedList = new List<T>(list); // Crea una copia de la lista original.
% 
%         // Aplica el algoritmo de Fisher-Yates para permutar la lista.
%         for (int i = permutedList.Count - 1; i > 0; i--)
%         {
%             int j = random.Next(i + 1); // Selecciona un índice aleatorio.
%             // Intercambia los elementos en las posiciones i y j.
%             T temp = permutedList[i];
%             permutedList[i] = permutedList[j];
%             permutedList[j] = temp;
%         }
% 
%         return permutedList; // Retorna la lista permutada.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5 }; // Lista original.
%         List<int> listaPermutada = RandomPermutation(lista); // Genera la permutación aleatoria.
%         
%         Console.WriteLine(string.Join(", ", listaPermutada)); // Muestra la lista permutada.
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Genera una permutación aleatoria de los elementos de una lista.
% Utiliza la selección aleatoria para construir la permutación.
programa25(L, P) :- 
    length(L, Len),        % Obtiene la longitud de la lista.
    Len > 0,               % Asegura que la lista no esté vacía.
    MaxIndex is Len + 1,   % Calcula el límite superior para el índice aleatorio.
    rnd_select(L, Len, P, MaxIndex). % Selecciona todos los elementos de la lista aleatoriamente.

% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, [], _).  % Caso base: si N es 0, la lista resultante es vacía.
rnd_select(L, N, [X|R], MaxIndex) :- 
    random(1, MaxIndex, I), % Genera un índice aleatorio entre 1 y MaxIndex.
    element_at(X, L, I),      % Obtiene el elemento en la posición I de la lista.
    delete(L, X, L1),         % Elimina el elemento seleccionado de la lista.
    N1 is N - 1,              % Decrementa N.
    rnd_select(L1, N1, R, MaxIndex). % Llama recursivamente para seleccionar el resto.

% Obtiene el elemento en la posición I de la lista (1-indexed).
element_at(X, [X|_], 1).  % Si I es 1, el primer elemento es X.
element_at(X, [_|T], I) :-  % Si I no es 1, busca en el resto de la lista.
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1).

% Ejemplo de uso:
% ?- programa25([1, 2, 3, 4, 5], P).
% P = [X1, X2, X3, X4, X5].  (donde X1, X2, ..., X5 son los elementos en un orden aleatorio).
% ----------------------------------------------
