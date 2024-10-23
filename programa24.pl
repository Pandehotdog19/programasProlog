% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que extrae N números
%              aleatorios de un rango dado.
%              Incluye una versión comentada en C#.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que genera una lista de números en un rango.
%     static List<int> Range(int start, int end)
%     {
%         List<int> rangeList = new List<int>();
%         for (int i = start; i <= end; i++)
%         {
%             rangeList.Add(i); // Añade cada número al rango.
%         }
%         return rangeList; // Retorna la lista de números.
%     }
% 
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
%     // Función principal que genera N números aleatorios de un rango.
%     static void Main()
%     {
%         int N = 6; // Cantidad de números aleatorios a extraer.
%         int M = 49; // Límite superior del rango.
%         List<int> rango = Range(1, M); // Genera una lista de números del 1 al M.
%         List<int> seleccionados = RandomSelect(rango, N); // Extrae N elementos aleatorios.
%         
%         Console.WriteLine(string.Join(", ", seleccionados)); // Muestra los números seleccionados.
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Extrae N números aleatorios de un rango dado.
% Utiliza la función range para generar la lista de números
% y luego selecciona aleatoriamente.

programa24(N, M, L) :- 
    range(1, M, R),    % Genera una lista de números del 1 al M.
    rnd_select(R, N, L). % Selecciona N elementos aleatorios de la lista R.

% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- 
    I < K, 
    I1 is I + 1, 
    range(I1, K, R).

% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []).  % Caso base: si N es 0, la lista resultante es vacía.
rnd_select(L, N, [X|R]) :- 
    length(L, Len),            % Obtiene la longitud de la lista.
    random(1, Len, I),         % Genera un índice aleatorio entre 1 y Len.
    element_at(X, L, I),       % Obtiene el elemento en la posición I de la lista.
    delete(L, X, L1),          % Elimina el elemento seleccionado de la lista.
    N1 is N - 1,               % Decrementa N.
    rnd_select(L1, N1, R).     % Llama recursivamente para seleccionar el resto.

% Ejemplo de uso:
% ?- programa24(6, 49, L).
% L = [X1, X2, X3, X4, X5, X6].  (donde X1, X2, ..., X6 son números aleatorios del 1 al 49).
% ----------------------------------------------
