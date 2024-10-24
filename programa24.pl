% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que genera números aleatorios
%              en un rango dado. Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     static void Main(string[] args)
%     {
%         int min = 1; // Valor mínimo del rango
%         int max = 5; // Valor máximo del rango
%         int n = max - min + 1; // Tamaño del rango
%         
%         Random random = new Random();
%         List<int> result = new List<int>();
%         for (int i = 0; i < n; i++)
%         {
%             // Genera un número aleatorio en el rango y lo añade a la lista
%             int randomNumber = random.Next(min, max + 1);
%             result.Add(randomNumber);
%         }
%         
%         Console.WriteLine("Números aleatorios en rango: " + string.Join(", ", result));
%     }
% }
% ----------------------------------------------

% Obtiene el elemento en la posición I de la lista L.
element_at(X, [X|_], 1). % Si la posición es 1, el primer elemento es X.
element_at(X, [_|T], I) :- 
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1). % Recurre en la cola de la lista con posición decreciente.

% Genera N números aleatorios en un rango dado [Min, Max].
programa24(Min, Max, R) :- 
    N is Max - Min + 1,              % Calcula el tamaño del rango.
    findall(X, (between(Min, Max, X)), Lista), % Genera una lista de números en el rango.
    rnd_select(Lista, N, R).         % Selecciona N elementos aleatorios de la lista.

% Ejemplo de uso:
% ?- programa24(1, 5, R).
% R = [X1, X2].  (donde X1 y X2 son números aleatorios en el rango).
% ----------------------------------------------
