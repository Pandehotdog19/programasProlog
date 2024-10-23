% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que codifica 
%              una lista usando codificación Run-Length.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar una lista usando codificación Run-Length.
%     static List<(int Count, T Element)> Encode<T>(List<T> list)
%     {
%         var encodedList = new List<(int, T)>();
%         if (list == null || list.Count == 0) return encodedList; // Manejo de lista vacía.
%         
%         int count = 1;
%         for (int i = 1; i < list.Count; i++)
%         {
%             // Si el elemento actual es igual al anterior, aumenta el contador.
%             if (EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 count++;
%             }
%             else
%             {
%                 // Agrega la pareja (count, element) a la lista.
%                 encodedList.Add((count, list[i - 1]));
%                 count = 1; // Reinicia el contador.
%             }
%         }
% 
%         // Agrega el último elemento.
%         encodedList.Add((count, list[list.Count - 1]));
%         return encodedList; // Devuelve la lista codificada.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'd' };
%         var listaCodificada = Encode(lista);
% 
%         foreach (var (Count, Element) in listaCodificada)
%         {
%             Console.WriteLine($"({Count}, {Element})");
%         }
%     }
% }
% ----------------------------------------------

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
programa10(L, R) :- 
    pack(L, P), 
    transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- 
    length([X|Xs], N), 
    transform(Ys, Zs).

% Ejemplo de uso:
% ?- programa10([a, a, b, b, c, a, a, d], R).
% R = [[2, a], [2, b], [1, c], [2, a], [1, d]].
% ===============================================
