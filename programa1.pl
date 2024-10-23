% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que encuentra 
%              el último elemento de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el último elemento de una lista.
%     static T MyLast<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0)
%             throw new ArgumentException("La lista no puede estar vacía.");
%         
%         return list[list.Count - 1]; // Devuelve el último elemento.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         char ultimoElemento = MyLast(lista);
% 
%         Console.WriteLine("El último elemento es: " + ultimoElemento);
%     }
% }
% ----------------------------------------------

% Predicado programa1(X, List) que determina el último
% elemento X de la lista List.

% Caso base: el último elemento es cuando la lista tiene solo un elemento.
programa1(X, [X]).

% Caso recursivo: ignora el primer elemento de la lista y sigue evaluando.
programa1(X, [_|T]) :- 
    programa1(X, T).  % Llama recursivamente para encontrar el último elemento.

% Ejemplo de uso:
% ?- programa1(X, [a, b, c, d]).
% X = d.
% ===============================================
