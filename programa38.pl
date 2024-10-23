% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que genera una
%              lista de números primos en un rango dado.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Función que verifica si un número entero dado es primo.
%     static bool IsPrime(int n)
%     {
%         if (n <= 1) return false;  // Números menores o iguales a 1 no son primos.
%         if (n <= 3) return true;   // 2 y 3 son primos.
%         if (n % 2 == 0 || n % 3 == 0) return false;  // Elimina múltiplos de 2 y 3.
%         for (int i = 5; i * i <= n; i += 6)  // Verifica posibles factores.
%         {
%             if (n % i == 0 || n % (i + 2) == 0) return false;  // Si es divisible, no es primo.
%         }
%         return true;  // Si no se encontró un divisor, es primo.
%     }

%     // Función que genera una lista de números primos en un rango dado.
%     static List<int> PrimeList(int low, int high)
%     {
%         List<int> primes = new List<int>();  // Lista para almacenar números primos.
%         for (int i = low; i <= high; i++)  // Itera en el rango dado.
%         {
%             if (IsPrime(i)) primes.Add(i);  // Si es primo, lo agrega a la lista.
%         }
%         return primes;  // Retorna la lista de números primos.
%     }

%     // Función principal.
%     static void Main()
%     {
%         int low = 10, high = 50;  // Define el rango.
%         List<int> primes = PrimeList(low, high);  // Genera la lista de números primos.
%         
%         Console.WriteLine($"Números primos entre {low} y {high}: {string.Join(", ", primes)}");
%         // Salida: Números primos entre 10 y 50: 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Genera una lista de números primos en un rango dado.
programa38(Low, High, Primes) :- 
    findall(P, (between(Low, High, P), is_prime(P)), Primes).  % Encuentra todos los números primos en el rango.

% Ejemplo de uso:
% ?- programa38(10, 50, Primes).
% Primes = [11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47].
% ----------------------------------------------
