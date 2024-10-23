% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que compara dos
%              métodos para calcular la función totiente.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class Program
% {
%     // Función que calcula la función totiente de Euler (método básico).
%     static int TotientBasic(int n)
%     {
%         int count = 0;  // Contador de números coprimos.
%         for (int i = 1; i < n; i++)
%         {
%             if (Coprime(i, n)) count++;  // Aumenta el contador si i es coprimo con n.
%         }
%         return count;  // Retorna el total.
%     }

%     // Función que verifica si dos números son coprimos.
%     static bool Coprime(int a, int b)
%     {
%         return GCD(a, b) == 1;  // Devuelve true si el GCD es 1.
%     }

%     // Función que calcula el máximo común divisor usando el algoritmo de Euclides.
%     static int GCD(int a, int b)
%     {
%         while (b != 0)
%         {
%             int temp = b;
%             b = a % b;
%             a = temp;
%         }
%         return a;  // Retorna el GCD.
%     }

%     // Función que calcula la función totiente de Euler (método mejorado).
%     static int TotientImproved(int n)
%     {
%         var factors = PrimeFactorsMultiplicity(n);  // Obtiene los factores primos con multiplicidad.
%         double phi = 1;  // Inicializa phi.
%         foreach (var factor in factors)
%         {
%             phi *= (factor.Key - 1) * Math.Pow(factor.Key, factor.Value - 1);  // Calcula el producto.
%         }
%         return (int)phi;  // Retorna el resultado como entero.
%     }

%     // Función principal para comparar los métodos.
%     static void Main()
%     {
%         int number = 60;  // Número para calcular la función totiente.
%         int phiBasic = TotientBasic(number);  // Método básico.
%         int phiImproved = TotientImproved(number);  // Método mejorado.
%         
%         Console.WriteLine($"Phi (método básico): {phiBasic}");  // Muestra el resultado del método básico.
%         Console.WriteLine($"Phi (método mejorado): {phiImproved}");  // Muestra el resultado del método mejorado.
%         // Salida: Phi (método básico): 16
%         //         Phi (método mejorado): 16
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Compara los dos métodos para calcular la función totiente.
programa37(N) :- 
    totient(N, Phi1),               % Calcula usando el método básico.
    totient_improved(N, Phi2),     % Calcula usando el método mejorado.
    write('Phi (método básico): '), write(Phi1), nl,  % Muestra el resultado del método básico.
    write('Phi (método mejorado): '), write(Phi2), nl.  % Muestra el resultado del método mejorado.

% Ejemplo de uso:
% ?- programa37(60).
% ----------------------------------------------
