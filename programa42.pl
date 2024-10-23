% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que utiliza operadores lógicos para
%              definir expresiones y generar tablas de verdad.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class Program
% {
%     // Funciones para definir operadores lógicos básicos.
%     static bool And(bool A, bool B) => A && B;
%     static bool Or(bool A, bool B) => A || B;
%     static bool Nand(bool A, bool B) => !(A && B);
%     static bool Nor(bool A, bool B) => !(A || B);
%     static bool Xor(bool A, bool B) => A ^ B;
%     static bool Implication(bool A, bool B) => !A || B;
%     static bool Equivalence(bool A, bool B) => A == B;

%     // Función que genera la tabla de verdad para un operador lógico.
%     static void TruthTable(Func<bool, bool, bool> logicalOp)
%     {
%         Console.WriteLine("A B Result");
%         for (int i = 0; i <= 1; i++)
%         {
%             for (int j = 0; j <= 1; j++)
%             {
%                 bool A = Convert.ToBoolean(i);
%                 bool B = Convert.ToBoolean(j);
%                 bool result = logicalOp(A, B);
%                 Console.WriteLine($"{A} {B} {result}");
%             }
%         }
%     }

%     // Función principal.
%     static void Main()
%     {
%         // Genera tablas de verdad para cada operador lógico.
%         Console.WriteLine("AND Table:");
%         TruthTable(And);
%         Console.WriteLine("\nOR Table:");
%         TruthTable(Or);
%         Console.WriteLine("\nNAND Table:");
%         TruthTable(Nand);
%         Console.WriteLine("\nNOR Table:");
%         TruthTable(Nor);
%         Console.WriteLine("\nXOR Table:");
%         TruthTable(Xor);
%         Console.WriteLine("\nImplication Table:");
%         TruthTable(Implication);
%         Console.WriteLine("\nEquivalence Table:");
%         TruthTable(Equivalence);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Utiliza operadores lógicos para definir expresiones y generar tablas de verdad.
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.

% Genera una tabla de verdad para un operador lógico.
table(A, B, Expr) :- 
    write(A), write(' '), write(B), write(' '), 
    call(Expr), nl, fail.
table(_, _, _).

% Ejemplo de uso: Genera tablas de verdad para cada operador lógico.
programa42 :- 
    write('AND Table:'), nl,
    table(0, 0, and),
    table(0, 1, and),
    table(1, 0, and),
    table(1, 1, and),
    nl,
    write('OR Table:'), nl,
    table(0, 0, or),
    table(0, 1, or),
    table(1, 0, or),
    table(1, 1, or),
    nl,
    write('NAND Table:'), nl,
    table(0, 0, nand),
    table(0, 1, nand),
    table(1, 0, nand),
    table(1, 1, nand),
    nl,
    write('NOR Table:'), nl,
    table(0, 0, nor),
    table(0, 1, nor),
    table(1, 0, nor),
    table(1, 1, nor),
    nl,
    write('XOR Table:'), nl,
    table(0, 0, xor),
    table(0, 1, xor),
    table(1, 0, xor),
    table(1, 1, xor),
    nl,
    write('Implication Table:'), nl,
    table(0, 0, impl),
    table(0, 1, impl),
    table(1, 0, impl),
    table(1, 1, impl),
    nl,
    write('Equivalence Table:'), nl,
    table(0, 0, equ),
    table(0, 1, equ),
    table(1, 0, equ),
    table(1, 1, equ).

% Ejemplo de uso:
% ?- programa42.
% ----------------------------------------------
