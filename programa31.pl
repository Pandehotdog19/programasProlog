% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que calcula el
%              máximo común divisor (MCD) usando el
%              algoritmo de Euclides.
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
%     static void Main()
%     {
%         int num1 = 48;  // Primer número.
%         int num2 = 18;  // Segundo número.
%         int mcd = GCD(num1, num2);  // Calcula el MCD.
%         
%         Console.WriteLine($"El MCD de {num1} y {num2} es: {mcd}");  // Salida: El MCD de 48 y 18 es: 6
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Calcula el máximo común divisor usando el algoritmo de Euclides.
programa31(X, 0, X) :- X > 0.  % Caso base: si Y es 0, el MCD es X.
programa31(X, Y, G) :- Y > 0, R is X mod Y, programa31(Y, R, G).  % Llama recursivamente.

% Ejemplo de uso:
% ?- programa31(48, 18, G).
% G = 6.
% ?- programa31(54, 24, G).
% G = 6.
% ----------------------------------------------
