   M S B A M L   `   `   `  ����F  BTaskManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:TaskManager.Windows.PagesTaskManager.Windows.Pages  5      .    (TaskManager.Windows.Pages.EmpCurTaskPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:TaskManager.Windows.Pages     5      $	��700��5      $
��1100��6     N� Title$  EmpCurTaskPage��5	       N� ShowsNavigationUI .  .��5      �  � RowDefinitions 5   
   �� 5      $��1* �6   �� 5      $	��14* �6    � ColumnDefinitions 5   
   �� 5      $��1* �6   �� 5      $��3* �6   .+�5   
   �� $��2��6   $��2��6"   ���#32323E �� CornerRadius$ 20��6K    J� Opacity$	 0.9Q�6]   5      �� 5   
   $��0��6   $��2��6!   $	 0.9Q�62   ���#27272F$ 	20,0,0,20��6U   �� 5   
   $��0��6   $��0��6%    �� Orientation$ 
Horizontal=�62   .+�5      A� -   5        $��20��5   4   $��20��6?   $��15,0,0,0q�6K   ���#EB66776]   A� 5      -   5        $��20��5      $��20��6!   $��15,0,0,0q�6-   ���#E1C25B6N   A� 5      $��20��6   $��20��6!   $��15,0,0,0q�6-   ���#54B5456@   5      �� 5   
   $��1��6   $��0��6"   .+�5      �� -   5        $	��fio��5       	  title#��[  6!   6B   �� 5      -   5        $	��pos��5      #��[  6    $��0,5,0,0q�6?   5       �� 5!   
   $��Center=�6   $ 
Horizontal=�62   $��0��6K   $��1��6X   .+�5#      �� -   5        $��0,0,0,0q�5#      $��0��6;   $��1��6H     Btn#��[ 6X   $��
Назад��6u   $	��200��6�   $��38��6�   �� 5$   
   -   5        $��35,0,0,0q�5$      $��0��6$   $��1��61   #��[ 6A   $��Сделано��6^   $	��200��6p   $��38��6|   6�   5%      &   System.Windows.Controls.DataGrid  5'   
   -   5          Name$ gr��5'   Y   $��Center=�6   $��Center=�67   $��20(�6e   $*��$Fonts/golos-ui_regular.ttf #Golos UI)�6s   $��1��6�   $��1��6�   $��35q�6�      AutoGenerateColumns .  ��. 	   Columns	 5+      0  *System.Windows.Controls.DataGridTextColumn  5,      -   5        asf��
   FontSize$
 15Q�5,   4      
Foreground �#FFFFFF,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6W      Header$ Название��6a   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6s   ��  �� Path$
 Name�  5-      $
 15Q�6%    �#FFFFFF$ * 6H   $ Кол-во дней��6R    6g   �� $	 Day�  5.      $ * 6%   $
 15Q�6/   $ Статус��6=    �#FFFFFF 6b   �� $ Status�52      53      54      