% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que elimina 
%              duplicados consecutivos de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar duplicados consecutivos de una lista en C#.
%     static List<T> Compress<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0) return new List<T>(); // Manejo de lista vacía.
% 
%         List<T> result = new List<T> { list[0] }; // Agrega el primer elemento.
%         
%         for (int i = 1; i < list.Count; i++)
%         {
%             // Solo agrega si el elemento actual es diferente al último agregado.
%             if (!EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 result.Add(list[i]);
%             }
%         }
%         
%         return result; // Devuelve la lista sin duplicados consecutivos.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'd' };
%         List<char> listaSinDuplicados = Compress(lista);
% 
%         Console.WriteLine("Lista sin duplicados consecutivos: " + string.Join(", ", listaSinDuplicados));
%     }
% }
% ----------------------------------------------

% Predicado programa8/2 que elimina duplicados consecutivos.

% Caso base: una lista vacía se mantiene vacía.
programa8([], []).

% Si queda un solo elemento, no hay duplicados.
programa8([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
programa8([X, X|T], R) :- 
    programa8([X|T], R).

% Si el primer y segundo elemento son distintos, conserva el primero.
programa8([X, Y|T], [X|R]) :- 
    X \= Y, 
    programa8([Y|T], R).

% Ejemplo de uso:
% ?- programa8([a, a, b, b, c, a, a, d], R).
% R = [a, b, c, a, d].
% ===============================================
