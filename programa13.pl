% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que codifica 
%              directamente una lista usando 
%              codificación Run-Length.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar una lista usando Run-Length directo.
%     static List<(int Count, T Element)> EncodeDirect<T>(List<T> list)
%     {
%         var encodedList = new List<(int, T)>();
%         int i = 0;
% 
%         while (i < list.Count)
%         {
%             int count = 1;
%             T currentElement = list[i];
% 
%             // Cuenta cuántos elementos consecutivos son iguales.
%             while (i + 1 < list.Count && list[i + 1].Equals(currentElement))
%             {
%                 count++;
%                 i++;
%             }
% 
%             // Agrega el par (N, X) a la lista codificada.
%             encodedList.Add((count, currentElement));
%             i++;
%         }
% 
%         return encodedList; // Devuelve la lista codificada.
%     }
% 
%     static void Main()
%     {
%         var list = new List<char> { 'a', 'a', 'a', 'b', 'c', 'c', 'a' };
%         var encodedList = EncodeDirect(list);
% 
%         foreach (var (count, element) in encodedList)
%         {
%             Console.WriteLine($"({count}, {element})");
%         }
%     }
% }
% ----------------------------------------------

% Codifica directamente una lista usando codificación Run-Length.
% Cuenta cuántos elementos consecutivos son iguales.
programa13([], []).                                      % Caso base: lista vacía.
programa13([X|Xs], [[N,X]|R]) :- 
    count(X, [X|Xs], N, Rest),                              % Cuenta los elementos consecutivos.
    programa13(Rest, R).                                 % Codifica el resto de la lista.

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).                                        % Caso base: lista vacía.
count(X, [X|Xs], N, Rest) :- 
    count(X, Xs, N1, Rest),                                 % Continúa contando si el elemento es igual.
    N is N1 + 1.                                            % Incrementa el contador.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.                      % Si los elementos son diferentes, se detiene.

% Ejemplo de uso:
% ?- programa13([a,a,a,b,c,c,a], R).
% R = [[3,a],[1,b],[2,c],[1,a]].
% ===============================================
