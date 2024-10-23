% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el penúltimo elemento de una lista.
%              La lista debe tener al menos dos elementos.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función genérica para encontrar el penúltimo elemento de una lista.
%     static T programa2<T>(List<T> list)
%     {
%         // Verifica si la lista tiene al menos dos elementos.
%         if (list == null || list.Count < 2)
%             throw new ArgumentException("La lista debe tener al menos dos elementos.");
% 
%         // Devuelve el penúltimo elemento de la lista.
%         return list[list.Count - 2];
%     }
% 
%     static void Main()
%     {
%         // Define una lista de caracteres.
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
% 
%         // Llama a la función programa2 para obtener el penúltimo elemento.
%         char penultimoElemento = programa2(lista);
% 
%         // Imprime el penúltimo elemento en la consola.
%         Console.WriteLine("El penúltimo elemento es: " + penultimoElemento);
%     }
% }
% ----------------------------------------------

% Predicado programa2(X, List) que determina el penúltimo
% elemento X de la lista List.

% Caso base: el penúltimo elemento es el primer elemento cuando hay exactamente dos elementos.
programa2(X, [X, _]). 

% Caso recursivo: ignora el primer elemento de la lista y sigue evaluando.
programa2(X, [_|T]) :- 
    programa2(X, T).

% Ejemplo de uso:
% ?- programa2(X, [a, b, c, d]).
% X = c.
% ===============================================