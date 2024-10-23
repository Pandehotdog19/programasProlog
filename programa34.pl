% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que encuentra los
%              factores primos de un número entero positivo.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que encuentra los factores primos de un número entero positivo.
%     static List<int> PrimeFactors(int n)
%     {
%         List<int> factors = new List<int>();  // Lista para almacenar los factores primos.
%         // Comprobar los factores de 2 primero.
%         while (n % 2 == 0)
%         {
%             factors.Add(2);  // Agrega 2 a la lista de factores.
%             n /= 2;  // Divide n entre 2.
%         }
%         // Comprobar los factores impares a partir de 3.
%         for (int i = 3; i * i <= n; i += 2)
%         {
%             while (n % i == 0)
%             {
%                 factors.Add(i);  // Agrega i a la lista de factores.
%                 n /= i;  // Divide n entre i.
%             }
%         }
%         // Si n es mayor que 2, es un primo.
%         if (n > 2)
%             factors.Add(n);  // Agrega el último primo a la lista.
%         
%         return factors;  // Retorna la lista de factores primos.
%     }
% 
%     static void Main()
%     {
%         int number = 60;  // Número para encontrar factores primos.
%         List<int> factors = PrimeFactors(number);  // Llama a la función para obtener los factores.
%         
%         Console.WriteLine($"Los factores primos de {number} son: {string.Join(", ", factors)}");  // Salida: 2, 2, 3, 5
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Encuentra los factores primos de un número entero positivo.
programa34(N, L) :- N > 1, programa34(N, 2, L).

% Caso base: si N es 1, no hay factores primos.
programa34(1, _, []).

% Si N es divisible por F, agrega F a la lista y continúa con el resto.
programa34(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, programa34(N1, F, L).

% Si F es menor que la raíz cuadrada de N, busca el siguiente factor.
programa34(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), programa34(N, F1, L).

% Genera el siguiente factor primo.
next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% Ejemplo de uso:
% ?- programa34(60, L).  % Debería devolver L = [2, 2, 3, 5].
% ----------------------------------------------
