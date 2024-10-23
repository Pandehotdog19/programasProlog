% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que genera una tabla de verdad
%              para una expresión lógica en dos variables.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class Program
% {
%     // Función que evalúa una expresión lógica dada A y B.
%     static bool EvaluateExpression(bool A, bool B, Func<bool, bool, bool> expr)
%     {
%         return expr(A, B);  // Llama a la función de expresión con los valores A y B.
%     }

%     // Función que genera la tabla de verdad para una expresión lógica.
%     static void TruthTable(Func<bool, bool, bool> expr)
%     {
%         Console.WriteLine("A B Result");
%         for (int i = 0; i <= 1; i++)  // Itera sobre los valores posibles de A (0 y 1).
%         {
%             for (int j = 0; j <= 1; j++)  // Itera sobre los valores posibles de B (0 y 1).
%             {
%                 bool A = Convert.ToBoolean(i);  // Convierte i a booleano.
%                 bool B = Convert.ToBoolean(j);  // Convierte j a booleano.
%                 bool result = EvaluateExpression(A, B, expr);  // Evalúa la expresión.
%                 Console.WriteLine($"{A} {B} {result}");  // Imprime los valores de A, B y el resultado.
%             }
%         }
%     }

%     // Función principal.
%     static void Main()
%     {
%         // Ejemplo de expresión lógica: A AND B
%         Func<bool, bool, bool> expression = (A, B) => A && B;  // Definición de la expresión lógica.
%         TruthTable(expression);  // Genera la tabla de verdad.
%         // Ejemplo de salida:
%         // A B Result
%         // False False False
%         // False True False
%         // True False False
%         // True True True
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Genera una tabla de verdad para una expresión lógica en dos variables.
table(A, B, Expr) :- 
    write(A), write(' '), write(B), write(' '), 
    call(Expr), nl, fail.
table(_, _, _).

% Ejemplo de uso: Define una expresión lógica y genera la tabla de verdad.
programa41 :- 
    % Define la expresión lógica: A AND B
    Expr = (A, B) :- A, B, !,  % Cambia esto para probar otras expresiones.
    table(0, 0, Expr),
    table(0, 1, Expr),
    table(1, 0, Expr),
    table(1, 1, Expr).

% Ejemplo de uso:
% ?- programa41.
% ----------------------------------------------
