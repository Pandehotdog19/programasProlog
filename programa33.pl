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

% Calcula la función totiente de Euler, que cuenta cuántos números menores que M son coprimos con M.
programa33(1, 1).  % Caso base: el totiente de 1 es 1.
programa33(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).  % Inicia el cálculo para M > 1.

% Acumulador para calcular el totiente.
totient_acc(_, 0, Acc, Acc).  % Caso base del acumulador: si K es 0, devuelve el acumulador.
totient_acc(M, K, Acc, Phi) :- K > 0, coprime(M, K), Acc1 is Acc + 1, K1 is K - 1, totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- K > 0, \\+ coprime(M, K), K1 is K - 1, totient_acc(M, K1, Acc, Phi).  % Continúa sin contar si no es coprimo.

% Ejemplo de uso:
% ?- programa33(10, Phi).  % Debería devolver Phi = 4.
% ----------------------------------------------
