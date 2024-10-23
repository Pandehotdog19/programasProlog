% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que duplica 
%              los elementos de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para duplicar los elementos de una lista en C#.
%     static List<T> Dupli<T>(List<T> list)
%     {
%         var duplicatedList = new List<T>();
%         
%         // Recorre cada elemento de la lista original.
%         foreach (var element in list)
%         {
%             duplicatedList.Add(element);  // Agrega el elemento una vez.
%             duplicatedList.Add(element);  // Agrega el elemento de nuevo.
%         }
%         
%         return duplicatedList; // Devuelve la lista duplicada.
%     }
% 
%     static void Main()
%     {
%         var list = new List<int> { 1, 2, 3, 4 };
%         var duplicatedList = Dupli(list);
%         
%         // Imprime los elementos duplicados.
%         Console.WriteLine(string.Join(", ", duplicatedList));
%     }
% }
% ----------------------------------------------

% Duplica los elementos de una lista.
% Caso base: la lista vacía se mantiene vacía.
programa14([], []).                                                % Caso base: lista vacía.

% Caso recursivo: duplica el primer elemento y continúa con el resto.
programa14([H|T], [H,H|R]) :- programa14(T, R).                         % Duplica el primer elemento y procesa el resto.

% Ejemplo de uso:
% ?- programa14([1,2,3], R).
% R = [1, 1, 2, 2, 3, 3].
% ===============================================
