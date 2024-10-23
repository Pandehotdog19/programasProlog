% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que verifica si 
%              una lista es un palíndromo.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para verificar si una lista es un palíndromo.
%     static bool IsPalindrome<T>(List<T> list)
%     {
%         // Crea una copia de la lista y la invierte.
%         List<T> reversedList = new List<T>(list);
%         reversedList.Reverse(); // Invierte la lista.
% 
%         // Compara la lista original con la lista invertida.
%         for (int i = 0; i < list.Count; i++)
%         {
%             if (!list[i].Equals(reversedList[i]))
%                 return false; // No son iguales, no es un palíndromo.
%         }
%         return true; // Son iguales, es un palíndromo.
%     }
% 
%     static void Main()
%     {
%         // Define una lista de caracteres.
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'b', 'a' };
% 
%         // Llama a la función IsPalindrome para verificar si es un palíndromo.
%         bool esPalindromo = IsPalindrome(lista);
% 
%         // Imprime el resultado en la consola.
%         Console.WriteLine("¿La lista es un palíndromo? " + esPalindromo);
%     }
% }
% ----------------------------------------------

% Predicado programa6(L) que verifica si la lista L
% es un palíndromo.

programa6(L) :- reverse_list(L, L). % Verifica si la lista es igual a su inversa.

% Ejemplo de uso:
% ?- programa6([a, b, c, b, a]).
% true.
% ===============================================