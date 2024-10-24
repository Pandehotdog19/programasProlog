% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que rota una lista
%              N lugares a la izquierda.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------

% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que rota una lista N lugares a la izquierda.
%     static List<T> RotateLeft<T>(List<T> list, int n)
%     {
%         int len = list.Count;  // Obtiene la longitud de la lista.
%         if (len == 0) return list;  // Si la lista está vacía, no hace nada.
%         
%         int n1 = n % len;  // Asegura que la rotación sea válida para listas más cortas.
%         
%         // Combina las dos partes de la lista: desde N hasta el final, seguido de la parte inicial.
%         List<T> rotated = new List<T>(list.GetRange(n1, len - n1));
%         rotated.AddRange(list.GetRange(0, n1));
%         
%         return rotated;  // Retorna la lista rotada.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
%         List<int> listaRotada = RotateLeft(lista, 2);  // Rota la lista 2 lugares a la izquierda.
%         
%         Console.WriteLine(string.Join(", ", listaRotada));  // Salida: 3, 4, 5, 1, 2
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Divide la lista en dos partes: la primera parte L1 de longitud N1 y la segunda parte L2.
split([], 0, [], []).
split(L, N1, L1, L2) :-
    N1 > 0,
    L = [H|T],
    L1 = [H|L1Tail],
    N2 is N1 - 1,
    split(T, N2, L1Tail, L2).
split(L, 0, [], L).

% Rota una lista N lugares a la izquierda.
% Si N es mayor que la longitud de la lista, utiliza N mod longitud para manejarlo.
programa19(L, N, R) :-
    length(L, Len),        % Obtiene la longitud de la lista.
    N1 is N mod Len,       % Calcula N1 como N mod longitud para manejar rotaciones grandes.
    split(L, N1, L1, L2),  % Divide la lista en dos partes: L1 y L2.
    append(L2, L1, R).     % Combina L2 y L1 para formar la lista rotada.

% Ejemplo de uso:
% ?- programa19([1, 2, 3, 4, 5], 2, R).
% R = [3, 4, 5, 1, 2].
% ----------------------------------------------
