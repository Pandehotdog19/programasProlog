% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que crea una lista
%              con todos los enteros dentro de un rango dado.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que crea una lista con todos los enteros dentro de un rango dado.
%     static List<int> Range(int start, int end)
%     {
%         List<int> rangeList = new List<int>();
%         for (int i = start; i <= end; i++) // Itera desde el inicio hasta el final.
%         {
%             rangeList.Add(i); // Agrega cada número a la lista.
%         }
%         return rangeList; // Retorna la lista de enteros.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = Range(1, 5); // Crea una lista con los enteros del 1 al 5.
%         Console.WriteLine(string.Join(", ", lista)); // Salida: 1, 2, 3, 4, 5
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
programa22(I, I, [I]).  
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
programa22(I, K, [I|R]) :- 
    I < K,                   % Asegura que I sea menor que K.
    I1 is I + 1,            % Incrementa I en 1.
    programa22(I1, K, R).        % Llama recursivamente para continuar el rango.

% Ejemplo de uso:
% ?- programa22(1, 5, R).
% R = [1, 2, 3, 4, 5].
% ----------------------------------------------
