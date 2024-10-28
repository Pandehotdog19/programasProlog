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


% combinación/3 genera todas las combinaciones de K elementos de una lista.
programa32(0, _, []).
programa32(K, [H|T], [H|R]) :-
    K > 0,
    K1 is K - 1,
    programa32(K1, T, R).
programa32(K, [_|T], R) :-
    K > 0,
    programa32(K, T, R).

% Ejemplo de uso:
% ?- programa32(15, 28).  % Debería devolver true.
% ?- programa32(12, 18).  % Debería devolver false.
% ----------------------------------------------
