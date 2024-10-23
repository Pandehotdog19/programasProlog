% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 22 de octubre de 2024
% Descripción: Comprueba si un árbol binario es simétrico.
%              Un árbol es simétrico si sus subárboles izquierdo y derecho son
%              espejos entre sí.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% namespace SymmetricBinaryTree
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
%         // Función que verifica si un árbol binario es simétrico.
%         public static bool IsSymmetric(Node root)
%         {
%             return IsMirror(root, root); // Verifica si el árbol es espejo de sí mismo.
%         }
% 
%         // Función auxiliar que verifica si dos árboles son espejos entre sí.
%         private static bool IsMirror(Node node1, Node node2)
%         {
%             if (node1 == null && node2 == null)
%                 return true; // Ambos nodos son nulos, son espejos.
%             if (node1 == null || node2 == null)
%                 return false; // Uno de los nodos es nulo, no son espejos.
% 
%             // Compara los nodos y verifica los subárboles.
%             return (node1.Value == node2.Value) &&
%                    IsMirror(node1.Left, node2.Right) &&
%                    IsMirror(node1.Right, node2.Left);
%         }
% 
%         // Función principal para probar el código.
%         static void Main()
%         {
%             Node root = new Node('x');
%             root.Left = new Node('y');
%             root.Right = new Node('y');
%             root.Left.Left = new Node('z');
%             root.Right.Right = new Node('z');
% 
%             bool programa47 = IsSymmetric(root);
%             Console.WriteLine("El árbol es simétrico: " + programa47);
%         }
%     }
% }
% ----------------------------------------------

% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
programa47(nil).  % Un árbol vacío es simétrico.
programa47(t(_, L, R)) :- mirror(L, R).  % Verifica si los subárboles son espejos.

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).  % Dos árboles vacíos son espejos.
mirror(t(_, L1, R1), t(_, L2, R2)) :- 
    mirror(L1, R2),  % El subárbol izquierdo de uno es espejo del subárbol derecho del otro.
    mirror(R1, L2).  % El subárbol derecho de uno es espejo del subárbol izquierdo del otro.

% Ejemplo de uso:
% ?- programa47(T). % Comprueba si el árbol T es simétrico.
