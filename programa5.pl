% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que invierte 
%              una lista utilizando un acumulador.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para invertir una lista.
%     static List<T> ReverseList<T>(List<T> list)
%     {
%         List<T> result = new List<T>();
%         for (int i = list.Count - 1; i >= 0; i--)
%         {
%             result.Add(list[i]); // Agrega cada elemento de la lista original en orden inverso.
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         // Define una lista de caracteres.
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
% 
%         // Llama a la función ReverseList para invertir la lista.
%         List<char> listaInvertida = ReverseList(lista);
% 
%         // Imprime la lista invertida en la consola.
%         Console.WriteLine("La lista invertida es: " + string.Join(", ", listaInvertida));
%     }
% }
% ----------------------------------------------

% Predicado programa5(L, R) que invierte la lista L y
% devuelve la lista invertida R.

% Inicia el proceso de inversión con un acumulador vacío.
programa5(L, R) :- programa5(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
programa5([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador.
programa5([H|T], Acc, R) :- 
    programa5(T, [H|Acc], R).  % Llama recursivamente con la cola y el acumulador actualizado.

% Ejemplo de uso:
% ?- programa5([a, b, c, d, e], R).
% R = [e, d, c, b, a].
% ===============================================