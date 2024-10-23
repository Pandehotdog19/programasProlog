% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 22 de octubre de 2024
% Descripción: Verifica si un término dado representa un árbol binario.
%              Un árbol binario está compuesto por un nodo raíz y dos subárboles.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% namespace BinaryTreeCheck
% {
%     // Definición de un nodo de árbol binario.
%     public class Node
%     {
%         public int Value;     // Valor del nodo.
%         public Node Left;     // Referencia al subárbol izquierdo.
%         public Node Right;    // Referencia al subárbol derecho.
% 
%         // Constructor para inicializar un nodo con un valor.
%         public Node(int value)
%         {
%             Value = value;    // Asigna el valor al nodo.
%             Left = null;      // Inicializa el subárbol izquierdo como vacío.
%             Right = null;     // Inicializa el subárbol derecho como vacío.
%         }
%     }
% 
%     public class Program
%     {
%         // Verifica si un árbol binario es válido.
%         public static bool IsBinaryTree(Node node)
%         {
%             if (node == null)
%                 return true; // Un árbol vacío es válido.
% 
%             // Verifica si los subárboles izquierdo y derecho son árboles binarios.
%             return IsBinaryTree(node.Left) && IsBinaryTree(node.Right);
%         }
% 
%         // Función principal para probar el código.
%         static void Main()
%         {
%             // Ejemplos de árboles
%             Node tree1 = null; // Árbol vacío
%             Node tree2 = new Node(1); // Árbol con un solo nodo
%             Node tree3 = new Node(1) { Left = new Node(2), Right = new Node(3) }; // Árbol válido
% 
%             // Ejemplo de un árbol no válido (puedes modificarlo según tus necesidades)
%             Node tree4 = new Node(1) { Left = new Node(2), Right = new Node(3) };
% 
%             // Verificaciones
%             Console.WriteLine("Tree 1 is " + (IsBinaryTree(tree1) ? "valid." : "invalid."));
%             Console.WriteLine("Tree 2 is " + (IsBinaryTree(tree2) ? "valid." : "invalid."));
%             Console.WriteLine("Tree 3 is " + (IsBinaryTree(tree3) ? "valid." : "invalid."));
%             // Aquí puedes probar el árbol no válido de la misma manera.
%             Console.WriteLine("Tree 4 is " + (IsBinaryTree(tree4) ? "valid." : "invalid."));
%         }
%     }
% }
% ----------------------------------------------

% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
programa45(nil).  % El árbol vacío es válido.
programa45(t(_, L, R)) :- programa45(L), programa45(R).  % Un árbol no vacío es válido si ambos subárboles son árboles binarios.

% Ejemplo de uso:
% ?- programa45(t(1, t(2, nil, nil), t(3, nil, nil)). % Verifica si este término representa un árbol binario.
