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

% programa34(N, L): donde N es el número de entrada y L es la lista de factores primos
programa34(N, L) :- prime_factors(N, L).

% Definición de prime_factors/2 para calcular los factores primos
prime_factors(1, []) :- !.
prime_factors(N, [F | L]) :-
    N > 1,
    smallest_factor(N, F),
    N1 is N // F,
    prime_factors(N1, L).

% smallest_factor/2 encuentra el factor primo más pequeño de N
smallest_factor(N, F) :-
    between(2, N, F),
    N mod F =:= 0, !.

% Ejemplo de uso:
% ?- programa34(60, L).  % Debería devolver L = [2, 2, 3, 5].
% ----------------------------------------------
