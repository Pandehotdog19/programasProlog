% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que elimina 
%              cada n-ésimo elemento de una lista.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que elimina cada n-ésimo elemento de una lista en C#.
%     static List<T> DropEveryNth<T>(List<T> list, int n)
%     {
%         if (list == null || list.Count == 0 || n <= 0)
%             throw new ArgumentException("Lista no válida o valor de N incorrecto.");
%         
%         List<T> result = new List<T>();
%         for (int i = 0; i < list.Count; i++)
%         {
%             // Si el índice no es divisible por N, se agrega el elemento.
%             if ((i + 1) % n != 0)
%                 result.Add(list[i]);
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' };
%         List<char> resultado = DropEveryNth(lista, 3);
%         
%         Console.WriteLine(string.Join(", ", resultado)); // Salida: a, b, d, e, g, h, j
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Elimina cada n-ésimo elemento de una lista.
% Utiliza un contador para determinar cuándo eliminar un elemento.
programa16(L, N, R) :- programa16(L, N, N, R).  % Inicializa el contador en N.

% Caso base: cuando la lista está vacía, el resultado es vacío.
programa16([], _, _, []).

% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
programa16([_|T], 1, N, R) :- programa16(T, N, N, R).

% Caso recursivo: disminuye el contador y conserva el elemento.
programa16([H|T], K, N, [H|R]) :- K > 1, K1 is K - 1, programa16(T, K1, N, R).

% Ejemplo de uso:
% ?- programa16([a,b,c,d,e,f,g,h,i,j], 3, R).
% R = [a, b, d, e, g, h, j].
% ----------------------------------------------
