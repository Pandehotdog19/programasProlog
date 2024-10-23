% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que agrupa 
%              duplicados consecutivos de una lista
%              en sublistas.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para agrupar duplicados consecutivos en C#.
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         var packedList = new List<List<T>>();
%         if (list == null || list.Count == 0) return packedList; // Manejo de lista vacía.
%         
%         List<T> currentGroup = new List<T> { list[0] }; // Comienza el grupo con el primer elemento.
% 
%         for (int i = 1; i < list.Count; i++)
%         {
%             // Si el elemento actual es igual al último del grupo actual, agrégalo.
%             if (EqualityComparer<T>.Default.Equals(list[i], currentGroup[currentGroup.Count - 1]))
%             {
%                 currentGroup.Add(list[i]);
%             }
%             else
%             {
%                 packedList.Add(currentGroup); // Agrega el grupo actual a la lista de grupos.
%                 currentGroup = new List<T> { list[i] }; // Inicia un nuevo grupo.
%             }
%         }
% 
%         packedList.Add(currentGroup); // Agrega el último grupo.
%         return packedList; // Devuelve la lista de grupos.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'd' };
%         List<List<char>> listaAgrupada = Pack(lista);
% 
%         foreach (var grupo in listaAgrupada)
%         {
%             Console.WriteLine("[" + string.Join(", ", grupo) + "]");
%         }
%     }
% }
% ----------------------------------------------

% Predicado programa9/2 que agrupa duplicados consecutivos en sublistas.

% Caso base: una lista vacía se agrupa como una lista vacía.
programa9([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
programa9([X|Xs], [[X|Ys]|Zs]) :- 
    transfer(X, Xs, Ys, Rest), 
    programa9(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []). % Caso base: no hay más elementos.
% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- 
    X \= Y.
% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- 
    transfer(X, Xs, Ys, Rest).

% Ejemplo de uso:
% ?- programa9([a, a, b, b, c, a, a, d], R).
% R = [[a, a], [b, b], [c], [a, a], [d]].
% ===============================================
