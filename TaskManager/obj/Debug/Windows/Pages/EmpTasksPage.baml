   M S B A M L   `   `   `  ����F  BTaskManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:TaskManager.Windows.PagesTaskManager.Windows.Pages  5      ,    &TaskManager.Windows.Pages.EmpTasksPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:TaskManager.Windows.Pages     5      -   5        $	��xxx��5
   2   $	��700��5      $
��1100��6     N� Title$  EmpTasksPage��5	       N� ShowsNavigationUI .  ��5
      Z� .��5      �  � RowDefinitions 5   
   �� 5      $��1* �6   �� 5      $	��14* �6    � ColumnDefinitions 5   
   �� 5      $��1* �6   �� 5      $��3* �6   .+�5   
   �� $��2��6   $��2��6"   ���#32323E �� CornerRadius$ 20��6K    J� Opacity$	 0.9Q�6]   5      �� 5   
   $��0��6   $��2��6!   $	 0.9Q�62   ���#27272F$ 	20,0,0,20��6U   �� 5   
   $��0��6   $��0��6%    �� Orientation$ 
Horizontal=�62   .+�5      A� -   5        $��20��5      $��20��6!   $��15,0,0,0q�6-   ���#EB66776N   A� 5      -   5        $��20��5      $��20��6!   $��15,0,0,0q�6-   ���#E1C25B6N   A� 5      $��20��6   $��20��6!   $��15,0,0,0q�6-   ���#54B5456@   5      �� 5   
   $��1��6   $��0��6"   .+�5      �� -   5        $	��fio��5       	  title#��[  6!   6B   �� 5       -   5        $	��pos��5       #��[  6    $��0,5,0,0q�6?   �� 5!      -   5          Btn#��[ 5!      $��	0,450,0,0q�62   $	��250��6E   $��
Выйти��6Q   6a   5"      �� 5#   
   -   5        $��0��5#   &   $��1��63   #��[ 6C   $��Просмотр��6`   $	��200��6s   $��38��6   $��0q�6�   &   System.Windows.Controls.DataGrid  5$   
   -   5          Name$ gr��5$      $��20(�6   $*��$Fonts/golos-ui_regular.ttf #Golos UI)�6-   $��1��6_   $��1��6m   $��35q�6}      AutoGenerateColumns .  ��. 	   Columns	 5'      0  *System.Windows.Controls.DataGridTextColumn  5(      
   
Foreground
 �#FFFFFF   FontSize$ 15Q�6:   ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6H      Header$ Название��6R   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6d   ��  �� Path$
 Name�  5*      
 �#FFFFFF$ 15Q�6:   $ * 6H   $ Статус��6R    6b   �� $ Status�  5+      
 �#FFFFFF$ 15Q�6:   $ * 6I   $ Дата начала��6S    6i   �� $ 	StartDate� �� StringFormat$ {0: dd.MM.yyyy}��  5,      
 �#FFFFFF$ 15Q�6:   $ * 6H   $! Дата окончания��6R    6k   �� $ EndDate�$ {0: dd.MM.yyyy}��5/      50      51      