% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que calcula la
%              función totiente de Euler, que cuenta
%              cuántos números menores que M son
%              coprimos con M.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función que calcula el máximo común divisor usando el algoritmo de Euclides.
%     static int GCD(int a, int b)
%     {
%         if (b == 0) return a;  // Si b es 0, el MCD es a.
%         return GCD(b, a % b);  // Llama recursivamente con b y el resto de a dividido por b.
%     }
% 
%     // Función que verifica si dos números son coprimos.
%     static bool AreCoprime(int x, int y)
%     {
%         return GCD(x, y) == 1;  // Devuelve verdadero si el MCD es 1.
%     }
% 
%     // Función que calcula la función totiente de Euler.
%     static int Totient(int m)
%     {
%         int count = 0;  // Contador para números coprimos.
%         for (int k = 1; k < m; k++)
%         {
%             if (AreCoprime(m, k))  // Si k es coprimo con m, aumenta el contador.
%                 count++;
%         }
%         return count;  // Retorna el total de números coprimos.
%     }
% 
%     static void Main()
%     {
%         int number = 10;  // Número para calcular su totiente.
%         int totientValue = Totient(number);  // Calcula la función totiente.
%         
%         Console.WriteLine($"El totiente de {number} es: {totientValue}");  // Salida: El totiente de 10 es: 4
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(A, 0, A) :- A > 0, !.
gcd(A, B, GCD) :-
    B > 0,
    R is A mod B,
    gcd(B, R, GCD).

% Verifica si dos números son coprimos.
coprime(X, Y) :-
    gcd(X, Y, 1).

% Ejemplo de uso:
% ?- programa33(10, Phi).  % Debería devolver Phi = 4.
% ----------------------------------------------
