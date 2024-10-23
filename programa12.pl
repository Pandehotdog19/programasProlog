% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que decodifica 
%              una lista codificada mediante 
%              Run-Length.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para decodificar una lista Run-Length.
%     static List<T> Decode<T>(List<(int Count, T Element)> encodedList)
%     {
%         var decodedList = new List<T>();
% 
%         foreach (var (Count, Element) in encodedList)
%         {
%             // Expande el elemento X N veces.
%             for (int i = 0; i < Count; i++)
%             {
%                 decodedList.Add(Element);
%             }
%         }
% 
%         return decodedList; // Devuelve la lista decodificada.
%     }
% 
%     static void Main()
%     {
%         var encodedList = new List<(int, char)>
%         {
%             (2, 'a'), (1, 'b'), (3, 'c'), (1, 'a'), (2, 'd')
%         };
% 
%         var decodedList = Decode(encodedList);
% 
%         Console.WriteLine(string.Join(", ", decodedList));
%     }
% }
% ----------------------------------------------

% Decodifica una lista codificada mediante Run-Length.
% Expande cada par (N, X) en una lista con N elementos X.
programa12([], []).
programa12([[N,X]|T], R) :- 
    programa12(T, R1),       % Decodifica el resto de la lista.
    expand(X, N, E),     % Expande el elemento X en una lista de longitud N.
    append(E, R1, R).    % Combina la lista expandida con el resultado decodificado.

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).        % Caso base: si N es 0, devuelve una lista vacía.
expand(X, N, [X|T]) :- 
    N > 0,               % Si N es mayor que 0, continúa expandiendo.
    N1 is N - 1,         % Reduce N en 1.
    expand(X, N1, T).    % Llama recursivamente para expandir el resto.

% Ejemplo de uso:
% ?- programa12([[2,a], [1,b], [3,c], [1,a], [2,d]], R).
% R = [a, a, b, c, c, c, a, d, d].
% ===============================================
