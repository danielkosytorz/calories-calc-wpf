   M S B A M L   `   `   `  ����L  HKalkulatorKalorii, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:KalkulatorKaloriiKalkulatorKalorii  5   	   "    KalkulatorKalorii.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   1localclr-namespace:KalkulatorKalorii     5   	   b ^MaterialDesignThemes.Wpf, Version=4.1.0.2556, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	     � Title$  
MainWindow��5	   	   $	��600��6   $
��1024��6)   ���	#FF0488C5 � AllowsTransparency .  � WindowStyle$
 None=�6g    � WindowStartupLocation$ CenterScreen=�6z   .��5
      � .+�5   
   �� ���#2e4d5f �� CornerRadius$ 20��6&   $��20,20,850,20q�68   ._�5      �� $��10q�6   .+�5      �� $��	Dashboard��6    �� TextAlignment$ Center=�6-   $��26(�6D   $
��Bold"�5       
�������$��WarHeliosCondCBold)�6E   �� 5      6   � 5      $��40��6   .+�5      ��  �� Orientation$ 
Horizontal=�6!   .+�5      �� $��Icons/home_Icon.png��6    $��24��6=   $��24��6H   $��10,0,0,0q�6T   6h   �� 5      $
��Main��6!   $��12(�60   $
��Bold"�5       
�������$	��100��6F   $��10,0,0,0q�6R   $
��Left=�5   M   $��WarHeliosCondCBold)�6o   ��6    Z� ��66   Z� 6o   5      5      � 5      $��40��6   $��Bottom=�6#   .+�5      �� $ 
Horizontal=�6!   .+�5      �� $��Icons/profil_Icon.png��6    $��24��6?   $��24��6J   $��10,0,0,0q�6V   6j   �� 5      -   5        $��Profile��5   !   $��12(�63   $
��Bold"�5       
�������$	��100��6F   $��10,0,0,0q�6R   $
��Left=�5   M   $��WarHeliosCondCBold)�5   ?   ��5       Z� ��66   Z� 5   ?   5       5!      � 5"      $��40��6   $��Bottom=�6#   .+�5#      �� $ 
Horizontal=�6!   .+�5$      �� $��Icons/body_Icon.png��6    $��24��6=   $��24��6H   $��10,0,0,0q�6T   6h   �� 5%      -   5        $
��Body��5%   !   $��12(�60   $
��Bold"�5&       
�������$	��100��6F   $��10,0,0,0q�6R   $
��Left=�5'   M   $��WarHeliosCondCBold)�5(   <   ��5'       Z� ��66   Z� 5(   <   5*      5+      � 5,      $��40��6   $��Bottom=�6#   .+�5-      �� $ 
Horizontal=�6!   .+�5.      �� $��Icons/logout_Icon.png��6    $��24��6?   $��24��6J   $��10,0,0,0q�6V   6j   �� 5/      -   5        $��Logout��5/   !   $��12(�62   $
��Bold"�50       
�������$	��100��6F   $��10,0,0,0q�6R   $
��Left=�51   M   $��WarHeliosCondCBold)�52   6   ��51       Z� ��66   Z� 52   6   54      55      56      57      �� 59   
   ���#2e4d5f$ 20��6&   $��197,20,10,20q�68   ._�5:      �  � ColumnDefinitions 5;      �� 5<      $��1* �6'   �� 5=      $��1* �6'   �� 5>      $��1* �6'    � RowDefinitions 5@      �� 5A      $��1* �6$   �� 5B      $��6* �6$   �� 5C      $��1* �6$   .+�5F      �� $��0��6   $��0��6%   $
��Food��65   $��40(�6D   
�������$��Center=�5G   +   $��Center=�5H      $��Stretch=�63   $��Stretch=�6X   $
��Bold"�5I      $��WarHeliosCondCBold)�6*   �� 5J      $��10q�6   $��0��6)   $��1��69   .+�5K      �� $��	Breakfast��6   $��20(�60   $��Center=�6>   $��Center=�6Y   $��WarHeliosCondCBold)�6v   
�������6�   �� 5L      -   5        	 ��Name$	 ListBoxBreakfast��5L      $��WarHeliosCondCBold)�68   $��Center=�6X   $��Center=�6u   $��85��6�   $��5,0,5,0q�6�   $	��242��6�   
���������6�   Z� 6�   �� 5M      $��Dinner��6   $��20(�6-   $��Center=�6;   $��Center=�6X   $��WarHeliosCondCBold)�6s   
�������6�   �� 5N      -   5        $	 ListBoxDinner��5N   G   $��85��6   $��5,0,5,0q�6*   $	��242��6;   $��WarHeliosCondCBold)�6^   
���������6~   Z� 6�   �� 5O      $��Supper��6   $��20(�6-   $��Center=�6;   $��Center=�6V   $��WarHeliosCondCBold)�6s   
�������6�   �� 5P      -   5        $	 ListBoxSupper��5P   G   $��85��6   $��5,0,5,0q�6*   $	��242��6;   $��WarHeliosCondCBold)�6^   
���������6~   Z� 6�   �� 5R      $��10q�6!   $��0��6-   $��1��6=   $ 
Horizontal=�6J   .+�5S      �� -   5        $��Add Food��5T      $��12(�6,   
�������$	��170��6N   $
��Left=�5U   M   $��WarHeliosCondCBold)�5V   )   $��Center=�6I   $��Center=�6f   $
��Bold"�6�   ��5U       Z� ��66   Z� 5V   �   �� 5X      -   5        $��Delete Food��5Y      $��12(�6/   $
��Bold"�5Z       
�������$
��Left=�5[   M   $��WarHeliosCondCBold)�5\   ,   $��Center=�6L   $��Center=�6i   ��5[       Z� ��66   Z� 5\   i   5^      5_      �� 5c      $��0��6   $��1��6%   $��	Exercises��65   $��40(�6I   
�������$��Center=�5d   +   $��Center=�5e      $��Stretch=�63   $��Stretch=�6X   $
��Bold"�5f      $��WarHeliosCondCBold)�6*   �� 5h      $��10q�6   $��1��6)   $��1��69   .+�5i      �� -	   5        $	 ListBoxExercises��5i   I   $	��325��6   $��5,35,5,0q�6+   $	��242��6=   $��WarHeliosCondCBold)�6c   
���������6�   Z� 6�   �� 5j      $��10q�6!   $��0��6-   $��1��6=   $ 
Horizontal=�6J   .+�5k      �� -
   5        $��Add Exercise��5l      $��12(�5m      $
��Bold"�5n       
�������$	��155��6F   $
��Left=�5o   M   $��WarHeliosCondCBold)�5p   -   ��5o       Z� ��66   Z� 5p   -   �� 5r      -   5        $��Delete Exercise��5s      $��12(�5t      $
��Bold"�5u       
�������$
��Left=�5v   M   $��WarHeliosCondCBold)�5w   0   ��5v       Z� ��66   Z� 5w   0   5y      5{      �� 5}      $��0��6   $��2��6%   $��Summary��65   $��40(�6G   
�������$��Stretch=�5~   +   $��Stretch=�5      $��Center=�6;   $��Center=�6X   $
��Bold"�5�      $��WarHeliosCondCBold)�6*   �� 5�      -   5        $��2��5�      $��1��6&   $��Previous��66   $��42(�5�      
�������$��10,0,0,0q�6;   $
��Left=�5�   M   $
��45,0q�5�   1   $��WarHeliosCondCBold)�6?   ��5�       Z� ��66   Z� 5�   ?   �� 5�      -   5        $��2��5�      $��2��6&   $
��Next��66   $��42(�5�      
�������$��10,0,0,0q�6;   $
��Left=�5�   M   $
��79,0q�5�   0   $��WarHeliosCondCBold)�6>   ��5�       Z� ��66   Z� 5�   >   � 5�      $��1��6   $��2��6$   .+�5�      �� $
��5,12q�6!   $ Vertical=�6/   .+�5�      �� $ 
Horizontal=�6%   .+�5�      �� $��
Calories: ��6$   
�������$��20(�6L   $��Center=�6Z   $��Center=�6w   $��Center=�6�   $��Center=�6�   $��10 0 0 0q�6�   $��WarHeliosCondCBold)�6�   �� 5�      -   5        
 ��Name$
 TextBlockCaloriesSummary��5�   I   
�������$��20(�6;   $��35��6k   $��0 0 0 0q�6w    �� Padding$ 0 3 0 0q�6�   5�      �� 5�      $ 
Horizontal=�6%   .+�5�      �� $��	Protein: ��6$   
�������$��20(�6K   $��Center=�6Y   $��Center=�6v   $��Center=�6�   $��Center=�6�   $��10 0 0 0q�6�   $��WarHeliosCondCBold)�6�   �� 5�      -   5        $
 TextBlockProteinSummary��5�   I   
�������$��20(�6;   $��35��6j   $��0 0 0 0q�6v   $ 0 3 0 0q�6�   5�      �� 5�      $ 
Horizontal=�6%   .+�5�      �� $��Carbohydrates: ��6$   
�������$��20(�6Q   $��Center=�6_   $��Center=�6|   $��Center=�6�   $��Center=�6�   $��10 0 0 0q�6�   $��WarHeliosCondCBold)�6�   �� 5�      -   5        $#
 TextBlockCarbohydratesSummary��5�   I   
�������$��20(�6;   $��35��6p   $��0 0 0 0q�6|   $ 0 3 0 0q�6�   5�      �� 5�      $ 
Horizontal=�6%   .+�5�      �� $��Fat: ��6$   
�������$��20(�6G   $��Center=�6U   $��Center=�6r   $��Center=�6�   $��Center=�6�   $��10 0 0 0q�6�   $��WarHeliosCondCBold)�6�   �� 5�      -   5        $
 TextBlockFatSummary��5�   I   
�������$��20(�6;   $��35��6f   $��0 0 0 0q�6r   $ 0 3 0 0q�6�   5�      �� 5�      $ 
Horizontal=�6%   .+�5�      �� $��Calories burned: ��6$   
�������$��20(�6S   $��Center=�6a   $��Center=�6~   $��Center=�6�   $��Center=�6�   $��10,0,0,0q�6�   $��WarHeliosCondCBold)�6�   �� 5�      -   5        $$
 TextBlockCaloriesBurnedSummary��5�   I   
�������$��20(�6;   $��35��6q   $��0 0 0 0q�6}   $ 0 4 0 0q�6�   5�      5�      5�      � 5�      $��2��6   $��1��6$   5�      � 5�      $��2��6   $��0��6$   .+�5�      �� $ 
Horizontal=�6!   .+�5�      �� $��Date: ��6    
�������$��26(�6D   $��Center=�6R   $��Center=�6o   $��Center=�6�   $��Center=�6�   $��6,0,0,0q�6�   $��WarHeliosCondCBold)�6�   �� 5�      -   5        $
 TextBlockDate��5�   }   
�������$��26(�67   $��Center=�6E   $��Center=�6b   6}   5�      5�      5�      5�      5�      5�      