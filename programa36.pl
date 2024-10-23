% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que calcula la
%              función totiente de Euler usando los
%              factores primos con multiplicidad.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que encuentra los factores primos de un número entero positivo
%     // con su multiplicidad.
%     static Dictionary<int, int> PrimeFactorsMultiplicity(int n)
%     {
%         var factors = new Dictionary<int, int>();  // Diccionario para almacenar factores y su multiplicidad.
%         
%         while (n % 2 == 0)
%         {
%             if (factors.ContainsKey(2)) factors[2]++;
%             else factors[2] = 1;
%             
%             n /= 2;  // Divide n entre 2.
%         }
%         
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
%         
%         if (n > 2)
%             factors[n] = 1;  // Agrega el último primo a la lista.
%         
%         return factors;  // Retorna el diccionario de factores primos y su multiplicidad.
%     }
% 
%     // Función que calcula la función totiente de Euler.
%     static int Totient(int n)
%     {
%         var factors = PrimeFactorsMultiplicity(n);  // Obtiene los factores primos con multiplicidad.
%         double phi = 1;  // Inicializa phi.
%         
%         foreach (var factor in factors)
%         {
%             phi *= (factor.Key - 1) * Math.Pow(factor.Key, factor.Value - 1);  // Calcula el producto.
%         }
%         
%         return (int)phi;  // Retorna el resultado como entero.
%     }
% 
%     static void Main()
%     {
%         int number = 60;  // Número para calcular la función totiente.
%         int result = Totient(number);  // Llama a la función para obtener el resultado.
%         
%         Console.WriteLine($"La función totiente de {number} es: {result}");  // Muestra el resultado.
%         // Salida: La función totiente de 60 es: 16
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Calcula la función totiente usando los factores primos con multiplicidad para mejorar la eficiencia.
programa36(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

% Calcula el totiente a partir de los factores primos con su multiplicidad.
totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- 
    totient_phi(T, Phi1), 
    Phi is Phi1 * (P - 1) * P ** (M - 1).

% Ejemplo de uso:
% ?- programa36(60, Phi).  % Debería devolver Phi = 16.
% ----------------------------------------------
