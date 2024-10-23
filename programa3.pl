% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el k-ésimo elemento de una lista.
%              El índice K debe ser mayor que 0.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función genérica para encontrar el k-ésimo elemento de una lista.
%     static T ElementAt<T>(List<T> list, int k)
%     {
%         // Verifica si el índice K es válido.
%         if (list == null || k < 1 || k > list.Count)
%             throw new ArgumentOutOfRangeException("El índice K debe ser mayor que 0 y menor o igual al tamaño de la lista.");
% 
%         // Devuelve el k-ésimo elemento (convertir k a índice basado en cero).
%         return list[k - 1];
%     }
% 
%     static void Main()
%     {
%         // Define una lista de caracteres.
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
% 
%         // Especifica el índice k.
%         int k = 3;
% 
%         // Llama a la función ElementAt para obtener el k-ésimo elemento.
%         char elementoK = ElementAt(lista, k);
% 
%         // Imprime el k-ésimo elemento en la consola.
%         Console.WriteLine($"El {k}-ésimo elemento es: " + elementoK);
%     }
% }
% ----------------------------------------------

% Predicado programa3(X, List, K) que determina el k-ésimo
% elemento X de la lista List.

% Caso base: el k-ésimo elemento es el primer elemento cuando K es 1.
programa3(X, [X|_], 1).

% Caso recursivo: ignora el primer elemento de la lista y decrementa K.
programa3(X, [_|T], K) :- 
    K > 1,                 % Asegura que K sea mayor que 1.
    K1 is K - 1,          % Decrementa K en 1.
    programa3(X, T, K1). % Llama recursivamente para el resto de la lista.

% Ejemplo de uso:
% ?- programa3(X, [a, b, c, d, e], 3).
% X = c.
% ===============================================