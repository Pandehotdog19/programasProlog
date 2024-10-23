% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 22 de octubre de 2024
% Descripción: Construye un árbol binario completamente equilibrado con N nodos.
%              Un árbol completamente equilibrado tiene subárboles cuya diferencia
%              de tamaño es como máximo 1.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% namespace BalancedBinaryTree
% {
%     // Definición de un nodo de árbol binario.
%     public class Node
%     {
%         public char Value; // Valor del nodo.
%         public Node Left;  // Referencia al subárbol izquierdo.
%         public Node Right; // Referencia al subárbol derecho.
% 
%         // Constructor para inicializar un nodo con un valor.
%         public Node(char value)
%         {
%             Value = value; // Asigna el valor al nodo.
%             Left = null;   // Inicializa el subárbol izquierdo como vacío.
%             Right = null;  // Inicializa el subárbol derecho como vacío.
%         }
%     }
% 
%     public class Program
%     {
%         // Función para construir un árbol binario completamente equilibrado con N nodos.
%         public static Node BuildBalancedTree(int n)
%         {
%             if (n == 0)
%                 return null; // Caso base: árbol vacío.
% 
%             // Construye un nuevo nodo.
%             Node node = new Node('x');
% 
%             // Divide el número de nodos entre los subárboles izquierdo y derecho.
%             int leftNodes = n / 2;
%             int rightNodes = n - leftNodes - 1; // Resta el nodo actual.
% 
%             // Recursivamente construye los subárboles.
%             node.Left = BuildBalancedTree(leftNodes);
%             node.Right = BuildBalancedTree(rightNodes);
% 
%             return node; // Retorna el nodo construido.
%         }
% 
%         // Función principal para probar el código.
%         static void Main()
%         {
%             int n = 7; // Cambia N para construir un árbol con diferente número de nodos.
%             Node root = BuildBalancedTree(n);
%             Console.WriteLine("Árbol binario equilibrado construido con " + n + " nodos.");
%         }
%     }
% }
% ----------------------------------------------

% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.
programa46(0, nil).  % Caso base: un árbol con 0 nodos es vacío.
programa46(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1,                % Decrementa N en 1 (para el nodo actual).
    divide(N1, N2, N3),         % Divide el número de nodos entre los dos subárboles.
    programa46(N2, L),          % Construye el subárbol izquierdo.
    programa46(N3, R).          % Construye el subárbol derecho.

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2,              % Asigna la mitad de nodos al primer subárbol.
    N2 is N - N1.              % Asigna el resto al segundo subárbol.

% Ejemplo de uso:
% ?- programa46(7, T). % Construye un árbol binario equilibrado con 7 nodos y lo almacena en T.
