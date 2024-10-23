% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que extrae un número
%              dado de elementos aleatorios de una lista.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que extrae N elementos aleatorios de una lista.
%     static List<T> RandomSelect<T>(List<T> list, int n)
%     {
%         Random random = new Random(); // Crea un generador de números aleatorios.
%         List<T> selected = new List<T>(); // Lista para almacenar los elementos seleccionados.
%         List<T> tempList = new List<T>(list); // Copia la lista original.
% 
%         for (int i = 0; i < n; i++) // Repite N veces.
%         {
%             if (tempList.Count == 0) break; // Sale si la lista está vacía.
%             
%             int index = random.Next(tempList.Count); // Selecciona un índice aleatorio.
%             selected.Add(tempList[index]); // Añade el elemento seleccionado a la lista de resultados.
%             tempList.RemoveAt(index); // Elimina el elemento seleccionado de la lista temporal.
%         }
% 
%         return selected; // Retorna la lista de elementos seleccionados.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5 }; // Lista de enteros.
%         List<int> seleccionados = RandomSelect(lista, 2); // Extrae 2 elementos aleatorios.
%         
%         Console.WriteLine(string.Join(", ", seleccionados)); // Muestra los elementos seleccionados.
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.

programa23(_, 0, []).  % Caso base: si N es 0, la lista resultante es vacía.
programa23(L, N, [X|R]) :- 
    length(L, Len),            % Obtiene la longitud de la lista.
    random(1, Len, I),         % Genera un índice aleatorio entre 1 y Len.
    element_at(X, L, I),       % Obtiene el elemento en la posición I de la lista.
    delete(L, X, L1),          % Elimina el elemento seleccionado de la lista.
    N1 is N - 1,               % Decrementa N.
    programa23(L1, N1, R).     % Llama recursivamente para seleccionar el resto.

% Ejemplo de uso:
% ?- programa23([1, 2, 3, 4, 5], 2, R).
% R = [X1, X2].  (donde X1 y X2 son elementos aleatorios de la lista).
% ----------------------------------------------
