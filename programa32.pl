% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que verifica si
%              dos números son coprimos, es decir,
%              su máximo común divisor es 1.
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
%     static void Main()
%     {
%         int num1 = 15;  // Primer número.
%         int num2 = 28;  // Segundo número.
%         bool programa32 = AreCoprime(num1, num2);  // Verifica si son coprimos.
%         
%         Console.WriteLine($"{num1} y {num2} son coprimos: {programa32}");  // Salida: 15 y 28 son coprimos: True
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Dos números son coprimos si su máximo común divisor es 1.
programa32(X, Y) :- gcd(X, Y, 1).  % Verifica si el MCD de X e Y es 1.

% Ejemplo de uso:
% ?- programa32(15, 28).  % Debería devolver true.
% ?- programa32(12, 18).  % Debería devolver false.
% ----------------------------------------------
