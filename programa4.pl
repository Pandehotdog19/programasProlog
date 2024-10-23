% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que calcula 
%              el número de elementos de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para calcular la longitud de una lista.
%     static int ListLength<T>(List<T> list)
%     {
%         // La longitud de una lista vacía es 0.
%         if (list == null || list.Count == 0)
%             return 0;
% 
%         // La longitud es 1 más la longitud de la sublista (sin el primer elemento).
%         return 1 + ListLength(list.GetRange(1, list.Count - 1));
%     }
% 
%     static void Main()
%     {
%         // Define una lista de caracteres.
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
% 
%         // Llama a la función ListLength para obtener la longitud de la lista.
%         int longitud = ListLength(lista);
% 
%         // Imprime la longitud de la lista en la consola.
%         Console.WriteLine("La longitud de la lista es: " + longitud);
%     }
% }
% ----------------------------------------------

% Predicado programa4(List, N) que calcula el número de
% elementos de la lista List, donde N es la longitud.

% Caso base: una lista vacía tiene longitud 0.
programa4([], 0).

% Caso recursivo: la longitud es 1 más que la longitud de la cola.
programa4([_|T], N) :- 
    programa4(T, N1),  % Llama recursivamente para la cola de la lista.
    N is N1 + 1.         % Calcula la longitud total sumando 1.
    
% Ejemplo de uso:
% ?- programa4([a, b, c, d, e], N).
% N = 5.
% ===============================================