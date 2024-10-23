% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina los
%              factores primos de un número entero positivo
%              con su multiplicidad.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que encuentra los factores primos de un número entero positivo
%     // con su multiplicidad.
%     static Dictionary<int, int> PrimeFactorsMultiplicity(int n)
%     {
%         var factors = new Dictionary<int, int>();  // Diccionario para almacenar factores y su multiplicidad.
%         
%         // Comprobar los factores de 2 primero.
%         while (n % 2 == 0)
%         {
%             if (factors.ContainsKey(2)) factors[2]++;
%             else factors[2] = 1;
%             
%             n /= 2;  // Divide n entre 2.
%         }
%         // Comprobar los factores impares a partir de 3.
%         for (int i = 3; i * i <= n; i += 2)
%         {
%             while (n % i == 0)
%             {
%                 if (factors.ContainsKey(i)) factors[i]++;
%                 else factors[i] = 1;
%                 
%                 n /= i;  // Divide n entre i.
%             }
%         }
%         // Si n es mayor que 2, es un primo.
%         if (n > 2)
%             factors[n] = 1;  // Agrega el último primo a la lista.
%         
%         return factors;  // Retorna el diccionario de factores primos y su multiplicidad.
%     }
% 
%     static void Main()
%     {
%         int number = 60;  // Número para encontrar factores primos.
%         var factors = PrimeFactorsMultiplicity(number);  // Llama a la función para obtener los factores.
%         
%         Console.WriteLine($"Los factores primos de {number} con multiplicidad son: ");
%         foreach (var pair in factors)
%         {
%             Console.WriteLine($"{pair.Key}: {pair.Value}");  // Muestra cada factor y su multiplicidad.
%         }
%         // Salida: 2: 2, 3: 1, 5: 1
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Determina los factores primos con su multiplicidad.
programa35(N, L) :- prime_factors(N, F), encode(F, L).

% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% Codifica la lista de factores para obtener su multiplicidad.
encode([], []).
encode([X|Xs], [[N, X]|R]) :- count(X, [X|Xs], N, Rest), encode(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.

% Ejemplo de uso:
% ?- programa35(60, L).  % Debería devolver L = [[2, 2], [3, 1], [5, 1]].
% ----------------------------------------------
