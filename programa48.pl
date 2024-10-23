% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 22 de octubre de 2024
% Descripción: Construye un árbol binario de búsqueda a partir de una lista de enteros.
%              Un árbol binario de búsqueda es un árbol en el cual, para cada nodo,
%              todos los elementos en el subárbol izquierdo son menores y en el
%              subárbol derecho son mayores.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% public class TreeNode
% {
%     public int Value;         // Valor del nodo
%     public TreeNode Left;     // Referencia al subárbol izquierdo
%     public TreeNode Right;    // Referencia al subárbol derecho
% 
%     public TreeNode(int value)
%     {
%         Value = value;       // Asigna el valor al nodo
%         Left = null;        // Inicializa el subárbol izquierdo como vacío
%         Right = null;       // Inicializa el subárbol derecho como vacío
%     }
% }
% 
% public class Program
% {
%     // Función para construir un árbol binario de búsqueda a partir de una lista de enteros
%     public static TreeNode ConstructBST(int[] values)
%     {
%         TreeNode root = null; // Inicializa la raíz del árbol
%         foreach (var value in values)
%         {
%             root = Add(value, root); // Añade cada valor al árbol
%         }
%         return root; // Retorna la raíz del árbol
%     }
% 
%     // Función para añadir un nodo al árbol binario de búsqueda
%     public static TreeNode Add(int value, TreeNode node)
%     {
%         if (node == null)
%         {
%             return new TreeNode(value); // Crea un nuevo nodo si la posición es vacía
%         }
% 
%         // Comparar y decidir dónde añadir el nodo
%         if (value < node.Value)
%         {
%             node.Left = Add(value, node.Left); // Añadir al subárbol izquierdo
%         }
%         else
%         {
%             node.Right = Add(value, node.Right); // Añadir al subárbol derecho
%         }
%         return node; // Retorna el nodo actual
%     }
% 
%     // Función principal para probar el código
%     static void Main()
%     {
%         int[] values = { 5, 3, 7, 2, 4, 6, 8 }; // Lista de valores
%         TreeNode bstRoot = ConstructBST(values); // Construir el árbol
%         Console.WriteLine("Árbol binario de búsqueda construido con éxito.");
%     }
% }
% ----------------------------------------------

% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo, todos los
% elementos en el subárbol izquierdo son menores y en el subárbol derecho son mayores.
programa48([], nil).  % Caso base: lista vacía resulta en un árbol vacío.
programa48([X|Xs], T) :- 
    programa48(Xs, T1),  % Construye el árbol a partir de los elementos restantes.
    add(X, T1, T).      % Añade el nuevo elemento al árbol.

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).  % Si el árbol está vacío, crea un nuevo nodo.
add(X, t(Root, L, R), t(Root, NL, R)) :- 
    X < Root,               % Si X es menor que el nodo raíz,
    add(X, L, NL).          % añade X al subárbol izquierdo.
add(X, t(Root, L, R), t(Root, L, NR)) :- 
    X >= Root,              % Si X es mayor o igual que el nodo raíz,
    add(X, R, NR).          % añade X al subárbol derecho.

% Ejemplo de uso:
% ?- programa48([5, 3, 7, 2, 4, 6, 8], T). % Construye un árbol binario de búsqueda a partir de la lista y lo almacena en T.
