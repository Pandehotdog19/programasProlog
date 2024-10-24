% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que extrae N números aleatorios
%              de un rango dado. Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     static void Main(string[] args)
%     {
%         int N = 3; // Número de elementos aleatorios a seleccionar
%         int M = 5; // Máximo número en el rango
%         Random random = new Random();
%         List<int> result = new List<int>();
%         
%         // Generar lista de números en el rango [1, M]
%         List<int> numbers = Enumerable.Range(1, M).ToList();
%         
%         // Seleccionar N números aleatorios sin repetición
%         for (int i = 0; i < N; i++)
%         {
%             int index = random.Next(numbers.Count); // Índice aleatorio
%             result.Add(numbers[index]);             // Añadir el número seleccionado
%             numbers.RemoveAt(index);                // Eliminar el número seleccionado para evitar repeticiones
%         }
%         
%         Console.WriteLine("Números aleatorios en rango: " + string.Join(", ", result));
%     }
% }
% ----------------------------------------------

% Genera un rango de números desde Min hasta Max.
range(Min, Max, [Min|R]) :- Min < Max, !, Next is Min + 1, range(Next, Max, R).
range(Max, Max, [Max]).

% Extrae N números aleatorios de un rango dado [1, M].
lotto(N, M, L) :- 
    range(1, M, R),       % Genera la lista de números en el rango.
    rnd_select(R, N, L).  % Selecciona N elementos aleatorios de la lista.

% Ejemplo de uso:
% ?- lotto(3, 5, L).
% L = [X1, X2, X3].  (donde X1, X2 y X3 son números aleatorios en el rango [1, 5]).
% ----------------------------------------------
