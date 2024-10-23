% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que encuentra
%              las composiciones de Goldbach para todos
%              los números pares dentro de un rango.
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

%     // Función que encuentra las composiciones de Goldbach para todos los números pares en un rango.
%     static List<(int, int, int)> GoldbachList(int low, int high)
%     {
%         List<(int, int, int)> results = new List<(int, int, int)>();  // Lista para almacenar los resultados.
%         for (int n = low; n <= high; n += 2)  // Itera solo en números pares.
%         {
%             if (n > 2)  // Solo considera números mayores que 2.
%             {
%                 var (p1, p2) = Goldbach(n);  // Encuentra los primos que suman a N.
%                 results.Add((n, p1, p2));  // Agrega el resultado a la lista.
%             }
%         }
%         return results;  // Retorna la lista de composiciones de Goldbach.
%     }

%     // Función principal.
%     static void Main()
%     {
%         int low = 4;  // Rango inferior.
%         int high = 20;  // Rango superior.
%         var results = GoldbachList(low, high);  // Encuentra las composiciones de Goldbach.
%         
%         foreach (var result in results)
%         {
%             Console.WriteLine($"El número par {result.Item1} se puede expresar como {result.Item2} + {result.Item3}.");
%         }
%         // Ejemplo de salida: 
%         // El número par 4 se puede expresar como 2 + 2.
%         // El número par 6 se puede expresar como 3 + 3.
%         // ...
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Encuentra las composiciones de Goldbach para todos los números pares dentro de un rango.
programa40(Low, High, L) :- 
    findall([N, P1, P2], (between(Low, High, N), N mod 2 =:= 0, goldbach(N, [P1, P2])), L).

% Ejemplo de uso:
% ?- programa40(4, 20, L).
% L = [[4, 2, 2], [6, 3, 3], [8, 3, 5], [10, 3, 7], [10, 5, 5], [12, 5, 7], [14, 7, 7], [16, 5, 11], [16, 7, 9], [18, 7, 11], [18, 5, 13], [20, 3, 17], [20, 7, 13], [20, 11, 9]].
% ----------------------------------------------
