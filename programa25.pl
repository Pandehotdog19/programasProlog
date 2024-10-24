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
programa25(L, P) :- 
    random_permutation(L, P). % Usa la función incorporada de Prolog.

% Ejemplo de uso:
% ?- programa25([1, 2, 3, 4, 5], P).
% P = [3, 1, 4, 2, 5]. (Ejemplo de salida aleatoria).
