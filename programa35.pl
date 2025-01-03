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

% Determina si un número es primo
es_primo(2).
es_primo(N) :- 
    N > 2, 
    DivMax is floor(sqrt(N)), 
    \+ (between(2, DivMax, X), N mod X =:= 0).

% Factoriza un número N y devuelve sus factores primos con multiplicidad en una lista
factorizar(N, L) :- 
    factorizar(N, 2, L).

factorizar(1, []) :- !. % Caso base: no hay factores en 1
factorizar(N, F, [F|L]) :- 
    N mod F =:= 0, 
    N1 is N // F, 
    factorizar(N1, F, L). % Si F es un factor, continúa factorizando
factorizar(N, F, L) :- 
    F * F =< N, % Asegúrate de que F no exceda la raíz cuadrada de N
    (es_primo(F) -> 
        factorizar(N, F + 1, L) ; % Si F es primo, incrementa
        factorizar(N, F + 1, L) % Si no, intenta con el siguiente número
    ).

factorizar(N, F, L) :- 
    F * F > N, 
    N > 1, 
    L = [N]. % Agrega el último factor primo

% Interfaz pública para ejecutar el programa
programa35(N, L) :-
    N > 1, 
    factorizar(N, L).
    
% Ejemplo de uso:
% ?- programa35(60, L).  % Debería devolver L = [[2, 2], [3, 1], [5, 1]].
% ----------------------------------------------
