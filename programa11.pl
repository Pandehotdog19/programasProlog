% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que modifica 
%              la codificación Run-Length de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para modificar la codificación Run-Length de una lista.
%     static List<object> EncodeModified<T>(List<T> list)
%     {
%         var encodedList = Encode(list);
%         var modifiedList = new List<object>();
% 
%         foreach (var (Count, Element) in encodedList)
%         {
%             // Si hay solo un elemento, agrégalo directamente.
%             if (Count == 1)
%             {
%                 modifiedList.Add(Element);
%             }
%             else
%             {
%                 // Mantiene el formato (N, X).
%                 modifiedList.Add((Count, Element));
%             }
%         }
% 
%         return modifiedList; // Devuelve la lista modificada.
%     }
% 
%     // Función auxiliar para codificar una lista usando codificación Run-Length.
%     static List<(int Count, T Element)> Encode<T>(List<T> list)
%     {
%         var encodedList = new List<(int, T)>();
%         if (list == null || list.Count == 0) return encodedList; // Manejo de lista vacía.
%         
%         int count = 1;
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 count++;
%             }
%             else
%             {
%                 encodedList.Add((count, list[i - 1]));
%                 count = 1; // Reinicia el contador.
%             }
%         }
% 
%         encodedList.Add((count, list[list.Count - 1])); // Agrega el último elemento.
%         return encodedList; // Devuelve la lista codificada.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'c', 'c', 'a', 'd' };
%         var listaModificada = EncodeModified(lista);
% 
%         foreach (var item in listaModificada)
%         {
%             Console.WriteLine(item);
%         }
%     }
% }
% ----------------------------------------------

% Modifica la codificación Run-Length de una lista.
% Si un elemento no tiene duplicados, se mantiene sin empaquetar.
programa11(L, R) :- 
    encode(L, Enc), 
    modify(Enc, R).

% Encoded Run-Length: codifica la lista en forma de (Count, Element).
encode([], []).
encode([X|Xs], [[Count, X]|Encoded]) :-
    count(X, Xs, Count, Rest),
    encode(Rest, Encoded).

% Cuenta los elementos repetidos.
count(X, [], 1, []).
count(X, [X|Xs], Count, Rest) :-
    count(X, Xs, Count1, Rest),
    Count is Count1 + 1.
count(X, [Y|Xs], 1, [Y|Xs]) :-
    X \= Y.

% Caso base: lista vacía.
modify([], []).
% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).
% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% Ejemplo de uso:
% ?- programa11([a, a, b, c, c, a, d], R).
% R = [a, [2, b], [2, c], a, d].
% ===============================================
