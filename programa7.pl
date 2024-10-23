% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que aplana 
%              una lista anidada en una lista simple.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para aplanar una lista anidada en C#.
%     static List<T> Flatten<T>(List<object> list)
%     {
%         List<T> flatList = new List<T>();
%         foreach (var item in list)
%         {
%             if (item is List<object> sublist)
%             {
%                 // Llama recursivamente para aplanar sublistas.
%                 flatList.AddRange(Flatten<T>(sublist));
%             }
%             else
%             {
%                 flatList.Add((T)item); // Agrega el elemento a la lista plana.
%             }
%         }
%         return flatList; // Devuelve la lista aplanada.
%     }
% 
%     static void Main()
%     {
%         var nestedList = new List<object> { 1, new List<object> { 2, 3 }, 4, new List<object> { 5, new List<object> { 6, 7 } } };
%         var flatList = Flatten<int>(nestedList);
%         
%         Console.WriteLine("Lista aplanada: " + string.Join(", ", flatList));
%     }
% }
% ----------------------------------------------

% Predicado programa7/2 que aplane una lista anidada.

% Caso base: la lista vacía se aplana a una lista vacía.
programa7([], []).

% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
programa7([H|T], Flat) :- 
    programa7(H, FH), 
    programa7(T, FT), 
    append(FH, FT, Flat).

% Si la cabeza no es una lista, simplemente agrégala al resultado.
programa7(X, [X]) :- 
    X \= [], 
    \+ is_list(X).

% Ejemplo de uso:
% ?- programa7([1, [2, 3], 4, [5, [6, 7]]], Flat).
% Flat = [1, 2, 3, 4, 5, 6, 7].
% ===============================================
