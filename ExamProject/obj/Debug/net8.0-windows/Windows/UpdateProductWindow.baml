   M S B A M L   `   `   `  ����F  BExamProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:ExamProject.WindowsExamProject.Windows  5   	   -    'ExamProject.Windows.UpdateProductWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:ExamProject.Windows     5   	     � Title$/  )Редактирование товара��5      $	��300��6#   $	��510��60    � 	Resources 5	       �� 
TargetType �� Property �� Value��%�   '��       '�� m     �� 5
   
   " ��6   .�5      ��  � ��$ 28��6'   �� 5       � ��$	 140��6&   5      �� 5   
   " ��6   .�5      ��  � ��$	 300��6&   �� 5       � ��$ 28��6'   5      5      .��5      ��  �� Orientation$ Vertical=�6   .+�5   
   �� $ 
Horizontal=�6   .+�5      �� $��Артикул��6   $	��140��6&   �� 5      -   5         ��Name$ articleTextBox��5      $��AAA001��6.    �� 	MaxLength$ 6��6<    �� TextWrapping$
 Wrap=�6J   5      �� 5   
   $ 
Horizontal=�6   .+�5      �� $��Название��6   �� 5      -   5        $ nameTextBox��5      $��Кольцо��6+   $
 Wrap=�69   5      �� 5   
   $ 
Horizontal=�6   .+�5      �� $��Цена��6   �� 5      -   5        $ firstPriceTextBox��5      $
��7800��62   $
 Wrap=�6>   5      �� 5    
   $ 
Horizontal=�6   .+�5!      �� $#��Id производителя��6   �� 5"      -   5        $ manufacturerTextBox��5"      $��2��63   $
 Wrap=�6<   5#      �� 5$   
   $ 
Horizontal=�6   .+�5%      �� $��Категория��6   �� 5&      -   5        $ categoryTextBox��5&      $��6��6/   $
 Wrap=�68   5'      �� 5(   
   $ 
Horizontal=�6   .+�5)      �� $��Скидка��6   �� 5*      -   5        $ discountTextBox��5*      $��30��6/   $
 Wrap=�69   5+      �� 5,   
   $ 
Horizontal=�6   .+�5-      �� $��Количество��6   �� 5.      -   5        $ quantityTextBox��5.      $��5��6/   $
 Wrap=�68   5/      �� 50   
   $ 
Horizontal=�6   .+�51      �� $��Описание��6   �� 52      -   5        $ descriptionTextBox��52      $$��Кольцо из золота��62   $
 Wrap=�6J   53      �� 54   
   -	   5        	 ��Name$	 updateButton��54      $ ��Редактировать��6B   $	��100��6Z   $
��Left=�6f   $	��5 5q�6�   55      56      