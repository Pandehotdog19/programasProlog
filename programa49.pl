% ===============================================
% Autor: Jesus Gonzalez
% Fecha: 22 de octubre de 2024
% Descripción: Genera todos los árboles binarios simétricos y completamente equilibrados
%              con N nodos. Utiliza el paradigma de generar y probar para encontrar
%              todos los árboles que cumplen ambas propiedades.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% public class TreeNode
% {
%     public char Value;           // Valor del nodo (usamos char para simplificar)
%     public TreeNode Left;        // Referencia al subárbol izquierdo
%     public TreeNode Right;       // Referencia al subárbol derecho
% 
%     public TreeNode(char value)
%     {
%         Value = value;          // Asigna el valor al nodo
%         Left = null;           // Inicializa el subárbol izquierdo como vacío
%         Right = null;          // Inicializa el subárbol derecho como vacío
%     }
% }
% 
% public class Program
% {
%     // Función para generar árboles completamente equilibrados
%     public static List<TreeNode> GenerateBalancedTrees(int n)
%     {
%         if (n == 0) return new List<TreeNode> { null }; // Árbol vacío
%         if (n == 1) return new List<TreeNode> { new TreeNode('x') }; // Nodo único
% 
%         List<TreeNode> result = new List<TreeNode>();
%         for (int i = 0; i < n; i++)
%         {
%             var leftTrees = GenerateBalancedTrees(i);
%             var rightTrees = GenerateBalancedTrees(n - 1 - i); // Restar el nodo raíz
% 
%             foreach (var left in leftTrees)
%             {
%                 foreach (var right in rightTrees)
%                 {
%                     TreeNode root = new TreeNode('x'); // Nodo raíz
%                     root.Left = left; // Asigna el subárbol izquierdo
%                     root.Right = right; // Asigna el subárbol derecho
%                     result.Add(root); // Añade el árbol a la lista
%                 }
%             }
%         }
%         return result; // Retorna la lista de árboles
%     }
% 
%     // Función para comprobar si un árbol es simétrico
%     public static bool IsSymmetric(TreeNode left, TreeNode right)
%     {
%         if (left == null && right == null) return true; // Ambos subárboles vacíos
%         if (left == null || right == null) return false; // Solo uno es vacío
%         return left.Value == right.Value && IsSymmetric(left.Left, right.Right) && IsSymmetric(left.Right, right.Left);
%     }
% 
%     // Función principal para encontrar árboles simétricos equilibrados
%     static void Main()
%     {
%         int n = 4; // Cambia N para generar diferentes números de nodos
%         var balancedTrees = GenerateBalancedTrees(n);
%         var symmetricTrees = balancedTrees.FindAll(t => IsSymmetric(t.Left, t.Right));
% 
%         Console.WriteLine($"Número de árboles simétricos y equilibrados con {n} nodos: {symmetricTrees.Count}");
%     }
% }
% ----------------------------------------------

% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
% Utiliza el paradigma de generar y probar para encontrar todos los árboles que cumplen
% ambas propiedades.
programa49(N, Ts) :- 
    findall(T, (cbal_tree(N, T), symmetric(T)), Ts).

% Construye un árbol binario completamente equilibrado con N nodos.
cbal_tree(0, nil).  % Caso base: 0 nodos resulta en un árbol vacío.
cbal_tree(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1,          % Disminuye N para dividir entre subárboles.
    divide(N1, N2, N3),   % Divide N1 entre N2 y N3.
    cbal_tree(N2, L),     % Construye el subárbol izquierdo.
    cbal_tree(N3, R).     % Construye el subárbol derecho.

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2, 
    N2 is N - N1.        % Asegura que la suma de N1 y N2 sea igual a N.

% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).  % Un árbol vacío es simétrico.
symmetric(t(_, L, R)) :- mirror(L, R).  % Comprueba simetría usando la función mirror.

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).  % Dos árboles vacíos son espejos.
mirror(t(_, L1, R1), t(_, L2, R2)) :- 
    mirror(L1, R2), 
    mirror(R1, L2).  % Comprueba si los subárboles son espejos entre sí.

% Ejemplo de uso:
% ?- programa49(4, Trees). % Genera todos los árboles simétricos y equilibrados con 4 nodos y los almacena en Trees.
