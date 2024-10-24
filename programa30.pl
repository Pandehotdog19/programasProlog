% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que verifica si un
%              número entero dado es primo.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función que verifica si un número entero es primo.
%     static bool IsPrime(int number)
%     {
%         if (number < 2) return false;  // Números menores que 2 no son primos.
%         if (number == 2) return true;   // 2 es primo.
%         if (number % 2 == 0) return false; // Números pares mayores que 2 no son primos.
%         
%         for (int i = 3; i * i <= number; i += 2) // Verifica factores impares.
%         {
%             if (number % i == 0) return false; // Si es divisible, no es primo.
%         }
%         
%         return true; // Si no se encontraron factores, es primo.
%     }
% 
%     static void Main()
%     {
%         int num = 29; // Número a verificar.
%         bool isPrime = IsPrime(num); // Verifica si el número es primo.
%         
%         Console.WriteLine($"{num} es primo: {isPrime}"); // Salida: 29 es primo: True
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Verifica si un número es primo
es_primo(2). % 2 es primo
es_primo(N) :-
    N > 2,
    \+ (between(2, sqrt(N), X), N mod X =:= 0).

% Punto de entrada para el programa
programa30(N) :-
    (es_primo(N) ->
        write('Es primo: true')
    ;
        write('Es primo: false')
    ).

% Ejemplo de uso:
% ?- programa30(29).
% Es primo: true
% ?- programa30(30).
% Es primo: false

% Ejemplo de uso:
% ?- programa30(29).
% true.
% ?- programa30(30).
% false.
% ----------------------------------------------
