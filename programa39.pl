% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que encuentra
%              dos números primos que sumen un número par
%              dado según la conjetura de Goldbach.
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

%     // Función que encuentra dos números primos que sumen un número par.
%     static (int, int) Goldbach(int n)
%     {
%         if (n <= 2 || n % 2 != 0)
%             throw new ArgumentException("El número debe ser un número par mayor que 2.");

%         List<int> primes = PrimeList(2, n);  // Obtiene la lista de primos hasta N.

%         for (int p1 = 0; p1 < primes.Count; p1++)
%         {
%             int p2 = n - primes[p1];  // Calcula el segundo primo.
%             if (primes.Contains(p2))  // Verifica si el segundo primo está en la lista.
%                 return (primes[p1], p2);  // Retorna los dos primos.
%         }

%         throw new Exception("No se encontraron primos que sumen el número.");
%     }

%     // Función principal.
%     static void Main()
%     {
%         int n = 28;  // Ejemplo de número par.
%         var (p1, p2) = Goldbach(n);  // Encuentra los primos.
%         Console.WriteLine($"Los números primos que suman {n} son {p1} y {p2}.");
%         // Salida: Los números primos que suman 28 son 5 y 23.
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Encuentra dos números primos que sumen un número par dado según la conjetura de Goldbach.
programa39(N, [P1, P2]) :- 
    N > 2,                          % Verifica que N sea mayor que 2.
    N mod 2 =:= 0,                  % Verifica que N sea par.
    prime_list(2, N, Primes),       % Obtiene la lista de números primos hasta N.
    member(P1, Primes),             % Selecciona un primo P1 de la lista.
    P2 is N - P1,                   % Calcula el segundo primo P2.
    is_prime(P2).                   % Verifica que P2 también sea primo.

% Ejemplo de uso:
% ?- programa39(28, [P1, P2]).
% P1 = 5, P2 = 23.
% ----------------------------------------------
